-- $Id: unit_terraform.lua 4610 2009-05-12 13:03:32Z google frog $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Terraformers",
    desc      = "Terraforming script for lasso based area/line terraform, also ramp",
    author    = "Google Frog",
    date      = "Nov, 2009",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local enabled = tonumber(Spring.GetModOptions().mo_terraforming) or 1

if (enabled == 0) then
  return false
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then -- SYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local USE_TERRAIN_TEXTURE_CHANGE = true -- (Spring.GetModOptions() or {}).terratex == "1"

-- Speedups
local floor           		= math.floor
local abs             		= math.abs
local ceil 			  		= math.ceil
local sqrt 					= math.sqrt

local spAdjustHeightMap     = Spring.AdjustHeightMap
local spGetGroundHeight     = Spring.GetGroundHeight
local spLevelHeightMap      = Spring.LevelHeightMap
local spGetUnitBuildFacing  = Spring.GetUnitBuildFacing
local spValidUnitID         = Spring.ValidUnitID
local spInsertUnitCmdDesc   = Spring.InsertUnitCmdDesc
local spSetHeightMapFunc    = Spring.SetHeightMapFunc
local spFindUnitCmdDesc     = Spring.FindUnitCmdDesc
local spRemoveUnitCmdDesc 	= Spring.RemoveUnitCmdDesc
local spGetUnitHealth		= Spring.GetUnitHealth
local spGetUnitTeam		= Spring.GetUnitTeam
local spAddHeightMap		= Spring.AddHeightMap
local spGetUnitPosition		= Spring.GetUnitPosition
local spGetUnitIsDead       = Spring.GetUnitIsDead

local mapWidth = Game.mapSizeX
local mapHeight = Game.mapSizeZ

--------------------------------------------------------------------------------
-- Configuration
--------------------------------------------------------------------------------

local maxAreaSize = 1000 -- max X or Z bound of area terraform
local areaSegMaxSize = 400 -- max width and height of terraform squares

local maxWallPoints = 1400 -- max points that can makeup a wall
local wallSegmentLength = 14 -- how many points are part of a wall segment (points are seperated 8 elmos orthagonally)

local maxRampWidth = 200 -- maximun width of ramp segment
local maxRampLegth = 200 -- maximun length of ramp segment

local maxHeightDifference = 100 -- max difference of height around terraforming, Makes Shraka Pyramids
local maxAbsoluteHeight = 2000
local maxRampGradient = 5
local terraformSpeedMultiplier = 20

--ramp dimensions
local maxTotalRampLength = 3000
local maxTotalRampWidth = 1600
local minTotalRampLength = 32
local minTotalRampWidth = 24

local structureCheckLoopFrames = 300 -- frequency of slow update for building deformation check
local modOptions = Spring.GetModOptions()

--------------------------------------------------------------------------------
-- Arrays
--------------------------------------------------------------------------------

local structure          	= {}
local structureTable		= {}
local structureCount	 	= 0

local structureAreaMap      = {}

local structureCheckFrame	= {}
local currentCheckFrame 	= 0

local corclogDefID = {}
--local novheavymineDefID = UnitDefNames["novheavymine"].id

local commanderDefs = VFS.Include("luarules/configs/comDefIDs.lua") or {}
local delayedTerraform = VFS.Include("luarules/gadgets/include/terraform_delayed.lua")

--------------------------------------------------------------------------------
-- Custom Commands
--------------------------------------------------------------------------------

CMD_RAMP = 39734
CMD_LEVEL = 39736
CMD_SMOOTH = 39738
CMD_RESTORE = 39739
CMD_TERRAFORM_INTERNAL = 39801

local rampCmdDesc = {
  id      = CMD_RAMP,
  type    = CMDTYPE.ICON_MAP,
  name    = 'Ramp',
  cursor  = 'Repair',
  action  = 'rampground',
  texture = 'luarules/images/commands/ramp.png',
  tooltip = 'Build a Ramp between 2 positions, click 2 times: start and end of ramp',
}

local levelCmdDesc = {
  id      = CMD_LEVEL,
  type    = CMDTYPE.ICON_MAP,
  name    = 'Level',
  cursor  = 'Repair',
  action  = 'levelground',
  texture = 'luarules/images/commands/level.png',
  tooltip = 'Levels the ground in a rectangular area - drag or click 2 corners',
}

local smoothCmdDesc = {
  id      = CMD_SMOOTH,
  type    = CMDTYPE.ICON_MAP,
  name    = 'Smooth',
  cursor  = 'Repair',
  action  = 'smoothground',
  texture = 'luarules/images/commands/smooth.png',
  tooltip = 'Smooths the ground in a rectangular area - drag or click 2 corners',
}

local restoreCmdDesc = {
  id      = CMD_RESTORE,
  type    = CMDTYPE.ICON_MAP,
  name    = 'Restore',
  cursor  = 'Repair',
  action  = 'restoreground',
  texture = 'luarules/images/commands/restore.png',
  tooltip = 'Restores the ground in a rectangular area to its original map height',
}

local cmdDescsArray = {
  rampCmdDesc,
  levelCmdDesc,
  smoothCmdDesc,
  restoreCmdDesc,
}

if (not Game.mapDamage) then  -- map has "notDeformable = true", or "disablemapdamage = 1" modoption was set in the startscript
  include("LuaRules/colors.h.lua")
  local disabledText = '\n' .. RedStr .. "DISABLED" .. PinkStr .. "  (map not deformable)"

  for _, cmdDesc in ipairs(cmdDescsArray) do
    cmdDesc.disabled = true
    cmdDesc.tooltip  = cmdDesc.tooltip .. disabledText
  end
end

--------------------------------------------------------------------------------
-- Terraform Calculation Functions
--------------------------------------------------------------------------------

local function linearEquation(x,m,x1,y1)
  return m*(x-x1)+y1
end

local function distance(x1,y1,x2,y2)
  return ((x1-x2)^2+(y1-y2)^2)^0.5
end

local function pointHeight(xs, ys, zs, x, z, m, h, xdis)

  local xInt = (z-zs+m*xs+x/m)/(m+1/m)

  local ratio = abs(xInt-xs)/xdis

  return ratio*h+ys

end

local function checkPointCreation(terraform_type, volumeSelection, orHeight, newHeight)

	if volumeSelection == 0 or terraform_type == 3 then
		return true
	end

	if abs(orHeight-newHeight) == 0 then
		return false
	end

	return (volumeSelection == 1 and orHeight < newHeight) or (volumeSelection == 2 and orHeight > newHeight)
end

local function updateBorderWithPoint(border, x, z)
	if x < border.left then
		border.left = x
	end
	if x > border.right then
		border.right = x
	end
	if z < border.top then
		border.top = z
	end
	if z > border.bottom then
		border.bottom = z
	end
end

