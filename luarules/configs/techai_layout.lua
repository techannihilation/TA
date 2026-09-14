-- Base zoning and factory access. Runtime footprints use 8-elmo build squares.
local M = {}
local CELL = 384
local function overlap(a,b)
	return a.x1<b.x2 and a.x2>b.x1 and a.z1<b.z2 and a.z2>b.z1
end
local function bounds(def,x,z,facing,padding)
	local hx,hz=(def.xsize or 4)*4,(def.zsize or 4)*4
	if facing%2==1 then hx,hz=hz,hx end
	padding=padding or 0
	return {x1=x-hx-padding,x2=x+hx+padding,z1=z-hz-padding,z2=z+hz+padding}
end
local function lane(def,x,z,facing)
	local width=(def.xsize or 4)*4+32
	local depth=(def.zsize or 4)*4
	local length=256
	for _,id in ipairs(def.buildOptions or {}) do
		local product=UnitDefs[id]
		if product and product.canMove and not product.canFly then
			local half=math.max(product.xsize or 4,product.zsize or 4)*4
			width=math.max(width,half+32);length=math.max(length,half*3)
		end
	end
	local start,finish=depth-16,depth+length
	if facing==0 then return {x1=x-width,x2=x+width,z1=z+start,z2=z+finish}
	elseif facing==1 then return {x1=x+start,x2=x+finish,z1=z-width,z2=z+width}
	elseif facing==2 then return {x1=x-width,x2=x+width,z1=z-finish,z2=z-start}
	else return {x1=x-finish,x2=x-start,z1=z-width,z2=z+width} end
end

