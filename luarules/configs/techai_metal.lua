-- Some maps add metal in GameStart, after the shared metal finder initialized.
-- Re-read small areas around starts; keep the result private to TechAI.
local M = {}
local CELL, RADIUS, MERGE_DISTANCE = 16, 900, 64
local MAX_PATCH_CELLS, MAX_PATCH_WIDTH = 1024, 256

local function append(spots,spot)
	if type(spot) ~= 'table' or type(spot.x) ~= 'number' or type(spot.z) ~= 'number' then return end
	for _, old in ipairs(spots) do
		if (spot.x-old.x)^2+(spot.z-old.z)^2 <= MERGE_DISTANCE^2 then return end
	end
	local copy = {}
	for key,value in pairs(spot) do copy[key]=value end
	spots[#spots+1] = copy
end

local function copySpots(existing)
	local spots={}
	for _,spot in ipairs(type(existing)=='table' and existing or {}) do append(spots,spot) end
	return spots
end

local function addPatch(spots,count,minX,maxX,minZ,maxZ,total,weightedX,weightedZ)
	if count<=MAX_PATCH_CELLS and total>0
		and (maxX-minX+1)*CELL<=MAX_PATCH_WIDTH and (maxZ-minZ+1)*CELL<=MAX_PATCH_WIDTH then
		local x=math.floor(weightedX/total/8+0.5)*8
		local z=math.floor(weightedZ/total/8+0.5)*8
		append(spots,{x=x,z=z,y=Spring.GetGroundHeight(x,z),metal=total*0.001})
	end
end

function M.Scan(spawnPositions, existingSpots)
	local spots = copySpots(existingSpots)
	if not Spring.GetMetalAmount then return spots end
	local width,height
	if Spring.GetMetalMapSize then width,height=Spring.GetMetalMapSize() end
	width = width or math.floor((Game.mapSizeX or 0)/CELL)
	height = height or math.floor((Game.mapSizeZ or 0)/CELL)
	if width<=0 or height<=0 then return spots end

	local sampled, cells, order = {}, {}, {}
	for _,spawn in ipairs(spawnPositions or {}) do
		if type(spawn)=='table' and type(spawn.x)=='number' and type(spawn.z)=='number' then
			local left = math.max(0,math.floor((spawn.x-RADIUS)/CELL))
			local right = math.min(width-1,math.floor((spawn.x+RADIUS)/CELL))
			local top = math.max(0,math.floor((spawn.z-RADIUS)/CELL))
			local bottom = math.min(height-1,math.floor((spawn.z+RADIUS)/CELL))
			for z=top,bottom do
				for x=left,right do
					local key=z*width+x
					local wx,wz=(x+0.5)*CELL,(z+0.5)*CELL
					if not sampled[key] and (wx-spawn.x)^2+(wz-spawn.z)^2<=RADIUS^2 then
						sampled[key]=true
						local amount=Spring.GetMetalAmount(x,z) or 0
						if amount>0 then
							cells[key]={x=x,z=z,amount=amount}
							order[#order+1]=key
						end
					end
				end
			end
		end
	end

	-- Eight-neighbour components keep each deposited patch together. A continuous
	-- metal field is not collapsed into a fictitious single discrete mex spot.
	for _,key in ipairs(order) do
		local start=cells[key]
		if start then
			local queue={start}
			cells[key]=nil
			local head,total,weightedX,weightedZ=1,0,0,0
			local minX,maxX,minZ,maxZ=start.x,start.x,start.z,start.z
			local clipped=false
			while head<=#queue do
				local cell=queue[head]
				head=head+1
				total=total+cell.amount
				weightedX=weightedX+(cell.x+0.5)*CELL*cell.amount
				weightedZ=weightedZ+(cell.z+0.5)*CELL*cell.amount
				minX,maxX=math.min(minX,cell.x),math.max(maxX,cell.x)
				minZ,maxZ=math.min(minZ,cell.z),math.max(maxZ,cell.z)
				for dz=-1,1 do
					for dx=-1,1 do
						if dx~=0 or dz~=0 then
							local x,z=cell.x+dx,cell.z+dz
							if x>=0 and x<width and z>=0 and z<height then
								local neighbour=z*width+x
								if not sampled[neighbour] then clipped=true end
								if cells[neighbour] then
									queue[#queue+1]=cells[neighbour]
									cells[neighbour]=nil
								end
							end
						end
					end
				end
			end
			if not clipped then
				addPatch(spots,#queue,minX,maxX,minZ,maxZ,total,weightedX,weightedZ)
			end
		end
	end
	return spots
end

-- Streaming connected components use only two rows and their live components.
-- A giant continuous field needs no giant cell list or final flood-fill pass.
local function root(node)
	if not node then return end
	local result=node
	while result.parent do result=result.parent end
	while node.parent do
		local nextNode=node.parent
		node.parent=result
		node=nextNode
	end
	return result
end

local function union(a,b)
	a,b=root(a),root(b)
	if not a then return b end
	if not b or a==b then return a end
	if a.count<b.count then a,b=b,a end
	b.parent=a
	a.count=a.count+b.count
	a.total=a.total+b.total
	a.weightedX=a.weightedX+b.weightedX
	a.weightedZ=a.weightedZ+b.weightedZ
	a.minX,a.maxX=math.min(a.minX,b.minX),math.max(a.maxX,b.maxX)
	a.minZ,a.maxZ=math.min(a.minZ,b.minZ),math.max(a.maxZ,b.maxZ)
	return a
end

local function finishPatch(job,node)
	addPatch(job.spots,node.count,node.minX,node.maxX,node.minZ,node.maxZ,
		node.total,node.weightedX,node.weightedZ)
end

function M.Start(existingSpots)
	local width,height
	if Spring.GetMetalMapSize then width,height=Spring.GetMetalMapSize() end
	width=width or math.floor((Game.mapSizeX or 0)/CELL)
	height=height or math.floor((Game.mapSizeZ or 0)/CELL)
	return {spots=copySpots(existingSpots),width=width,height=height,x=0,z=0,
		previous={},current={},active={},phase='scan',
		done=not Spring.GetMetalAmount or width<=0 or height<=0}
end

function M.Step(job,maxCells)
	if job.done then return job.spots end
	local budget=math.max(1,math.floor(maxCells or 4096))
	for _=1,budget do
		if job.phase=='scan' then
			local x,z=job.x,job.z
			local amount=Spring.GetMetalAmount(x,z) or 0
			if amount>0 then
				local node=union(job.current[x-1],job.previous[x-1])
				node=union(node,job.previous[x])
				node=union(node,job.previous[x+1])
				if not node then
					node={count=0,total=0,weightedX=0,weightedZ=0,minX=x,maxX=x,minZ=z,maxZ=z}
				end
				node.count=node.count+1
				node.total=node.total+amount
				node.weightedX=node.weightedX+(x+0.5)*CELL*amount
				node.weightedZ=node.weightedZ+(z+0.5)*CELL*amount
				node.minX,node.maxX=math.min(node.minX,x),math.max(node.maxX,x)
				node.minZ,node.maxZ=math.min(node.minZ,z),math.max(node.maxZ,z)
				job.current[x]=node
			end
			job.x=x+1
			if job.x>=job.width then
				job.phase,job.index='roots',0
				job.seen,job.nextActive={},{}
			end
		elseif job.phase=='roots' then
			local node=root(job.current[job.index])
			if node and not job.seen[node] then
				job.seen[node]=true
				job.nextActive[#job.nextActive+1]=node
			end
			job.index=job.index+1
			if job.index>=job.width then job.phase,job.index='finalize',1 end
		elseif job.phase=='finalize' then
			local node=root(job.active[job.index])
			if node then
				if not job.seen[node] then
					job.seen[node]=true
					finishPatch(job,node)
				end
				job.index=job.index+1
			else
				job.previous,job.current=job.current,{}
				job.active=job.nextActive
				job.seen,job.nextActive=nil,nil
				job.x,job.z=0,job.z+1
				job.phase=job.z<job.height and 'scan' or 'finish'
				job.index=1
			end
		elseif job.phase=='finish' then
			local node=job.active[job.index]
			if node then
				finishPatch(job,node)
				job.index=job.index+1
			else
				job.done=true
				job.previous,job.current,job.active=nil,nil,nil
				return job.spots
			end
		end
	end
	return nil
end

return M