local function TerraformRamp(x1, y1, z1, x2, y2, z2, terraform_width, unit, units, team, volumeSelection, shift)

	--** Initial constructor processing **
	local unitsX = 0
	local unitsZ = 0
	local i = 1
	while i <= units do
		if (spValidUnitID(unit[i])) then
			local x,_,z = spGetUnitPosition(unit[i])
			unitsX = unitsX + x
			unitsZ = unitsZ + z
			i = i + 1
		else
			unit[i] = unit[units]
			unit[units] = nil
			units = units - 1
		end
	end

	if units == 0 then
		return
	end

	unitsX = unitsX/units
	unitsZ = unitsZ/units

	-- Avoid degenerate ramp equations on perfectly vertical or horizontal lines.
	if abs(x1 - x2) < 0.1 then
		x2 = x1 + 0.1
	end
	if abs(z1 - z2) < 0.1 then
		z2 = z1 + 0.1
	end

	--calculate equations of the 3 lines, left, right and mid

	local border = {}

	local dis = distance(x1,z1,x2,z2)

	if dis < minTotalRampLength-0.05 or dis > maxTotalRampLength+0.05 then
		return
	end

	if terraform_width < minTotalRampWidth or terraform_width > maxTotalRampWidth then
		return
	end

	local xdis = abs(x1-x2)
	local heightDiff = y2-y1
	if heightDiff/dis > maxRampGradient then
		heightDiff = maxRampGradient*dis
	elseif heightDiff/dis < -maxRampGradient then
		heightDiff = -maxRampGradient*dis
	end

	local m
	if x1 ~= x2 then
		m = (z1-z2)/(x1-x2)
	else
		m = 100000
	end
	if m == 0 then
		m = 0.0001
	end

	local segLength = dis/(ceil(dis/maxRampLegth))
	local segWidth = terraform_width/ceil(terraform_width/maxRampWidth)
	local widthScale = terraform_width/dis
	local lengthScale = segLength/dis

	local add = {x = (x2-x1)*lengthScale, z = (z2-z1)*lengthScale}
	local addPerp = {x = (z1-z2)*segWidth/dis, z = -(x1-x2)*segWidth/dis}

	local mid = {x = (x1-x2)*widthScale/2, z = (z1-z2)*widthScale/2}
	local leftRot = {x = mid.z+x1, z = -mid.x+z1}
	local rightRot = {x = -mid.z+x1, z = mid.x+z1}

	--Spring.MarkerAddPoint(leftRot.x,0,leftRot.z,"L")
	--Spring.MarkerAddPoint(rightRot.x,0,rightRot.z,"R")
	--Spring.MarkerAddPoint(rightRot.x+add.x,0,rightRot.z+add.z,"R + A")
	--Spring.MarkerAddPoint(rightRot.x+addPerp.x,0,rightRot.z+addPerp.z,"R + AP")

	local topleftGrad
	local botleftGrad

	local toppoint
	local botpoint
	local leftpoint
	local rightpoint

	--** Store the 4 points of each segment diamond, changes with quadrant **

	if x1 < x2 then
		if z1 < z2 then
			-- bottom right
			topleftGrad = -1/m
			botleftGrad = m

			toppoint = rightRot
			leftpoint = {x = rightRot.x+addPerp.x, z = rightRot.z+addPerp.z}
			rightpoint = {x = toppoint.x+add.x, z = toppoint.z+add.z}
			botpoint = {x = leftpoint.x+add.x, z = leftpoint.z+add.z}

			border = {left = leftRot.x, right = rightRot.x-x1+x2, top = rightRot.z, bottom = leftRot.z-z1+z2}
		else
			-- top right
			topleftGrad = m
			botleftGrad = -1/m

			leftpoint = rightRot
			botpoint = {x = rightRot.x+addPerp.x, z = rightRot.z+addPerp.z}
			rightpoint = {x = botpoint.x+add.x, z = botpoint.z+add.z}
			toppoint = {x =  rightRot.x+add.x, z =  rightRot.z+add.z}

			border = {left = rightRot.x, right = leftRot.x-x1+x2, top = rightRot.z-z1+z2, bottom = leftRot.z}
		end
	else
		if z1 < z2 then
			-- bottom left
			topleftGrad = m
			botleftGrad = -1/m

			rightpoint = rightRot
			toppoint = {x = rightRot.x+addPerp.x, z = rightRot.z+addPerp.z}
			botpoint = {x = rightRot.x+add.x, z = rightRot.z+add.z}
			leftpoint = {x = toppoint.x+add.x, z = toppoint.z+add.z}

			border = {left = leftRot.x-x1+x2, right = rightRot.x, top = rightRot.z-z1+z2, bottom = leftRot.z}
		else
			-- top left
			topleftGrad = -1/m
			botleftGrad = m

			botpoint = rightRot
			rightpoint = {x = rightRot.x+addPerp.x, z = rightRot.z+addPerp.z}
			toppoint = {x = rightpoint.x+add.x, z = rightpoint.z+add.z}
			leftpoint = {x = rightRot.x+add.x, z = rightRot.z+add.z}

			border = {left = rightRot.x-x1+x2, right = leftRot.x, top = leftRot.z-z1+z2, bottom = rightRot.z}
		end
	end
	-- check it's all working

	--[[
	Spring.MarkerAddPoint( border.left,0,border.top,"topleft")
	Spring.MarkerAddPoint( border.right,0,border.bottom,"botright")
	Spring.MarkerAddPoint( x1,y1,z1,  "start")
	Spring.MarkerAddPoint( x2,y2,z2,  "end")
	Spring.MarkerAddPoint( leftpoint.x,y1,leftpoint.z,  "leftP")
	Spring.MarkerAddPoint( toppoint.x,y1,toppoint.z,  "topP")
	Spring.MarkerAddPoint( botpoint.x,y1,botpoint.z,  "botP")
	Spring.MarkerAddPoint( leftpoint.x,y1,toppoint.z,  "topleft")
	Spring.MarkerAddPoint( rightpoint.x,y1,botpoint.z,  "botright")

	Spring.MarkerAddLine(toppoint.x,y1,toppoint.z,leftpoint.x,y1,leftpoint.z)
	Spring.MarkerAddLine(botpoint.x,y1,botpoint.z,leftpoint.x,y1,leftpoint.z)
	Spring.MarkerAddLine(toppoint.x,y1,toppoint.z,rightpoint.x,y1,rightpoint.z)
	Spring.MarkerAddLine(botpoint.x,y1,botpoint.z,rightpoint.x,y1,rightpoint.z)

	Spring.MarkerAddLine(leftpoint.x,y1,toppoint.z,rightpoint.x,y1,toppoint.z)
	Spring.MarkerAddLine(rightpoint.x,y1,toppoint.z,rightpoint.x,y1,botpoint.z)
	Spring.MarkerAddLine(leftpoint.x,y1,toppoint.z,leftpoint.x,y1,botpoint.z)
	Spring.MarkerAddLine(leftpoint.x,y1,botpoint.z,rightpoint.x,y1,botpoint.z)
	--]]

	--** Split the ramp into segments and calculate the points within each one**

	local segment = {}
	local n = 1

	local i = 0
	while i*segLength < dis do
		local j = 0
		while j*segWidth < terraform_width do

			segment[n] = {}
			segment[n].along = i
			segment[n].point = {}
			segment[n].area = {}
			segment[n].border = {
				left = floor((leftpoint.x+add.x*i+addPerp.x*j)/8)*8,
				right = ceil((rightpoint.x+add.x*i+addPerp.x*j)/8)*8,
				top = floor((toppoint.z+add.z*i+addPerp.z*j)/8)*8,
				bottom = ceil((botpoint.z+add.z*i+addPerp.z*j)/8)*8
			}
			-- end of segment
			--segment[n].position = {x = (rightRot.x-4+add.x*i+addPerp.x*(j+0.5)-16*(x2-x1)/dis), z = (rightRot.z-4+add.z*i+addPerp.z*(j+0.5)-16*(z2-z1)/dis)}

			-- middle of segment
			segment[n].position = {x = rightRot.x+add.x*(i+0.5)+addPerp.x*(j+0.5), z = rightRot.z+add.z*(i+0.5)+addPerp.z*(j+0.5)}
			local pc = 1

			local topline1 = {x = leftpoint.x+add.x*i+addPerp.x*j, z = leftpoint.z+add.z*i+addPerp.z*j, m = topleftGrad}
			local topline2 = {x = toppoint.x+add.x*i+addPerp.x*j, z = toppoint.z+add.z*i+addPerp.z*j, m = botleftGrad}
			local botline1 = {x = leftpoint.x+add.x*i+addPerp.x*j, z = leftpoint.z+add.z*i+addPerp.z*j, m = botleftGrad}
			local botline2 = {x = botpoint.x+add.x*i+addPerp.x*j, z = botpoint.z+add.z*i+addPerp.z*j, m = topleftGrad}

			local topline = topline1
			local botline = botline1

			local lx = segment[n].border.left
			while lx <= segment[n].border.right do
				segment[n].area[lx] = {}
				local zmin = linearEquation(lx,topline.m,topline.x,topline.z)
				local zmax = linearEquation(lx,botline.m,botline.x,botline.z)

				local lz = segment[n].border.top
				while lz <= zmax do

					if zmin <= lz then
						local h = pointHeight(x1, y1, z1, lx, lz, m, heightDiff, xdis)
						segment[n].point[pc] = {x = lx, y = h ,z = lz, orHeight = spGetGroundHeight(lx,lz), prevHeight = spGetGroundHeight(lx,lz)}

						if checkPointCreation(4, volumeSelection, segment[n].point[pc].orHeight, h) then
							pc = pc + 1
						end
					end

					lz = lz+8
				end
				lx = lx+8

				if topline == topline1 and topline2.x < lx then
					topline = topline2
				end

				if botline == botline1 and botline2.x < lx then
					botline = botline2
				end

			end

			if pc ~= 1 then
				segment[n].points = pc - 1
				n = n + 1
			end

			j = j+1
		end
		i = i+1
	end

	-- Prepare every segment for one combined delayed task.

	for i = 1,n-1 do
		delayedTerraform.PrepareRamp(segment[i])

	end
	return delayedTerraform.FreezeSegments(segment, n - 1, maxHeightDifference)

end

local function TerraformWall(terraform_type,mPoint,mPoints,terraformHeight,unit,units,team,volumeSelection,shift)

	local border = {left = mapWidth, right = 0, top = mapHeight, bottom = 0}

	--** Initial constructor processing **
	local unitsX = 0
	local unitsZ = 0
	local i = 1
	while i <= units do
		if (spValidUnitID(unit[i])) then
			local x,_,z = spGetUnitPosition(unit[i])
			unitsX = unitsX + x
			unitsZ = unitsZ + z
			i = i + 1
		else
			unit[i] = unit[units]
			unit[units] = nil
			units = units - 1
		end
	end

	if units == 0 then
		return
	end

	unitsX = unitsX/units
	unitsZ = unitsZ/units

	--** Convert Mouse Points to a Closed Loop on a Grid **

	-- points interpolated from mouse points
	local point = {}
	local points = 1

	mPoint[1].x = floor((mPoint[1].x+8)/16)*16
	mPoint[1].z = floor((mPoint[1].z+8)/16)*16
	point[1] = mPoint[1]
	updateBorderWithPoint(border, point[points].x, point[points].z)

	for i = 2, mPoints, 1 do
		mPoint[i].x = floor((mPoint[i].x+8)/16)*16
		mPoint[i].z = floor((mPoint[i].z+8)/16)*16

		local diffX = mPoint[i].x - mPoint[i-1].x
		local diffZ = mPoint[i].z - mPoint[i-1].z
		local a_diffX = abs(diffX)
		local a_diffZ = abs(diffZ)

		if a_diffX <= 16 and a_diffZ <= 16 then
			points = points + 1
			point[points] = {x = mPoint[i].x, z = mPoint[i].z}
			updateBorderWithPoint(border, point[points].x, point[points].z)
		else
			-- interpolate between far apart points to prevent wall holes.
			if a_diffX > a_diffZ then
				local m = diffZ/diffX
				local sign = diffX/a_diffX
				for j = 0, a_diffX, 16 do
					points = points + 1
					point[points] = {x = mPoint[i-1].x + j*sign, z = floor((mPoint[i-1].z + j*m*sign)/16)*16}
					updateBorderWithPoint(border, point[points].x, point[points].z)
				end
			else
				local m = diffX/diffZ
				local sign = diffZ/a_diffZ
				for j = 0, a_diffZ, 16 do
					points = points + 1
					point[points] = {x = floor((mPoint[i-1].x + j*m*sign)/16)*16, z = mPoint[i-1].z + j*sign}
					updateBorderWithPoint(border, point[points].x, point[points].z)
				end
			end

		end
	end

	border.left = border.left - 16
	border.top = border.top - 16
	border.right = border.right + 16
	border.bottom = border.bottom + 16

	if points > maxWallPoints then
		-- cancel command if the wall is too big, anti-slowdown
		return false
	end


	--** Split the mouse points into segments **

	-- area checks for overlap
	local area = {}

	for i = border.left,border.right,8 do
		area[i] = {}
	end

	local segment = {}
	local n = 1
	local count = 0
	local continue = true

	while continue do

		if count*wallSegmentLength+1 <= points then
			segment[n] = {}
			segment[n].point = {}
			segment[n].area = {}
			segment[n].border = {left = mapWidth, right = 0, top = mapHeight, bottom = 0}
			segment[n].position = {x = point[count*wallSegmentLength+1].x, z = point[count*wallSegmentLength+1].z}

			local averagePosition = {x = 0, z = 0, n = 0}

			local pc = 1

			for j = count*wallSegmentLength+1, (count+1)*wallSegmentLength do

				if j > points then
					continue = false
					break
				else

					averagePosition.x = averagePosition.x + point[j].x
					averagePosition.z = averagePosition.z + point[j].z
					averagePosition.n = averagePosition.n + 1

					for lx = -16,16,8 do
						for lz = -16,16,8 do
							-- lx/lz steps through the points around the mousePoint
							if not area[point[j].x+lx][point[j].z+lz] then
								-- check if the point will be terraformed be a previous block
								segment[n].point[pc] = {x = point[j].x+lx, z = point[j].z+lz}
								area[point[j].x+lx][point[j].z+lz] = true
								-- update border
								updateBorderWithPoint(segment[n].border, segment[n].point[pc].x, segment[n].point[pc].z)
								--[[if segment[n].point[pc].x-16 < .left then
									segment[n].border.left = segment[n].point[pc].x-16
								end
								if segment[n].point[pc].x+16 > segment[n].border.right then
									segment[n].border.right = segment[n].point[pc].x+16
								end
								if segment[n].point[pc].z-16 < segment[n].border.top then
									segment[n].border.top = segment[n].point[pc].z-16
								end
								if segment[n].point[pc].z+16 > segment[n].border.bottom then
									segment[n].border.bottom = segment[n].point[pc].z+16
								end--]]
								local currHeight = spGetGroundHeight(segment[n].point[pc].x, segment[n].point[pc].z)
								segment[n].point[pc].orHeight = currHeight
								segment[n].point[pc].prevHeight = currHeight
								if checkPointCreation(terraform_type, volumeSelection, currHeight, terraformHeight) then
									pc = pc + 1
								end
							end
						end
					end

				end

			end

			-- discard segments with no new terraforming
			if pc ~= 1 then
				segment[n].position = {x = averagePosition.x/averagePosition.n, z = averagePosition.z/averagePosition.n}
				segment[n].points = pc - 1
				n = n + 1
			end
			count = count + 1
		else
			continue = false
		end

	end

	-- Prepare every segment for one combined delayed task.

	delayedTerraform.PrepareSegments(segment, n - 1, terraform_type, terraformHeight)
	return delayedTerraform.FreezeSegments(segment, n - 1, maxHeightDifference)