function M.Create(metadata,teams,metalSpots,geoSpots)
	local S=Spring
	local function kind(defID)
		local meta=metadata[defID]
		local role=meta and meta.role
		if role=='mex' then return nil end
		if role=='energy' or role=='converter' or role=='factory' then return role end
		if role=='defense' or role=='aa' then return 'defense' end
		if role=='storage' then return 'storage' end
		return 'support'
	end
	local function initialize(ai)
		if not ai.layout then ai.layout={sectors={},plans={},serial=0} end
		return ai.layout
	end
	local function cells(ai,box)
		local origin=ai.spawnPos
		local keys={}
		if not origin then return keys end
		for ix=math.floor((box.x1-origin.x)/CELL),math.floor((box.x2-0.01-origin.x)/CELL) do
			for iz=math.floor((box.z1-origin.z)/CELL),math.floor((box.z2-0.01-origin.z)/CELL) do
				keys[#keys+1]=ix..':'..iz
			end
		end
		return keys
	end
	local function assign(ai,defID,box)
		local category=kind(defID)
		if not category then return end
		local sectors=initialize(ai).sectors
		for _,key in ipairs(cells(ai,box)) do
			if sectors[key] and sectors[key]~=category then sectors[key]='mixed'
			else sectors[key]=category end
		end
	end
	local function Refresh(ai)
		local layout=initialize(ai)
		local stamp=math.floor(S.GetGameFrame()/30)
		if layout.stamp==stamp then return layout end
		layout.stamp=stamp;layout.structures={}
		local origin=ai.spawnPos
		if not origin then return layout end
		for _,id in ipairs(S.GetUnitsInCylinder(origin.x,origin.z,2800) or {}) do
			local defID=S.GetUnitDefID(id)
			local def,meta=UnitDefs[defID],metadata[defID]
			local team=S.GetUnitTeam(id)
			if def and team and S.AreTeamsAllied(ai.teamID,team) and (def.isBuilding or
				(meta and (meta.role=='factory' or meta.role=='energy' or meta.role=='converter' or meta.role=='defense' or meta.role=='mex' or meta.role=='nanotower' or meta.role=='radar' or meta.role=='storage'))) then
				local x,_,z=S.GetUnitPosition(id)
				if x then
					local facing=S.GetUnitBuildFacing and S.GetUnitBuildFacing(id) or 0
					local box=bounds(def,x,z,facing,12)
					layout.structures[#layout.structures+1]={box=box,lane=def.isFactory and lane(def,x,z,facing),id=id,cat=kind(defID),own=team==ai.teamID}
					if team==ai.teamID then assign(ai,defID,box) end
				end
			end
		end
		for _,other in pairs(teams) do
			if S.AreTeamsAllied(ai.teamID,other.teamID) and other.layout then
				local queueByBuilder={}
				for key,plan in pairs(other.layout.plans) do
					local q=queueByBuilder[plan.builder]
					if not q then q=S.GetCommandQueue(plan.builder,-1) or {};queueByBuilder[plan.builder]=q end
					local active=false
					for _,cmd in ipairs(q) do
						local p=cmd.params
						if cmd.id==-plan.defID and p and p[1] and p[3] and math.abs(p[1]-plan.x)<16 and math.abs(p[3]-plan.z)<16 then active=true;break end
					end
					if not active then other.layout.plans[key]=nil end
				end
			end
		end
		-- Concentrate each category around its own built/planned centroid so new
		-- buildings pack tightly against existing ones instead of spreading out.
		local sums={}
		local function fold(cat,cx,cz)
			if not cat then return end
			local s=sums[cat] or {x=0,z=0,n=0}
			s.x=s.x+cx;s.z=s.z+cz;s.n=s.n+1
			sums[cat]=s
		end
		for _,item in ipairs(layout.structures) do
			if item.cat and item.own then fold(item.cat,(item.box.x1+item.box.x2)*0.5,(item.box.z1+item.box.z2)*0.5) end
		end
		for _,plan in pairs(layout.plans) do
			fold(plan.cat,plan.x,plan.z)
		end
		layout.zones={}
		for cat,s in pairs(sums) do
			layout.zones[cat]={x=math.floor(s.x/s.n/16)*16+8,z=math.floor(s.z/s.n/16)*16+8}
		end
		return layout
	end
	local function Allowed(ai,defID,x,z,facing,ignoreZones,replacedUnit)
		local def=UnitDefs[defID]
		if not def or not ai then return false end
		local layout=Refresh(ai)
		local box=bounds(def,x,z,facing,12)
		if box.x1<16 or box.z1<16 or box.x2>Game.mapSizeX-16 or box.z2>Game.mapSizeZ-16 then return false end
		local category=kind(defID)
		if category and not ignoreZones then
			for _,key in ipairs(cells(ai,box)) do
				if layout.sectors[key] and layout.sectors[key]~=category then return false end
			end
		end
		local exit=def.isFactory and lane(def,x,z,facing)
		if exit and (exit.x1<0 or exit.z1<0 or exit.x2>Game.mapSizeX or exit.z2>Game.mapSizeZ) then return false end
		-- Leave known deposits available even before their extractors are ordered.
		if category and metalSpots then
			for _,spot in ipairs(metalSpots()) do
				local patch={x1=spot.x-40,x2=spot.x+40,z1=spot.z-40,z2=spot.z+40}
				if overlap(box,patch) or (exit and overlap(exit,patch)) then return false end
			end
		end
		-- Same for geothermal vents: keep them free for the needGeo plant that
		-- must sit on them, excluding the geo consumer itself.
		if category and geoSpots and not def.needGeo then
			for _,spot in ipairs(geoSpots()) do
				local patch={x1=spot.x-40,x2=spot.x+40,z1=spot.z-40,z2=spot.z+40}
				if overlap(box,patch) or (exit and overlap(exit,patch)) then return false end
			end
		end
		for _,item in ipairs(layout.structures or {}) do
			if item.id~=replacedUnit and (overlap(box,item.box) or (item.lane and overlap(box,item.lane)) or (exit and overlap(exit,item.box))) then return false end
		end
		for _,other in pairs(teams) do
			if S.AreTeamsAllied(ai.teamID,other.teamID) and other.layout then
				for _,plan in pairs(other.layout.plans) do
					if overlap(box,plan.box) or (plan.lane and overlap(box,plan.lane)) or (exit and overlap(exit,plan.box)) then return false end
				end
			end
		end
		return true
	end
	local function Reserve(ai,builder,defID,x,z,facing)
		local layout=initialize(ai)
		local def=UnitDefs[defID]
		if not def then return end
		if not def then return end
		local box=bounds(def,x,z,facing,12)
		local key=builder..':'..defID..':'..x..':'..z
		layout.plans[key]={builder=builder,defID=defID,x=x,z=z,box=box,lane=def.isFactory and lane(def,x,z,facing),cat=kind(defID)}
		assign(ai,defID,box)
	end
	local function Find(ai,defID)
		if not ai.spawnPos then return end
		local def=UnitDefs[defID]
		local category=kind(defID)
		local layout=Refresh(ai)
		local region=ai.spawnPos
		local anchor=layout.zones and layout.zones[category]
		local origin=anchor or ai.spawnPos
		-- Keep every base expansion inside the commander's defence radius so a
		-- drifting category centroid can never walk builders far from the base.
		local baseRadius=1152
		local ox,oz=origin.x,origin.z
		local dx,dz=ox-ai.spawnPos.x,oz-ai.spawnPos.z
		local odistSq=dx*dx+dz*dz
		if odistSq>baseRadius*baseRadius then
			local odist=math.sqrt(odistSq)
			ox=ai.spawnPos.x+dx/odist*baseRadius
			oz=ai.spawnPos.z+dz/odist*baseRadius
		end
		-- A geothermal consumer must sit on a vent: probe the known vents closest
		-- to the expansion anchor before falling back to the district rings. The
		-- small footprint offset sweep keeps the vent inside the plant.
		if def.needGeo and geoSpots then
			local ordered={}
			for _,spot in ipairs(geoSpots()) do
				local px=spot.x-ox
				local pz=spot.z-oz
				local d=px*px+pz*pz
				if d<=baseRadius*baseRadius then ordered[#ordered+1]={spot=spot,d=d} end
			end
			table.sort(ordered,function(a,b) return a.d<b.d end)
			local lastFacing=def.isFactory and 3 or 1
			for i=1,#ordered do
				local spot=ordered[i].spot
				for offset=-32,32,16 do
					for offsetZ=-32,32,16 do
						local x=spot.x+offset
						local z=spot.z+offsetZ
						for facing=0,lastFacing do
							if Allowed(ai,defID,x,z,facing) then
								local y=S.GetGroundHeight(x,z)
								if S.TestBuildOrder(defID,x,y,z,facing)>0 then return x,y,z,facing end
							end
						end
					end
				end
			end
		end
		-- Reuse a matching district before allocating the nearest free district.
		for pass=1,2 do
			for radius=96,baseRadius,64 do
				local steps=math.max(8,math.floor(2*math.pi*radius/128))
				for step=0,steps-1 do
					local angle=step*2*math.pi/steps
					local x=math.floor((ox+math.cos(angle)*radius)/16)*16+8
					local z=math.floor((oz+math.sin(angle)*radius)/16)*16+8
					local key=math.floor((x-region.x)/CELL)..':'..math.floor((z-region.z)/CELL)
					if (pass==1 and layout.sectors[key]==category) or (pass==2 and not layout.sectors[key]) then
						local lastFacing=def.isFactory and 3 or 1
						for facing=0,lastFacing do
							if Allowed(ai,defID,x,z,facing) then
								local y=S.GetGroundHeight(x,z)
								if S.TestBuildOrder(defID,x,y,z,facing)>0 then return x,y,z,facing end
							end
						end
					end
				end
			end
		end
	end
	return {Allowed=Allowed,Reserve=Reserve,Find=Find,Refresh=Refresh}
end
M.Bounds,M.Lane,M.Overlap=bounds,lane,overlap
return M