end

local function TerraformArea(terraform_type,mPoint,mPoints,terraformHeight,unit,units,team,volumeSelection,shift)

	local border = {left = mapWidth, right = 0, top = mapHeight, bottom = 0} -- border for the entire area

	--** Initial constructor processing **
	local unitsX = 0
	local unitsZ = 0
	local i = 1
	while i <= units do
		if (spValidUnitID(unit[i])) then
			local x,_,z = spGetUnitPosition(unit[i])
			unitsX = unitsX + x
			unitsZ = unitsZ + z
			i = i + 1
		else
			unit[i] = unit[units]
			unit[units] = nil
			units = units - 1
		end
	end

	if units == 0 then
		return
	end

	unitsX = unitsX/units
	unitsZ = unitsZ/units

	--** Convert Mouse Points to a Closed Loop on a Grid **

	-- close the mouse points loop
	mPoints = mPoints + 1
	mPoint[mPoints] = mPoint[1]

	-- points interpolated from mouse points
	local point = {}
	local points = 1

	-- snap mouse to grid
	mPoint[1].x = floor(mPoint[1].x/16)*16
	mPoint[1].z = floor(mPoint[1].z/16)*16
	point[1] = mPoint[1]
	updateBorderWithPoint(border, point[points].x, point[points].z)

	for i = 2, mPoints, 1 do
		-- snap mouse to grid
		mPoint[i].x = floor(mPoint[i].x/16)*16
		mPoint[i].z = floor(mPoint[i].z/16)*16

		local diffX = mPoint[i].x - mPoint[i-1].x
		local diffZ = mPoint[i].z - mPoint[i-1].z
		local a_diffX = abs(diffX)
		local a_diffZ = abs(diffZ)

		-- do not add another points of the same coordinates
		if a_diffX <= 16 and a_diffZ <= 16 then
			points = points + 1
			point[points] = {x = mPoint[i].x, z = mPoint[i].z}
			updateBorderWithPoint(border, point[points].x, point[points].z)
		else
			-- interpolate between far apart points to prevent loop holes.
			if a_diffX > a_diffZ then
				local m = diffZ/diffX
				local sign = diffX/a_diffX
				for j = 0, a_diffX, 16 do
					points = points + 1
					point[points] = {x = mPoint[i].x - j*sign, z = floor((mPoint[i].z - j*m*sign)/16)*16}
					updateBorderWithPoint(border, point[points].x, point[points].z)
				end
			else
				local m = diffX/diffZ
				local sign = diffZ/a_diffZ
				for j = 0, a_diffZ, 16 do
					points = points + 1
					point[points] = {x = floor((mPoint[i].x - j*m*sign)/16)*16, z = mPoint[i].z - j*sign}
					updateBorderWithPoint(border, point[points].x, point[points].z)
				end
			end

		end
	end

	if border.right-border.left + 16 > maxAreaSize
			or border.bottom-border.top + 16 > maxAreaSize then
		-- cancel command if the area is too big, anti-slowdown
		return false
	end

	--** Compute which points are on the inside of the Loop **
	-- Uses Floodfill, a faster algorithm is possible?

	local area = {}

	-- 2D array
	for i = border.left-16,border.right+16,16 do
		area[i] = {}
	end

	-- set loop edge points to 2. 2 cannot be flooded
	for i = 1, points do
		area[point[i].x][point[i].z] = 2
	end

	-- set all other array points to 1. 1 is vunerable
	for i = border.left,border.right,16 do
		for j = border.top,border.bottom,16 do
			if area[i][j] ~= 2 then
				area[i][j] = 1
			end
		end
	end

	-- set the points on the border of the array to -1. -1 is the 'flood'
	for i = border.left,border.right,16 do
		if area[i][border.top] ~= 2 then
			area[i][border.top] = -1
		end
		if area[i][border.bottom] ~= 2 then
			area[i][border.bottom] = -1
		end
	end
	for i = border.top,border.bottom,16 do
		if area[border.left][i] ~= 2 then
			area[border.left][i] = -1
		end
		if area[border.right][i] ~= 2 then
			area[border.right][i] = -1
		end
	end

	-- floodfill algorithm turning 1s into -1s. -1s turn to false
	local continue = true
	while continue do
		continue = false
		for i = border.left,border.right,16 do
			for j = border.top,border.bottom,16 do
				if area[i][j] == -1 then
					if area[i+16][j] == 1 then
						area[i+16][j] = -1
						continue = true
					end
					if area[i-16][j]  == 1 then
						area[i-16][j]  = -1
						continue = true
					end
					if area[i][j+16] == 1 then
						area[i][j+16] = -1
						continue = true
					end
					if area[i][j-16] == 1 then
						area[i][j-16] = -1
						continue = true
					end
					area[i][j] = false
				end
			end
		end

	end

	--** Break the area into segments to be individually terraformed **

	border.right = border.right + 16
	border.bottom = border.bottom + 16

	local width = (border.right-border.left)/ceil((border.right-border.left)/areaSegMaxSize)
	local height = (border.bottom-border.top)/ceil((border.bottom-border.top)/areaSegMaxSize)
	-- width and height are the witdh and height of segments. They must be squished to all be the same size

	local segment = {}

	local wCount = ceil((border.right-border.left)/areaSegMaxSize) - 1
	local hCount = ceil((border.bottom-border.top)/areaSegMaxSize) - 1
	-- w/hCount is the number of segments that fit into the width/height
	local addX = 0
	-- addX and addZ prevent overlap
	local n = 1 -- segment count
	for i = 0, wCount do
		local addZ = 0
		for j = 0, hCount do
			-- i and j step through possible segments based on splitting the rectangular area into rectangles
			segment[n] = {}
			segment[n].grid = {x = i, z = j}
			segment[n].point = {}
			segment[n].area = {}
			segment[n].border = {left = mapWidth, right = 0, top = mapHeight, bottom = 0}
			local totalX = 0
			local totalZ = 0
			-- totalX/Z is used to find the average position of the segment
			local m = 1 -- number of points in the segment
			for lx = border.left + floor(width * i/8)*8 + addX, border.left + floor(width * (i+1)/8)*8, 16 do
				for lz = border.top + floor(height * j/8)*8 + addZ, border.top + floor(height * (j+1)/8)*8, 16 do
					-- lx/lz steps though all 16x16 points
					if area[floor(lx/16)*16][floor(lz/16)*16] then
						--Spring.MarkerAddLine(floor(lx/16)*16-2,0,floor(lz/16)*16-2, floor(lx/16)*16+2,0,floor(lz/16)*16+2)
						--Spring.MarkerAddLine(floor(lx/16)*16-2,0,floor(lz/16)*16+2, floor(lx/16)*16+2,0,floor(lz/16)*16-2)

						-- fill in the top, left and middle
						for x = lx, lx+8, 8 do
							for z = lz, lz+8, 8 do
								local currHeight = spGetGroundHeight(x, z)
								if checkPointCreation(terraform_type, volumeSelection, currHeight, terraformHeight) then
									segment[n].point[m] = {x = x, z = z, orHeight = currHeight, prevHeight = currHeight}
									m = m + 1
									totalX = totalX + x
									totalZ = totalZ + z
									updateBorderWithPoint(segment[n].border, x, z)
								end
							end
						end

						local right = not area[floor(lx/16)*16+16][floor(lz/16)*16]
						local bottom = not area[floor(lx/16)*16][floor(lz/16)*16+16]

						-- fill in bottom right if it is missing
						if right and bottom then
							local currHeight = spGetGroundHeight(lx+16, lz+16)
							if checkPointCreation(terraform_type, volumeSelection, currHeight, terraformHeight) then
								segment[n].point[m] = {x = lx+16, z = lz+16, orHeight = currHeight, prevHeight = currHeight}
								m = m + 1
								totalX = totalX + lx+16
								totalZ = totalZ + lz+16
								updateBorderWithPoint(segment[n].border, lx+16, lz+16)
							end
						end

						if right then
							for z = lz, lz+8, 8 do
								local currHeight = spGetGroundHeight(lx+16, z)
								if checkPointCreation(terraform_type, volumeSelection, currHeight, terraformHeight) then
									segment[n].point[m] = {x = lx+16, z = z, orHeight = currHeight, prevHeight = currHeight}
									m = m + 1
									totalX = totalX + lx+16
									totalZ = totalZ + z
									updateBorderWithPoint(segment[n].border, lx+16, z)
								end
							end
						end

						if bottom then
							for x = lx, lx+8, 8 do
								local currHeight = spGetGroundHeight(x, lz+16)
								if checkPointCreation(terraform_type, volumeSelection, currHeight, terraformHeight) then
									segment[n].point[m] = {x = x, z = lz+16, orHeight = currHeight, prevHeight = currHeight}
									m = m + 1
									totalX = totalX + x
									totalZ = totalZ + lz+16
									updateBorderWithPoint(segment[n].border, x, lz+16)
								end
							end
						end

					end
				end

			end
			addZ = 8
			-- if there are no points in the segment the segment is discarded
			if m ~= 1 then
				segment[n].points = m - 1
				segment[n].position = {x = totalX/(m-1), z = totalZ/(m-1)}
				n = n + 1
			end
		end
		addX = 8
	end

	-- Prepare every segment for one combined delayed task.

	delayedTerraform.PrepareSegments(segment, n - 1, terraform_type, terraformHeight)
	return delayedTerraform.FreezeSegments(segment, n - 1, maxHeightDifference)

end

--------------------------------------------------------------------------------
-- Recieve Terraform command from UI widget
--------------------------------------------------------------------------------

local taskController = {
	activeByUnit = {},
	activeByID = {},
	occupied = {},
	capturedStructures = {},
	finishedTagByUnit = {},
	nextTaskID = 0,
	redirectingUnitID = false,
	moveCtrlTag = 39802,
}

function taskController.IsFiniteNumber(value)
	return type(value) == "number"
		and value == value
		and value ~= math.huge
		and value ~= -math.huge
end

function taskController.ParseCommand(unitID, teamID, cmdParams)
	if type(cmdParams) ~= "table" then
		return
	end

	local terraformType = cmdParams[1]
	local loop = cmdParams[3]
	local terraformHeight = cmdParams[4]
	local pointCount = cmdParams[5]
	local commanderCount = cmdParams[6]
	local volumeSelection = cmdParams[7]

	if not taskController.IsFiniteNumber(terraformType)
		or terraformType % 1 ~= 0
		or (terraformType ~= 1 and terraformType ~= 3 and terraformType ~= 4 and terraformType ~= 5)
		or not taskController.IsFiniteNumber(loop)
		or (loop ~= 0 and loop ~= 1)
		or not taskController.IsFiniteNumber(terraformHeight)
		or not taskController.IsFiniteNumber(pointCount)
		or pointCount % 1 ~= 0
		or not taskController.IsFiniteNumber(commanderCount)
		or commanderCount % 1 ~= 0
		or not taskController.IsFiniteNumber(volumeSelection)
		or volumeSelection % 1 ~= 0
		or volumeSelection < 0
		or volumeSelection > 2 then
		return
	end

	if terraformType == 4 then
		if pointCount ~= 2 then
			return
		end
	elseif terraformType == 1 and abs(terraformHeight) > maxAbsoluteHeight then
		return
	elseif terraformType == 5 then
		if loop ~= 1
			or terraformHeight ~= 0
			or volumeSelection ~= 0
			or pointCount < 4
			or pointCount > maxWallPoints then
			return
		end
	elseif pointCount < 2 or pointCount > maxWallPoints then
		return
	end
	if commanderCount < 1 then
		return
	end
	local pointParameterCount = terraformType == 4 and pointCount * 3 or pointCount * 2
	if #cmdParams < 7 + pointParameterCount + commanderCount then
		return
	end

	local parsed = {
		terraformType = terraformType,
		teamID = teamID,
		loop = loop,
		terraformHeight = terraformHeight,
		pointCount = pointCount,
		volumeSelection = volumeSelection,
		points = {},
		commanders = {},
	}

	local parameterIndex = 8
	for i = 1, pointCount do
		local x = cmdParams[parameterIndex]
		local y
		local z
		if terraformType == 4 then
			y = cmdParams[parameterIndex + 1]
			z = cmdParams[parameterIndex + 2]
			parameterIndex = parameterIndex + 3
		else
			z = cmdParams[parameterIndex + 1]
			parameterIndex = parameterIndex + 2
		end

		if not taskController.IsFiniteNumber(x)
			or not taskController.IsFiniteNumber(z)
			or x < 0
			or x > mapWidth
			or z < 0
			or z > mapHeight
			or (terraformType == 4
				and (not taskController.IsFiniteNumber(y) or abs(y) > maxAbsoluteHeight)) then
			return
		end

		parsed.points[i] = {x = x, y = y, z = z}
	end

	local commanderSeen = {}
	local containsCommandUnit = false
	for i = 1, commanderCount do
		local commanderID = cmdParams[parameterIndex]
		parameterIndex = parameterIndex + 1
		if taskController.IsFiniteNumber(commanderID)
			and commanderID % 1 == 0
			and not commanderSeen[commanderID]
			and spValidUnitID(commanderID)
			and not spGetUnitIsDead(commanderID)
			and spGetUnitTeam(commanderID) == teamID then
			local commanderDefID = Spring.GetUnitDefID(commanderID)
			if commanderDefs[commanderDefID] then
				commanderSeen[commanderID] = true
				parsed.commanders[#parsed.commanders + 1] = commanderID
				if commanderID == unitID then
					containsCommandUnit = true
				end
			end
		end
	end

	if #parsed.commanders == 0 or not containsCommandUnit then
		return
	end

	return parsed
end

function taskController.DistanceToSegmentSquared(x, z, firstPoint, secondPoint)
	local segmentX = secondPoint.x - firstPoint.x
	local segmentZ = secondPoint.z - firstPoint.z
	local segmentLengthSquared = segmentX * segmentX + segmentZ * segmentZ
	if segmentLengthSquared <= 0.0001 then
		local dx = x - firstPoint.x
		local dz = z - firstPoint.z
		return dx * dx + dz * dz
	end

	local projection = (
		(x - firstPoint.x) * segmentX
		+ (z - firstPoint.z) * segmentZ
	) / segmentLengthSquared
	projection = math.max(0, math.min(1, projection))

	local closestX = firstPoint.x + segmentX * projection
	local closestZ = firstPoint.z + segmentZ * projection
	local dx = x - closestX
	local dz = z - closestZ
	return dx * dx + dz * dz
end

function taskController.IsPointInsideArea(x, z, points, pointCount)
	local inside = false
	local previous = points[pointCount]
	for i = 1, pointCount do
		local current = points[i]
		if (current.z > z) ~= (previous.z > z) then
			local crossingX = (previous.x - current.x)
				* (z - current.z)
				/ (previous.z - current.z)
				+ current.x
			if x < crossingX then
				inside = not inside
			end
		end
		previous = current
	end
	return inside
end

function taskController.DistanceToCommandSquared(x, z, parsed)
	if parsed.loop == 1
		and parsed.terraformType ~= 4
		and parsed.pointCount >= 3
		and taskController.IsPointInsideArea(x, z, parsed.points, parsed.pointCount) then
		return 0
	end

	local closestDistance
	local segmentCount = parsed.pointCount - 1
	for i = 1, segmentCount do
		local distance = taskController.DistanceToSegmentSquared(
			x,
			z,
			parsed.points[i],
			parsed.points[i + 1]
		)
		if not closestDistance or distance < closestDistance then
			closestDistance = distance
		end
	end

	if parsed.loop == 1 and parsed.terraformType ~= 4 then
		local distance = taskController.DistanceToSegmentSquared(
			x,
			z,
			parsed.points[parsed.pointCount],
			parsed.points[1]
		)
		if not closestDistance or distance < closestDistance then
			closestDistance = distance
		end
	end

	if parsed.terraformType == 4 then
		local distance = sqrt(closestDistance or 0) - abs(parsed.terraformHeight)
		return distance > 0 and distance * distance or 0
	end
	return closestDistance or 0
end

function taskController.ChooseCommander(parsed)
	local closestCommander
	local closestDistance

	for i = 1, #parsed.commanders do
		local commanderID = parsed.commanders[i]
		local x, _, z = spGetUnitPosition(commanderID)
		if x and z then
			local distance = taskController.DistanceToCommandSquared(x, z, parsed)
			if not closestDistance
				or distance < closestDistance
				or (distance == closestDistance and commanderID < closestCommander) then
				closestCommander = commanderID
				closestDistance = distance
			end
		end
	end

	return closestCommander
end

function taskController.CopyCommandOptions(cmdOptions)
	local options = {}
	local optionNames = {"alt", "ctrl", "meta", "shift", "right"}
	for i = 1, #optionNames do
		local optionName = optionNames[i]
		if cmdOptions[optionName] then
			options[#options + 1] = optionName
		end
	end
	return options
end

function taskController.SendTeamMessage(teamID, message)
	SendToUnsynced("terraform_team_message", teamID, message)
end

function taskController.PrepareFrozen(unitID, teamID, cmdParams)
	local parsed = taskController.ParseCommand(unitID, teamID, cmdParams)
	if not parsed then
		return nil, "invalid"
	end

	if parsed.terraformType == 4 then
		local firstPoint = parsed.points[1]
		local secondPoint = parsed.points[2]
		return TerraformRamp(
			firstPoint.x,
			firstPoint.y,
			firstPoint.z,
			secondPoint.x,
			secondPoint.y,
			secondPoint.z,
			parsed.terraformHeight * 2,
			parsed.commanders,
			#parsed.commanders,
			teamID,
			parsed.volumeSelection,
			false
		)
	end

	if parsed.loop == 0 then
		return TerraformWall(
			parsed.terraformType,
			parsed.points,
			parsed.pointCount,
			parsed.terraformHeight,
			parsed.commanders,
			#parsed.commanders,
			teamID,
			parsed.volumeSelection,
			false
		)
	end

	return TerraformArea(
		parsed.terraformType,
		parsed.points,
		parsed.pointCount,
		parsed.terraformHeight,
		parsed.commanders,
		#parsed.commanders,
		teamID,
		parsed.volumeSelection,
		false
	)
end

function taskController.FindOverlap(frozen)
	for i = 1, frozen.count do
		local point = frozen.points[i]
		if taskController.occupied[point.x]
			and taskController.occupied[point.x][point.z] then
			return true
		end
	end
	return false
end

function taskController.ReserveGrid(task)
	for i = 1, task.frozen.count do
		local point = task.frozen.points[i]
		if not taskController.occupied[point.x] then
			taskController.occupied[point.x] = {}
		end
		taskController.occupied[point.x][point.z] = task.id
	end
end

function taskController.ReleaseGrid(task)
	for i = 1, task.frozen.count do
		local point = task.frozen.points[i]
		local column = taskController.occupied[point.x]
		if column and column[point.z] == task.id then
			column[point.z] = nil
			if not next(column) then
				taskController.occupied[point.x] = nil
			end
		end
	end
end

function taskController.MakePublicTask(task)
	local pointData = {}
	for i = 1, task.frozen.count do
		local point = task.frozen.points[i]
		local dataIndex = (i - 1) * 3
		pointData[dataIndex + 1] = point.x
		pointData[dataIndex + 2] = point.finalHeight
		pointData[dataIndex + 3] = point.z
	end

	local publicTask = {
		id = task.id,
		unitID = task.unitID,
		teamID = task.teamID,
		state = "walking",
		remainingFrames = task.remainingFrames,
		totalFrames = task.totalFrames,
		anchorX = task.anchor.x,
		anchorY = math.max(task.anchor.initialHeight, task.anchor.finalHeight) + 36,
		anchorZ = task.anchor.z,
	}
	local publicGeometry = {
		pointCount = task.frozen.count,
		pointData = pointData,
	}
	return publicTask, publicGeometry
end

function taskController.GetBlockingState(unitID)
	local isBlocking, isSolidObjectCollidable, isProjectileCollidable,
		isRaySegmentCollidable, crushable, blockEnemyPushing, blockHeightChanges =
		Spring.GetUnitBlocking(unitID)
	return {
		isBlocking = isBlocking,
		isSolidObjectCollidable = isSolidObjectCollidable,
		isProjectileCollidable = isProjectileCollidable,
		isRaySegmentCollidable = isRaySegmentCollidable,
		crushable = crushable,
		blockEnemyPushing = blockEnemyPushing,
		blockHeightChanges = blockHeightChanges,
	}
end

function taskController.RestoreBlockingState(unitID, blocking)
	if not blocking then
		return
	end
	Spring.SetUnitBlocking(
		unitID,
		blocking.isBlocking,
		blocking.isSolidObjectCollidable,
		blocking.isProjectileCollidable,
		blocking.isRaySegmentCollidable,
		blocking.crushable,
		blocking.blockEnemyPushing,
		blocking.blockHeightChanges
	)
end

function taskController.OwnsMoveCtrl(unitID)
	return Spring.MoveCtrl.IsEnabled(unitID)
		and Spring.MoveCtrl.GetTag(unitID) == taskController.moveCtrlTag
end

function taskController.RestoreCapturedStructureBlocking(unitID, capture)
	if not capture.noBlocking or not taskController.OwnsMoveCtrl(unitID) then
		return
	end
	Spring.MoveCtrl.SetNoBlocking(unitID, false)
	taskController.RestoreBlockingState(unitID, capture.blocking)
	capture.noBlocking = false
	capture.blocking = nil
end

function taskController.UpdateCapturedStructurePosition(unitID, capture)
	if not spValidUnitID(unitID)
		or spGetUnitIsDead(unitID)
		or not taskController.OwnsMoveCtrl(unitID) then
		return false
	end

	local groundHeight = spGetGroundHeight(capture.x, capture.z)
	Spring.MoveCtrl.SetPosition(
		unitID,
		capture.x,
		groundHeight + capture.groundOffset,
		capture.z
	)

	local structureData = structure[unitID]
	if structureData then
		structureData.h = spGetGroundHeight(structureData.x, structureData.z)
	end
	return true
end

function taskController.ForgetCapturedStructure(unitID)
	local capture = taskController.capturedStructures[unitID]
	if not capture then
		return
	end
	for taskID in pairs(capture.owners) do
		local task = taskController.activeByID[taskID]
		if task then
			task.capturedStructures[unitID] = nil
		end
	end
	taskController.capturedStructures[unitID] = nil
end

function taskController.RestoreCapturedStructure(unitID, capture)
	if spValidUnitID(unitID) and not spGetUnitIsDead(unitID)
			and taskController.OwnsMoveCtrl(unitID) then
		taskController.UpdateCapturedStructurePosition(unitID, capture)
		taskController.RestoreCapturedStructureBlocking(unitID, capture)
		Spring.MoveCtrl.SetTag(unitID, 0)
		Spring.MoveCtrl.Disable(unitID)
	end
	taskController.capturedStructures[unitID] = nil
end

function taskController.GetSortedTaskStructureIDs(task)
	local unitIDs = {}
	for unitID in pairs(task.capturedStructures) do
		unitIDs[#unitIDs + 1] = unitID
	end
	table.sort(unitIDs)
	return unitIDs
end

function taskController.ReleaseTaskStructures(task)
	local unitIDs = taskController.GetSortedTaskStructureIDs(task)
	for i = 1, #unitIDs do
		local unitID = unitIDs[i]
		local capture = taskController.capturedStructures[unitID]
		task.capturedStructures[unitID] = nil
		if capture then
			capture.owners[task.id] = nil
			if next(capture.owners) then
				if taskController.OwnsMoveCtrl(unitID) then
					taskController.RestoreCapturedStructureBlocking(unitID, capture)
					taskController.UpdateCapturedStructurePosition(unitID, capture)
				end
			else
				taskController.RestoreCapturedStructure(unitID, capture)
			end
		end
	end
end

function taskController.CaptureStructure(task, unitID)
	if task.capturedStructures[unitID] then
		return true
	end
	if not structure[unitID]
		or not spValidUnitID(unitID)
		or spGetUnitIsDead(unitID) then
		return true
	end

	local capture = taskController.capturedStructures[unitID]
	if capture then
		if not taskController.OwnsMoveCtrl(unitID) then
			return false
		end
	else
		if Spring.MoveCtrl.IsEnabled(unitID) then
			return false
		end

		local x, y, z = spGetUnitPosition(unitID)
		if not x or not z then
			return false
		end
		local groundHeight = spGetGroundHeight(x, z)
		capture = {
			x = x,
			z = z,
			groundOffset = (y or groundHeight) - groundHeight,
			owners = {},
		}

		Spring.MoveCtrl.Enable(unitID)
		Spring.MoveCtrl.SetTag(unitID, taskController.moveCtrlTag)
		Spring.MoveCtrl.SetPosition(unitID, x, y or groundHeight, z)
		if not taskController.OwnsMoveCtrl(unitID) then
			if Spring.MoveCtrl.IsEnabled(unitID)
					and Spring.MoveCtrl.GetTag(unitID) == taskController.moveCtrlTag then
				Spring.MoveCtrl.SetTag(unitID, 0)
				Spring.MoveCtrl.Disable(unitID)
			end
			return false
		end
		taskController.capturedStructures[unitID] = capture
	end

	capture.owners[task.id] = true
	task.capturedStructures[unitID] = true
	return true
end

function taskController.CaptureOverlappingStructures(task)
	local unitIDs = {}
	for i = 1, structureCount do
		local unitID = structureTable[i]
		local structureData = structure[unitID]
		if structureData
				and delayedTerraform.OverlapsStructure(task.frozen, structureData) then
			unitIDs[#unitIDs + 1] = unitID
		end
	end
	table.sort(unitIDs)

	for i = 1, #unitIDs do
		if not taskController.CaptureStructure(task, unitIDs[i]) then
			return false
		end
	end
	return true
end

function taskController.ValidateTaskStructures(task)
	if not taskController.CaptureOverlappingStructures(task) then
		return false
	end

	local unitIDs = taskController.GetSortedTaskStructureIDs(task)
	for i = 1, #unitIDs do
		local unitID = unitIDs[i]
		if not structure[unitID]
				or not spValidUnitID(unitID)
				or spGetUnitIsDead(unitID) then
			taskController.ForgetCapturedStructure(unitID)
		else
			local capture = taskController.capturedStructures[unitID]
			if not capture
					or not capture.owners[task.id]
					or not taskController.OwnsMoveCtrl(unitID) then
				return false
			end
		end
	end
	return true
end

function taskController.SetTaskStructuresNoBlocking(task, noBlocking)
	local valid = true
	local unitIDs = taskController.GetSortedTaskStructureIDs(task)
	for i = 1, #unitIDs do
		local unitID = unitIDs[i]
		if structure[unitID] and spValidUnitID(unitID) and not spGetUnitIsDead(unitID) then
			if taskController.OwnsMoveCtrl(unitID) then
				local capture = taskController.capturedStructures[unitID]
				if noBlocking then
					if not capture.noBlocking then
						capture.blocking = taskController.GetBlockingState(unitID)
						capture.noBlocking = true
					end
					Spring.MoveCtrl.SetNoBlocking(unitID, true)
				else
					taskController.RestoreCapturedStructureBlocking(unitID, capture)
				end
			else
				valid = false
			end
		end
	end
	return valid
end

function taskController.StartTask(unitID, unitDefID, teamID, cmdParams, cmdTag)
	local frozen, prepareError = taskController.PrepareFrozen(unitID, teamID, cmdParams)
	if not frozen then
		if prepareError == "height" then
			taskController.SendTeamMessage(
				teamID,
				"Terraform rejected: the target height exceeds the limit."
			)
		elseif prepareError ~= "nochange" then
			taskController.SendTeamMessage(
				teamID,
				"Terraform rejected: invalid area."
			)
		end
		return false
	end

	if taskController.FindOverlap(frozen) then
		taskController.SendTeamMessage(
			teamID,
			"Terraform rejected: the area overlaps an active job."
		)
		return false
	end

	local unitX, _, unitZ = spGetUnitPosition(unitID)
	local anchor = unitX and delayedTerraform.FindClosestPoint(frozen, unitX, unitZ)
	local unitDef = UnitDefs[unitDefID]
	local buildSpeed = unitDef and unitDef.buildSpeed or 0
	if not anchor or buildSpeed <= 0 then
		taskController.SendTeamMessage(
			teamID,
			"Terraform rejected: the commander cannot perform this work."
		)
		return false
	end

	local durationSeconds = math.max(1, frozen.work / (buildSpeed * terraformSpeedMultiplier))
	local durationFrames = math.ceil(durationSeconds * Game.gameSpeed)

	taskController.nextTaskID = taskController.nextTaskID + 1
	local task = {
		id = taskController.nextTaskID,
		unitID = unitID,
		unitDefID = unitDefID,
		teamID = teamID,
		cmdTag = cmdTag,
		frozen = frozen,
		anchor = anchor,
		buildDistance = unitDef.buildDistance or 0,
		remainingFrames = durationFrames,
		totalFrames = durationFrames,
		started = false,
		building = false,
		moveGoalSet = false,
		lastMoveGoalFrame = -Game.gameSpeed,
		capturedStructures = {},
	}
	if not taskController.CaptureOverlappingStructures(task) then
		taskController.ReleaseTaskStructures(task)
		taskController.SendTeamMessage(
			teamID,
			"Terraform rejected: a building is controlled by another movement system."
		)
		return false
	end

	task.public, task.publicGeometry = taskController.MakePublicTask(task)
	taskController.activeByUnit[unitID] = task
	taskController.activeByID[task.id] = task
	taskController.ReserveGrid(task)
	_G.terraformPreviewTasks[task.id] = task.public
	_G.terraformPreviewGeometry[task.id] = task.publicGeometry
	return true
end

function taskController.StartBuilding(task)
	local _, _, _, midX, midY, midZ = Spring.GetUnitPosition(
		task.unitID,
		true
	)
	if not midX then
		return
	end

	local dx = task.anchor.x - midX
	local dy = task.anchor.finalHeight - midY
	local dz = task.anchor.z - midZ
	local distance = sqrt(dx * dx + dy * dy + dz * dz)
	if distance <= 0.0001 then
		distance = 1
	end

	local goalHeading = Spring.GetHeadingFromVector(dx, dz)
	local unitHeading = Spring.GetUnitHeading(task.unitID) or 0
	local relativeHeading = (goalHeading - unitHeading + 32768) % 65536 - 32768

	local frontX, frontY, frontZ, _, _, _, upX, upY, upZ =
		Spring.GetUnitDirection(task.unitID)
	local directionX = dx / distance
	local directionY = dy / distance
	local directionZ = dz / distance
	local elevation = math.asin(math.max(-1, math.min(
		1,
		directionX * upX + directionY * upY + directionZ * upZ
	)))
	local currentPitch = math.asin(math.max(-1, math.min(
		1,
		frontX * upX + frontY * upY + frontZ * upZ
	)))
	local relativePitch = (elevation - currentPitch) * 32768 / math.pi

	Spring.CallCOBScript(
		task.unitID,
		"StartBuilding",
		0,
		relativeHeading,
		relativePitch
	)
	task.building = true
end

function taskController.StopBuilding(task)
	if task.building and spValidUnitID(task.unitID) then
		Spring.CallCOBScript(task.unitID, "StopBuilding", 0)
	end
	task.building = false
end

function taskController.SetState(task, state)
	task.public.state = state
	task.public.remainingFrames = task.remainingFrames
end

function taskController.RefreshAllyTeamTerrain(teamID)
	local allyTeamID = Spring.GetTeamAllyTeamID(teamID)
	if allyTeamID == nil or Spring.GetGlobalLos(allyTeamID) then
		return
	end

	Spring.SetGlobalLos(allyTeamID, true)
	Spring.SetGlobalLos(allyTeamID, false)
end

function taskController.ReleaseTask(task, removeCommand)
	taskController.StopBuilding(task)
	if spValidUnitID(task.unitID) and not spGetUnitIsDead(task.unitID) then
		Spring.ClearUnitGoal(task.unitID)
	end

	taskController.ReleaseTaskStructures(task)
	taskController.ReleaseGrid(task)
	taskController.activeByUnit[task.unitID] = nil
	taskController.activeByID[task.id] = nil
	_G.terraformPreviewTasks[task.id] = nil
	_G.terraformPreviewGeometry[task.id] = nil
	taskController.finishedTagByUnit[task.unitID] = task.cmdTag

	if removeCommand and spValidUnitID(task.unitID) and not spGetUnitIsDead(task.unitID) then
		Spring.GiveOrderToUnit(task.unitID, CMD.REMOVE, {task.cmdTag}, {})
	end
end

function taskController.CancelTask(task, message, removeCommand)
	if message then
		taskController.SendTeamMessage(task.teamID, message)
	end
	taskController.ReleaseTask(task, removeCommand)
end

function taskController.UpdateTask(task, gameFrame)
	if not spValidUnitID(task.unitID)
		or spGetUnitIsDead(task.unitID)
		or spGetUnitTeam(task.unitID) ~= task.teamID
		or Spring.GetUnitDefID(task.unitID) ~= task.unitDefID then
		taskController.CancelTask(task, nil, false)
		return
	end

	local commands = Spring.GetUnitCommands(task.unitID, 1)
	local currentCommand = commands and commands[1]
	if not currentCommand
		or currentCommand.id ~= CMD_TERRAFORM_INTERNAL
		or currentCommand.tag ~= task.cmdTag then
		taskController.CancelTask(task, nil, true)
		return
	end

	local unitX, _, unitZ = spGetUnitPosition(task.unitID)
	if not unitX then
		taskController.CancelTask(task, nil, false)
		return
	end

	local dx = task.anchor.x - unitX
	local dz = task.anchor.z - unitZ
	local inRange = dx * dx + dz * dz <= task.buildDistance * task.buildDistance
	local stunnedOrBuilt = Spring.GetUnitIsStunned(task.unitID)

	if not inRange then
		local goalRadius = math.max(0, task.buildDistance - 4)
		if not task.moveGoalSet
			or gameFrame - task.lastMoveGoalFrame >= Game.gameSpeed then
			Spring.SetUnitMoveGoal(
				task.unitID,
				task.anchor.x,
				Spring.GetGroundHeight(task.anchor.x, task.anchor.z),
				task.anchor.z,
				goalRadius
			)
			task.moveGoalSet = true
			task.lastMoveGoalFrame = gameFrame
		end
		taskController.StopBuilding(task)
		if stunnedOrBuilt or task.started then
			taskController.SetState(task, "paused")
		else
			taskController.SetState(task, "walking")
		end
		return
	end

	if task.moveGoalSet or not task.started then
		Spring.ClearUnitGoal(task.unitID)
		task.moveGoalSet = false
	end
	if stunnedOrBuilt then
		taskController.StopBuilding(task)
		taskController.SetState(task, "paused")
		return
	end

	if not task.building then
		taskController.StartBuilding(task)
	end
	task.started = true
	task.remainingFrames = task.remainingFrames - 1
	taskController.SetState(task, "working")

	if task.remainingFrames > 0 then
		return
	end

	if not taskController.ValidateTaskStructures(task) then
		taskController.CancelTask(
			task,
			"Terraform canceled: a building is controlled by another movement system.",
			true
		)
		return
	end

	if not taskController.SetTaskStructuresNoBlocking(task, true) then
		taskController.SetTaskStructuresNoBlocking(task, false)
		taskController.CancelTask(
			task,
			"Terraform canceled: control of a building was lost.",
			true
		)
		return
	end

	local applied = delayedTerraform.Apply(task.frozen, USE_TERRAIN_TEXTURE_CHANGE)
	taskController.SetTaskStructuresNoBlocking(task, false)
	if applied then
		taskController.RefreshAllyTeamTerrain(task.teamID)
		taskController.ReleaseTask(task, true)
	else
		taskController.CancelTask(
			task,
			"Terraform canceled: the frozen grid could not be applied.",
			true
		)
	end
end

function taskController.UpdateAll(gameFrame)
	local tasksToUpdate = {}
	for _, task in pairs(taskController.activeByUnit) do
		tasksToUpdate[#tasksToUpdate + 1] = task
	end
	table.sort(tasksToUpdate, function(firstTask, secondTask)
		return firstTask.id < secondTask.id
	end)
	for i = 1, #tasksToUpdate do
		if taskController.activeByUnit[tasksToUpdate[i].unitID] == tasksToUpdate[i] then
			taskController.UpdateTask(tasksToUpdate[i], gameFrame)
		end
	end
end

function taskController.CancelUnitTask(unitID, removeCommand)
	local task = taskController.activeByUnit[unitID]
	if task then
		taskController.CancelTask(task, nil, removeCommand)
	end
end

function taskController.CancelQueuedCommands(unitID)
	if not spValidUnitID(unitID) or spGetUnitIsDead(unitID) then
		return
	end

	local commands = Spring.GetUnitCommands(unitID, -1) or {}
	for i = 1, #commands do
		local command = commands[i]
		if command.id == CMD_TERRAFORM_INTERNAL then
			Spring.GiveOrderToUnit(unitID, CMD.REMOVE, {command.tag}, {})
		end
	end
end

function taskController.CaptureTasksForStructure(unitID, structureData)
	local tasks = {}
	for _, task in pairs(taskController.activeByID) do
		if delayedTerraform.OverlapsStructure(task.frozen, structureData) then
			tasks[#tasks + 1] = task
		end
	end
	table.sort(tasks, function(firstTask, secondTask)
		return firstTask.id < secondTask.id
	end)

	for i = 1, #tasks do
		local task = tasks[i]
		if taskController.activeByID[task.id] == task
				and not taskController.CaptureStructure(task, unitID) then
			taskController.CancelTask(
				task,
				"Terraform canceled: a building is controlled by another movement system.",
				true
			)
		end
	end
end

function taskController.CancelAll(removeCommand)
	local tasksToCancel = {}
	for _, task in pairs(taskController.activeByID) do
		tasksToCancel[#tasksToCancel + 1] = task
	end
	for i = 1, #tasksToCancel do
		taskController.CancelTask(tasksToCancel[i], nil, removeCommand)
	end
end

function taskController.ReleaseAllCapturedStructures()
	local unitIDs = {}
	for unitID in pairs(taskController.capturedStructures) do
		unitIDs[#unitIDs + 1] = unitID
	end
	table.sort(unitIDs)
	for i = 1, #unitIDs do
		local unitID = unitIDs[i]
		local capture = taskController.capturedStructures[unitID]
		if capture then
			capture.owners = {}
			taskController.RestoreCapturedStructure(unitID, capture)
		end
	end
end

function gadget:AllowCommand_GetWantedCommand()
	return {[CMD_TERRAFORM_INTERNAL] = true}
end

function gadget:AllowCommand_GetWantedUnitDefID()
	return true
end

function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
	if cmdID ~= CMD_TERRAFORM_INTERNAL then
		return true
	end
	if not commanderDefs[unitDefID] then
		return false
	end

	local parsed = taskController.ParseCommand(unitID, teamID, cmdParams)
	if not parsed then
		return false
	end

	if taskController.redirectingUnitID then
		return unitID == taskController.redirectingUnitID
	end

	local chosenCommander = taskController.ChooseCommander(parsed)
	if not chosenCommander then
		return false
	end
	if chosenCommander == unitID then
		return true
	end

	taskController.redirectingUnitID = chosenCommander
	Spring.GiveOrderToUnit(
		chosenCommander,
		CMD_TERRAFORM_INTERNAL,
		cmdParams,
		taskController.CopyCommandOptions(cmdOptions)
	)
	taskController.redirectingUnitID = false
	return false
end

function gadget:CommandFallback(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions, cmdTag)
	if cmdID ~= CMD_TERRAFORM_INTERNAL then
		return false
	end
	if not commanderDefs[unitDefID] then
		return true, true
	end

	if taskController.finishedTagByUnit[unitID] == cmdTag then
		taskController.finishedTagByUnit[unitID] = nil
		return true, true
	end

	local task = taskController.activeByUnit[unitID]
	if task then
		if task.cmdTag == cmdTag then
			return true, false
		end
		taskController.CancelTask(task, nil, true)
	end

	if not taskController.StartTask(unitID, unitDefID, teamID, cmdParams, cmdTag) then
		return true, true
	end
	return true, false
end

--------------------------------------------------------------------------------
-- Sudden Death Mode
--------------------------------------------------------------------------------

function GG.Terraform_RaiseWater( raiseAmount)

	for i = 1, structureCount do
		local s = structure[structureTable[i]]
		s.h = s.h - raiseAmount
	end

	spAdjustHeightMap(0, 0, mapWidth, mapHeight, -raiseAmount)

end

function gadget:GameFrame(n)
	taskController.UpdateAll(n)

	-- Keep the terrain under existing structures at their registered height.
	local structuresToCheck = structureCheckFrame[n % structureCheckLoopFrames]
	if not structuresToCheck then
		return
	end

	for i = 1, structuresToCheck.count do
		local registeredStructure = structure[structuresToCheck.unit[i]]
		if registeredStructure
				and not taskController.capturedStructures[structuresToCheck.unit[i]] then
			local height = spGetGroundHeight(registeredStructure.x, registeredStructure.z)
			if height ~= registeredStructure.h then
				spLevelHeightMap(
					registeredStructure.minx,
					registeredStructure.minz,
					registeredStructure.maxx,
					registeredStructure.maxz,
					registeredStructure.h
				)
			end
		end
	end
end

function gadget:UnitPreDamaged_GetWantedWeaponDef()
	return WeaponDefs
end

--------------------------------------------------------------------------------
-- Weapon Terraform
--------------------------------------------------------------------------------

local wantedList = {}
local SeismicWeapon = {}
local DEFAULT_SMOOTH = 0.5
local HEIGHT_FUDGE_FACTOR = 10
local HEIGHT_RAD_MULT = 0.8
local MIN_SMOOTH_RAD = 20

for i=1,#WeaponDefs do
	local wd = WeaponDefs[i]
	if wd.customParams and wd.customParams.smoothradius or wd.customParams.smoothmult then
		wantedList[#wantedList + 1] = wd.id
		Script.SetWatchWeapon(wd.id,true)
		SeismicWeapon[wd.id] = {
			smooth = wd.customParams.smoothmult or DEFAULT_SMOOTH,
			smoothradius = wd.customParams.smoothradius or wd.craterAreaOfEffect*0.5,
			gatherradius = wd.customParams.gatherradius or wd.craterAreaOfEffect*0.75,
			detachmentradius = wd.customParams.detachmentradius
		}
	end
end

local function makeTerraChangedPointsPyramidAroundStructures(posX,posY,posZ,posCount)
	--local found = {count = 0, data = {}}
	for i = 1, posCount do
		if structureAreaMap[posX[i]] and structureAreaMap[posX[i]][posZ[i]] then
			posY[i] = 0
			--found.count = found.count + 1
			--found.data[found.count] = {x = posX[i], z = posZ[i]}
		end
	end


	--[[
	if found.count == 0 then
		return posY
	end

	for i = 1, posCount do
		local x = posX[i]
		local z = posZ[i]
		for j = 1, found.count do
			local fx = found.data[j].x
			local fz = found.data[j].z
			local maxChange = sqrt((fx-x)^2 + (fz-z)^2)*maxHeightDifference/64
			if abs(posY[i]) > maxChange then
				posY[i] = abs(posY[i])/posY[i]*maxChange
			end
		end
	end
	--]]

	return posY
end

function gadget:Explosion_GetWantedWeaponDef()
	return wantedList
end

function gadget:Explosion(weaponID, x, y, z, owner)

	if SeismicWeapon[weaponID] then
		local height = spGetGroundHeight(x,z)

		local smoothradius = SeismicWeapon[weaponID].smoothradius
		local gatherradius = SeismicWeapon[weaponID].gatherradius
		local detachmentradius = SeismicWeapon[weaponID].detachmentradius
		local maxSmooth = SeismicWeapon[weaponID].smooth
		if y > height + HEIGHT_FUDGE_FACTOR then
			local factor = 1 - ((y - height - HEIGHT_FUDGE_FACTOR)/smoothradius*HEIGHT_RAD_MULT)^2
			if factor > 0 then
				smoothradius = smoothradius*factor
				gatherradius = gatherradius*factor
				maxSmooth = maxSmooth*factor
			else
				return
			end
		end

		local smoothradiusSQ = smoothradius^2
		local gatherradiusSQ = gatherradius^2

		smoothradius = smoothradius + (8 - smoothradius%8)
		gatherradius = gatherradius + (8 - gatherradius%8)

		local sx = floor((x+4)/8)*8
		local sz = floor((z+4)/8)*8

		local groundPoints = 0
		local groundHeight = 0

		local origHeight = {} -- just to not read the heightmap twice

		for i = sx-gatherradius, sx+gatherradius,8 do
			origHeight[i] = {}
			for j = sz-gatherradius, sz+gatherradius,8 do
				local disSQ = (i - x)^2 + (j - z)^2
				if disSQ <= gatherradiusSQ then
					origHeight[i][j] = spGetGroundHeight(i,j)
					groundPoints = groundPoints + 1
					groundHeight = groundHeight + origHeight[i][j]
				end
			end
		end

		if groundPoints > 0 then
			groundHeight = groundHeight/groundPoints

			local posX, posY, posZ = {}, {}, {}
			local posCount = 0

			for i = sx-smoothradius, sx+smoothradius,8 do
				for j = sz-smoothradius, sz+smoothradius,8 do
					local disSQ = (i - x)^2 + (j - z)^2
					if disSQ <= smoothradiusSQ then
						if not origHeight[i] then
							origHeight[i] = {}
						end
						if not origHeight[i][j] then
							origHeight[i][j] = spGetGroundHeight(i,j)
						end
						posCount = posCount + 1
						posX[posCount] = i
						posY[posCount] = (groundHeight - origHeight[i][j]) * maxSmooth * (1-disSQ/smoothradiusSQ)
						posZ[posCount] = j
					end
				end
			end

			local posY = makeTerraChangedPointsPyramidAroundStructures(posX,posY,posZ,posCount)

			spSetHeightMapFunc(
				function(x,z,h)
					for i = 1, #x, 1 do
						spAddHeightMap(x[i],z[i],h[i])
					end
				end,
				posX,
				posZ,
				posY
			)
		end

		if detachmentradius then
			local units = Spring.GetUnitsInCylinder(sx,sz,detachmentradius)
			for i = 1, #units do
				local hitUnitID = units[i]
				GG.DetatchFromGround(hitUnitID)
			end
		end
	end

end

--------------------------------------------------------------------------------
-- Death Explosion Terraform
--------------------------------------------------------------------------------

local function deregisterStructure(unitID)

	for i = structure[unitID].minx, structure[unitID].maxx, 8 do
		if not structureAreaMap[i] then
			structureAreaMap[i] = {}
		end
		for j = structure[unitID].minz, structure[unitID].maxz, 8 do
			structureAreaMap[i][j] = structureAreaMap[i][j] - 1
			if structureAreaMap[i][j] < 1 then
				structureAreaMap[i][j] = nil
			end
		end
	end

	local f = structureCheckFrame[structure[unitID].frame]
	if f.count ~= structure[unitID].frameIndex then
		structureCheckFrame[structure[unitID].frame].unit[structure[unitID].frameIndex] = structureCheckFrame[structure[unitID].frame].unit[f.count]
	end
	if structureCheckFrame[structure[unitID].frame].count == 1 then
		structureCheckFrame[structure[unitID].frame] = nil
	else
		structureCheckFrame[structure[unitID].frame].count = structureCheckFrame[structure[unitID].frame].count - 1
	end

	if structure[unitID].index ~= structureCount then
		structureTable[structure[unitID].index] = structureTable[structureCount]
		structure[structureTable[structureCount]].index = structure[unitID].index
	end
	structureCount = structureCount - 1
	structure[unitID] = nil

end

function gadget:UnitDestroyed(unitID, unitDefID)
	taskController.CancelUnitTask(unitID, false)
	taskController.finishedTagByUnit[unitID] = nil
	taskController.ForgetCapturedStructure(unitID)

	if (unitDefID == corclogDefID) then
		local  _,_,_,_,build = spGetUnitHealth(unitID)
		if build == 1 then
			local ux, uy, uz  = spGetUnitPosition(unitID)
			ux = floor((ux+8)/16)*16
			uz = floor((uz+8)/16)*16

			local posCount = 57

			local posX =
							{ux-8,ux,ux+8,
						ux-16,ux-8,ux,ux+8,ux+16,
				  ux-24,ux-16,ux-8,ux,ux+8,ux+16,ux+24,
			ux-32,ux-24,ux-16,ux-8,ux,ux+8,ux+16,ux+24,ux+32,
			ux-32,ux-24,ux-16,ux-8,ux,ux+8,ux+16,ux+24,ux+32,
			ux-32,ux-24,ux-16,ux-8,ux,ux+8,ux+16,ux+24,ux+32,
				  ux-24,ux-16,ux-8,ux,ux+8,ux+16,ux+24,
						ux-16,ux-8,ux,ux+8,ux+16,
							  ux-8,ux,ux+8}

			local posZ =
							{uz-32,uz-32,uz-32,
						uz-24,uz-24,uz-24,uz-24,uz-24,
				  uz-16,uz-16,uz-16,uz-16,uz-16,uz-16,uz-16,
			uz-8 ,uz-8 ,uz-8 ,uz-8 ,uz-8 ,uz-8 ,uz-8 ,uz-8 ,uz-8 ,
			uz   ,uz   ,uz   ,uz   ,uz   ,uz   ,uz   ,uz   ,uz   ,
			uz+8 ,uz+8 ,uz+8 ,uz+8 ,uz+8 ,uz+8 ,uz+8 ,uz+8 ,uz+8 ,
				  uz+16,uz+16,uz+16,uz+16,uz+16,uz+16,uz+16,
						uz+24,uz+24,uz+24,uz+24,uz+24,
							  uz+32,uz+32,uz+32}

			--        {0 ,0 ,0 ,
			--	  1 ,3 ,5 ,3 ,1 ,
			--   1 ,7 ,14,17,14,7 ,1 ,
			--0 ,3 ,14,26,31,26,14,3 ,0 ,
			--0 ,5 ,17,31,36,31,17,5 ,0 ,
			--0 ,3 ,14,26,31,26,14,3 ,0 ,
			--   1 ,7 ,14,17,14,7 ,1 ,
			--      1 ,3 ,5 ,3 ,1 ,
			--		 0 ,0 ,0 }

			local posY =
				    {2 ,3 ,2 ,
			      2 ,3 ,7 ,3 ,2 ,
			   2 ,5 ,20,21,20,4 ,2 ,
			2 ,3 ,20,25,26,25,20,3 ,2 ,
			3 ,7 ,21,26,28,26,21,7 ,3 ,
			2 ,3 ,20,25,26,25,20,3 ,2 ,
			   2 ,4 ,20,21,20,5 ,2 ,
			       2,3 ,7 ,3 ,2 ,
				     2 ,3 ,2 }

			posY = makeTerraChangedPointsPyramidAroundStructures(posX,posY,posZ,posCount)

			spSetHeightMapFunc(
				function(x,z,h)
					for i = 1, #x, 1 do
						spAddHeightMap(x[i],z[i],h[i])
					end
				end,
				posX,
				posZ,
				posY
			)

			local units = Spring.GetUnitsInCylinder(ux,uz,40)
			for i = 1, #units do
				local hitUnitID = units[i]
				if hitUnitID ~= unitID then
					GG.AddGadgetImpulseRaw(hitUnitID, 0, 0.3, 0, true, true)
				end
			end
		end
		--spAdjustHeightMap(ux-64, uz-64, ux+64, uz+64 , 0)
	end
	--[[
  	if (unitDefID == novheavymineDefID) then
		local  _,_,_,_,build = spGetUnitHealth(unitID)

		if build == 1 then
			local ux, uy, uz = spGetUnitPosition(unitID)
			ux = ceil(ux/8)*8-4
			uz = ceil(uz/8)*8-4

			local heightChange = -30
			local size = 48
			local heightMap = {}

			for ix = ux-size-8, ux+size+8, 8 do
				heightMap[ix] = {}
				for iz = uz-size-8, uz+size+8, 8 do
					heightMap[ix][iz] = spGetGroundHeight(ix, iz)
				end
			end

			local point = {}
			local points = 0

			for ix = ux-size, ux+size, 8 do
				for iz = uz-size, uz+size, 8 do
					local newHeight = heightMap[ix][iz] + heightChange

					local maxDiff = heightMap[ix-8][iz]-newHeight
					if heightMap[ix+8][iz]-newHeight > maxDiff then
						maxDiff = heightMap[ix+8][iz]-newHeight
					end
					if heightMap[ix][iz-8]-newHeight > maxDiff then
						maxDiff = heightMap[ix][iz-8]-newHeight
					end
					if heightMap[ix][iz+8]-newHeight > maxDiff then
						maxDiff = heightMap[ix][iz+8]-newHeight
					end


					if maxDiff < maxHeightDifference then
						points = points + 1
						point[points] = {x = ix, y = newHeight, z = iz}
					elseif maxDiff < maxHeightDifference*2 then
						points = points + 1
						point[points] = {x = ix, y = newHeight+maxDiff-maxHeightDifference, z = iz}
					end
				end
			end

			local func = function()
					for i = 1, points do
						spSetHeightMap(point[i].x,point[i].z,point[i].y)
					end
				end
			spSetHeightMapFunc(func)
		end
		--spAdjustHeightMap(ux-64, uz-64, ux+64, uz+64 , 0)
	end
	--]]

	if structure[unitID] then
		deregisterStructure(unitID)
	end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:UnitTaken(unitID)
	taskController.CancelUnitTask(unitID, true)
	taskController.CancelQueuedCommands(unitID)
end

function gadget:UnitGiven(unitID)
	taskController.CancelUnitTask(unitID, true)
	taskController.CancelQueuedCommands(unitID)
end

function gadget:UnitCreated(unitID, unitDefID)

	if spGetUnitIsDead(unitID) then
		return
	end

	local ud = UnitDefs[unitDefID]
	-- add terraform commands to commanders
	if (ud.isBuilder and commanderDefs[unitDefID]) and not ud.isFactory then
		for _, cmdDesc in ipairs(cmdDescsArray) do
			spInsertUnitCmdDesc(unitID, cmdDesc)
		end
		local restoreCmdDescID = spFindUnitCmdDesc(unitID, CMD.RESTORE)
		if restoreCmdDescID then
			spRemoveUnitCmdDesc(unitID, restoreCmdDescID)
		end

	end

	-- add structure to structure table
    if (ud.isBuilding == true or ud.maxAcc == 0) and (not ud.customParams.mobilebuilding) then
	    local ux, uy, uz = spGetUnitPosition(unitID)
		ux = floor((ux+4)/8)*8
		uz = floor((uz+4)/8)*8
	    local face = spGetUnitBuildFacing(unitID)
	    local xsize = ud.xsize*4
	    local ysize = (ud.zsize or ud.ysize)*4

		structureCount = structureCount + 1

	    if ((face == 0) or(face == 2)) then
			structure[unitID] = { x = ux, z = uz , h = spGetGroundHeight(ux, uz), def = ud,
	        minx = ux-xsize, minz = uz-ysize, maxx = ux+xsize, maxz = uz+ysize, area = {}, index = structureCount}
	    else
	        structure[unitID] = { x = ux, z = uz , h = spGetGroundHeight(ux, uz), def = ud,
	        minx = ux-ysize, minz = uz-xsize, maxx = ux+ysize, maxz = uz+xsize, area = {}, index = structureCount}
	    end

		for i = structure[unitID].minx, structure[unitID].maxx, 8 do
			structure[unitID].area[i] = {}
			if not structureAreaMap[i] then
				structureAreaMap[i] = {}
			end
			for j = structure[unitID].minz, structure[unitID].maxz, 8 do
				structure[unitID].area[i][j] = true
				if structureAreaMap[i][j] then
					structureAreaMap[i][j] = structureAreaMap[i][j] + 1
				else
					structureAreaMap[i][j] = 1
				end

			end
		end

		structureTable[structureCount] = unitID

		-- slow update for terrain checking
		if not structureCheckFrame[currentCheckFrame] then
			structureCheckFrame[currentCheckFrame] = {count = 0, unit = {}}
		end
		structureCheckFrame[currentCheckFrame].count = structureCheckFrame[currentCheckFrame].count + 1
		structureCheckFrame[currentCheckFrame].unit[structureCheckFrame[currentCheckFrame].count] = unitID
		structure[unitID].frame = currentCheckFrame
		structure[unitID].frameIndex = structureCheckFrame[currentCheckFrame].count

		currentCheckFrame = currentCheckFrame + 1
		if currentCheckFrame > structureCheckLoopFrames then
			currentCheckFrame = 0
		end

		taskController.CaptureTasksForStructure(unitID, structure[unitID])
	end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Initialise, check modoptions and register command

function gadget:Initialize()
	gadgetHandler:RegisterCMDID(CMD_TERRAFORM_INTERNAL)
	-- Keep per-frame state separate from immutable geometry in the SYNCED proxy.
	_G.terraformPreviewTasks = {}
	_G.terraformPreviewGeometry = {}

	if modOptions.waterlevel and modOptions.waterlevel ~= 0 then
		GG.Terraform_RaiseWater(modOptions.waterlevel)
	end

	for _, unitID in ipairs(Spring.GetAllUnits()) do
		local unitDefID = Spring.GetUnitDefID(unitID)
		local teamID = spGetUnitTeam(unitID)
		gadget:UnitCreated(unitID, unitDefID, teamID)
	end
end

function gadget:Shutdown()
	taskController.CancelAll(true)
	taskController.ReleaseAllCapturedStructures()
	_G.terraformPreviewTasks = nil
	_G.terraformPreviewGeometry = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
else
--------------------------------------------------------------------------------
-- UNSYNCED
--------------------------------------------------------------------------------

local previewCache = {}
local GRID_SIZE = 8

local function deletePreview(preview)
	if preview.displayList then
		gl.DeleteList(preview.displayList)
	end
end

local function drawPreviewGeometry(pointCount, pointData)
	local pointMap = {}
	for i = 1, pointCount do
		local dataIndex = (i - 1) * 3
		local x = pointData[dataIndex + 1]
		local z = pointData[dataIndex + 3]
		if not pointMap[x] then
			pointMap[x] = {}
		end
		pointMap[x][z] = dataIndex
	end

	gl.BeginEnd(GL.LINES, function()
		for i = 1, pointCount do
			local dataIndex = (i - 1) * 3
			local x = pointData[dataIndex + 1]
			local y = pointData[dataIndex + 2]
			local z = pointData[dataIndex + 3]
			local xNeighborIndex = pointMap[x + GRID_SIZE]
				and pointMap[x + GRID_SIZE][z]
			if xNeighborIndex then
				gl.Vertex(x, y + 2, z)
				gl.Vertex(
					pointData[xNeighborIndex + 1],
					pointData[xNeighborIndex + 2] + 2,
					pointData[xNeighborIndex + 3]
				)
			end

			local zNeighborIndex = pointMap[x]
				and pointMap[x][z + GRID_SIZE]
			if zNeighborIndex then
				gl.Vertex(x, y + 2, z)
				gl.Vertex(
					pointData[zNeighborIndex + 1],
					pointData[zNeighborIndex + 2] + 2,
					pointData[zNeighborIndex + 3]
				)
			end
		end
	end)
end

local function addPreview(taskID, syncedGeometry)
	previewCache[taskID] = {
		displayList = gl.CreateList(
			drawPreviewGeometry,
			syncedGeometry.pointCount,
			syncedGeometry.pointData
		),
	}
end

local function isPreviewVisible(task, localTeamID, fullView)
	return fullView
		or Spring.AreTeamsAllied(localTeamID, task.teamID)
end

local function synchronizePreviewCache()
	local syncedTasks = SYNCED.terraformPreviewTasks or {}
	local localTeamID = Spring.GetLocalTeamID()
	local _, fullView = Spring.GetSpectatingState()

	for taskID, task in pairs(syncedTasks) do
		if isPreviewVisible(task, localTeamID, fullView)
				and not previewCache[taskID] then
			local syncedGeometryRoot = SYNCED.terraformPreviewGeometry
			local syncedGeometry = syncedGeometryRoot
				and syncedGeometryRoot[taskID]
			if syncedGeometry then
				addPreview(taskID, syncedGeometry)
			end
		end
	end

	for taskID, preview in pairs(previewCache) do
		local task = syncedTasks[taskID]
		if not task
				or not isPreviewVisible(task, localTeamID, fullView) then
			deletePreview(preview)
			previewCache[taskID] = nil
		end
	end

	return syncedTasks
end

local function getStatusText(task)
	local remainingSeconds = math.ceil(
		(task.remainingFrames or 0) / Game.gameSpeed
	)
	if task.state == "working" then
		return "Terraform: " .. remainingSeconds .. "s"
	end
	if task.state == "paused" then
		return "Paused • " .. remainingSeconds .. "s"
	end
	return "Approaching • work: " .. remainingSeconds .. "s"
end

local function handleTeamMessage(_, teamID, message)
	if Spring.GetMyTeamID() == teamID then
		Spring.SendMessage(message)
	end
end

function gadget:Initialize()
	gadgetHandler:AddSyncAction("terraform_team_message", handleTeamMessage)
end

function gadget:Shutdown()
	gadgetHandler:RemoveSyncAction("terraform_team_message")
	for _, preview in pairs(previewCache) do
		deletePreview(preview)
	end
	previewCache = {}
end

function gadget:DrawWorld()
	local syncedTasks = synchronizePreviewCache()
	if not next(previewCache) then
		return
	end

	gl.PushAttrib(GL.ALL_ATTRIB_BITS)
	gl.DepthTest(false)
	gl.LineWidth(1.5)

	for taskID, preview in pairs(previewCache) do
		local task = syncedTasks[taskID]
		if task and preview.displayList then
			local red, green, blue = Spring.GetTeamColor(task.teamID)
			gl.Color(red or 1, green or 1, blue or 1, 0.82)
			gl.CallList(preview.displayList)

			gl.PushMatrix()
			gl.Translate(task.anchorX, task.anchorY, task.anchorZ)
			gl.Billboard()
			gl.Text(getStatusText(task), 0, 0, 16, "oc")
			gl.PopMatrix()
		end
	end

	gl.Color(1, 1, 1, 1)
	gl.PopAttrib()
end

end
