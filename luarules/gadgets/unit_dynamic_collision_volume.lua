function gadget:GetInfo()
  return {
    name      = "Dynamic collision volume & Hitsphere Scaledown",
    desc      = "Adjusts collision volume for pop-up style units & Reduces the diameter of default sphere collision volume for 3DO models",
    author    = "Deadnight Warrior",
    date      = "Nov 26, 2011",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local isSub = {}
local isShip = {}
local canFly = {}
local isFlyingTrans = {}

for i=1,#UnitDefs do
    if UnitDefs[i].movementclass and (UnitDefs[i].movementclass:find("UBOAT",1,true)) then
    	--Spring.Echo("Sub Found ",UnitDefs[i].name)
        isSub[i] = true
    end
    if Game.armorTypes[UnitDefs[i].armorType] =="ships" or Game.armorTypes[UnitDefs[i].armorType] =="experimental_ships" then
    	--Spring.Echo("Ship Found ",UnitDefs[i].name)
        isShip[i] = true
    end
    if UnitDefs[i].canFly then
        canFly[i] = true
        if UnitDefs[i].transportCapacity > 0 then
        	isFlyingTrans[i] = true
        end
    end
end

-- Pop-up style unit and per piece collision volume definitions
local popupUnits = {}		--list of pop-up style units
local unitCollisionVolume, pieceCollisionVolume, dynamicPieceCollisionVolume, isTorp = include("LuaRules/Configs/CollisionVolumes.lua")
local mapFeatures = {}

-- Localization and speedups
local spGetPieceCollisionData = Spring.GetUnitPieceCollisionVolumeData
local spSetPieceCollisionData = Spring.SetUnitPieceCollisionVolumeData
local spGetPieceList = Spring.GetUnitPieceList
local spGetUnitCollisionData = Spring.GetUnitCollisionVolumeData
local spSetUnitCollisionData = Spring.SetUnitCollisionVolumeData
local spSetUnitRadiusAndHeight = Spring.SetUnitRadiusAndHeight
local spGetUnitRadius = Spring.GetUnitRadius
local spGetUnitHeight = Spring.GetUnitHeight
local spSetUnitMidAndAimPos = Spring.SetUnitMidAndAimPos
local spGetFeatureCollisionData = Spring.GetFeatureCollisionVolumeData
local spSetFeatureCollisionData = Spring.SetFeatureCollisionVolumeData
local spSetFeatureRadiusAndHeight = Spring.SetFeatureRadiusAndHeight
local spGetFeatureRadius = Spring.GetFeatureRadius
local spGetFeatureHeight = Spring.GetFeatureHeight
local spGetUnitHealth = Spring.GetUnitHealth
local spValidUnitID = Spring.ValidUnitID
local spGetGameFrame = Spring.GetGameFrame

local spArmor = Spring.GetUnitArmored
local spActive = Spring.GetUnitIsActive
local pairs = pairs	

local unitYSizeOffset = {}     -- <unitID,{sizeY,offsetY}>
local BP_SIZE_LIMIT = 0.8 
local BP_SIZE_MULTIPLIER = 1 / BP_SIZE_LIMIT

if (gadgetHandler:IsSyncedCode()) then

	--Process all initial map features
	function gadget:Initialize()
		local mapConfig = "LuaRules/Configs/DynCVmapCFG/" .. Game.mapName .. ".lua"
		if VFS.FileExists(mapConfig) then
			mapFeatures = VFS.Include(mapConfig)
			for _, featID in pairs(Spring.GetAllFeatures()) do
					local modelpath = FeatureDefs[Spring.GetFeatureDefID(featID)].modelpath
					local featureModel = modelpath:lower()				if featureModel:len() > 4 then
					local featureModelTrim = featureModel:match("/.*"):sub(2)
					if mapFeatures[featureModelTrim] then
						local p = mapFeatures[featureModelTrim]
						spSetFeatureCollisionData(featID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
						spSetFeatureRadiusAndHeight(featID, math.min(p[1], p[3])/2, p[2])
					end
				end
			end			
		else
			for _, featID in pairs(Spring.GetAllFeatures()) do
				local modelpath = FeatureDefs[Spring.GetFeatureDefID(featID)].modelpath
				local featureModel = modelpath:lower()
				local rs, hs
				if (spGetFeatureRadius(featID)>47) then
					rs, hs = 0.68, 0.60
				else
					rs, hs = 0.75, 0.67  
				end
				local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featID)
				if (vtype>=3 and xs==ys and ys==zs) then
					spSetFeatureCollisionData(featID, xs*rs, ys*hs, zs*rs,  xo, yo-ys*0.1323529*rs, zo,  vtype, htype, axis)
				end
				spSetFeatureRadiusAndHeight(featID, spGetFeatureRadius(featID)*rs, spGetFeatureHeight(featID)*hs)			
			end
		end
	end

	
	--Reduces the diameter of default (unspecified) collision volume for 3DO models,
	--for S3O models it's not needed and will in fact result in wrong collision volume
	--also handles per piece collision volume definitions
	function gadget:UnitCreated(unitID, unitDefID, unitTeam)
		--local uDef = UnitDefs[unitDefID]
	  	--Spring.Echo("Units Armor Class is : " .. (Game.armorTypes[uDef.armorType] or ""))
	  	local perPieceTrunk = {}
	  	local trunkIndex = nil
		if (pieceCollisionVolume[unitDefID]) then
		local t = pieceCollisionVolume[unitDefID]
			for pieceIndex=1, #spGetPieceList(unitID) do
			local p = t[tostring(pieceIndex)]
				if pieceIndex == t.trunk then
					perPieceTrunk = p
					trunkIndex = t.trunk
				end
				spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
			end
		elseif dynamicPieceCollisionVolume[unitDefID] then
			local t = dynamicPieceCollisionVolume[unitDefID].off
			for pieceIndex=1, #spGetPieceList(unitID) do
				local p = t[tostring(pieceIndex)]
				if pieceIndex == t.trunk then
					perPieceTrunk = p
					trunkIndex = t.trunk
				end
				spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
			end
		else
			local rs, hs, ws, ars, ahs
			if (spGetUnitRadius(unitID)>47 and not canFly[unitDefID]) then
				rs, hs, ws = 0.59, 0.59, 0.59
				ars, ahs = 0.60, 0.60
			elseif (not canFly[unitDefID] ) then
				rs, hs, ws = 0.68, 0.68, 0.68
				ars, ahs = 0.70, 0.70 
			elseif spGetUnitRadius(unitID)>120 then --Fix hero's not moving in latest engine
				--Spring.Echo(UnitDefs[unitDefID].name,spGetUnitRadius(unitID))
				rs, hs, ws = 0.77, 0.18, 0.77
				ars, ahs = 0.25, 0.25 
			elseif spGetUnitRadius(unitID)>60 then
				--Spring.Echo(UnitDefs[unitDefID].name,spGetUnitRadius(unitID))
				rs, hs, ws = 0.77, 0.18, 0.77
				ars, ahs = 0.375, 0.375 
			else 
				rs, hs, ws = 0.53, 0.26, 0.53
				ars, ahs = 0.40, 0.40
			end
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetUnitCollisionData(unitID)
			if (vtype>=3 and xs==ys and ys==zs) then
				if ( ys*hs ) < 13 and (canFly[unitDefID]) then -- Limit Max V height
					spSetUnitCollisionData(unitID, xs*ws, 13, zs*rs,  xo, yo, zo,  1, htype, 1)
				elseif (UnitDefs[unitDefID].canFly) then
					spSetUnitCollisionData(unitID, xs*ws, ys*hs, zs*rs,  xo, yo, zo,  1, htype, 1)
				else 
					spSetUnitCollisionData(unitID, xs*ws, ys*hs, zs*rs,  xo, yo, zo,  vtype, htype, axis)
				end
			end
			if isFlyingTrans[unitDefID] then
				spSetUnitRadiusAndHeight(unitID, 16, 16)
			elseif isSub[unitDefID] then
				spSetUnitRadiusAndHeight(unitID, spGetUnitRadius(unitID)*0.65, spGetUnitHeight(unitID)*0.65)
			else
				spSetUnitRadiusAndHeight(unitID, spGetUnitRadius(unitID)*ars, spGetUnitHeight(unitID)*ahs)
			end
		end
		if isShip[unitDefID] then 
			local bx,by,bz,mx,my,mz,ax,ay,az = Spring.GetUnitPosition(unitID,true,true) --basepoint,midpoint,aimpoint
			local h = Spring.GetUnitHeight(unitID)
			if by <= 0 and by + h >= 0 then
				--Spring.Echo("Aimpoint Waterline: Set aimpoint of " .. unitID)
				Spring.SetUnitMidAndAimPos(unitID,mx,my,mz,ax,2,az) 
			end		
		end
		if isTorp[unitDefID] then
			local bx,by,bz,mx,my,mz,ax,ay,az = Spring.GetUnitPosition(unitID,true,true) --basepoint,midpoint,aimpoint
			--Spring.Echo("Aimpoint Waterline: Set aimpoint of " .. unitID .. " torp ".. ay)
			Spring.SetUnitMidAndAimPos(unitID,mx,my,mz,ax,2,az)
		end

		local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetUnitCollisionData(unitID)
		if pieceCollisionVolume[unitDefID] then
			local t = pieceCollisionVolume[unitDefID]
			unitYSizeOffset[unitID] = {perPieceTrunk[2], perPieceTrunk[5], t.trunk}
		elseif dynamicPieceCollisionVolume[unitDefID] then
			local t = dynamicPieceCollisionVolume[unitDefID].off
			unitYSizeOffset[unitID] = {perPieceTrunk[2], perPieceTrunk[5], t.trunk}
		else
			unitYSizeOffset[unitID] = {ys,yo}
		end
		-- reduce size of unit under construction
		local _,_,_,_,bp = spGetUnitHealth(unitID)
		local val  = 1
		-- only affect units under construction
		if bp and (bp < BP_SIZE_LIMIT) then
			val = math.max(bp*BP_SIZE_MULTIPLIER,0.1)
			ys = ys * val
			yo = yo * val
			if pieceCollisionVolume[unitDefID] or dynamicPieceCollisionVolume[unitDefID] then
				spSetPieceCollisionData(unitID, trunkIndex, true, perPieceTrunk[1], ys, perPieceTrunk[3], perPieceTrunk[4], yo, perPieceTrunk[6], perPieceTrunk[7], perPieceTrunk[8])
				spSetUnitMidAndAimPos(unitID,0, perPieceTrunk[2]*0.5, 0,0, perPieceTrunk[2]*0.5,0,true)
			else
				spSetUnitCollisionData(unitID, xs, ys, zs, xo, yo, zo, vtype, htype, axis)
				spSetUnitMidAndAimPos(unitID,0, ys*0.5, 0,0, ys*0.5,0,true)
			end
		end
	end


	-- Same as for 3DO units, but for features
	function gadget:FeatureCreated(featureID, allyTeam)
		local modelpath = FeatureDefs[Spring.GetFeatureDefID(featureID)].modelpath
		local featureModel = modelpath:lower()
		if featureModel == "" or nil then return end	--geovents or engine trees have no models
		local featureModelTrim = featureModel:match("/.*"):sub(2)
		if mapFeatures[featureModelTrim] then	-- it just might happen that some map features can have corpses
			local p = mapFeatures[featureModelTrim]
			spSetFeatureCollisionData(featureID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
			spSetFeatureRadiusAndHeight(featureID, min(p[1], p[3])*0.5, p[2])		
		else
			local rs, hs
			if (spGetFeatureRadius(featureID)>47) then
				rs, hs = 0.68, 0.68
			else
				rs, hs = 0.50, 0.50
			end
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featureID)
			if (vtype>=3 and xs==ys and ys==zs) then
				spSetFeatureCollisionData(featureID, xs*rs, ys*hs, zs*rs,  xo, yo-ys*0.08, zo,  vtype, htype, axis)
			end
			spSetFeatureRadiusAndHeight(featureID, spGetFeatureRadius(featureID)*rs, spGetFeatureHeight(featureID)*hs)
		end
	end


	-- Check if a unit is pop-up type (the list must be entered manually)
	-- If a building was constructed add it to the list for later radius and height scaling
	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		--local un = UnitDefs[unitDefID].name
		if unitCollisionVolume[unitDefID] then
			popupUnits[unitID]={id=unitDefID, state=-1, perPiece=false}
		elseif dynamicPieceCollisionVolume[unitDefID] then
			popupUnits[unitID]={id=unitDefID, state=-1, perPiece=true, numPieces = #spGetPieceList(unitID)}
		end
		
		-- set height to expected value for fully built unit
		if unitYSizeOffset[unitID] and not pieceCollisionVolume[unitDefID] or dynamicPieceCollisionVolume[unitDefID]then
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis,_ = spGetUnitCollisionData(unitID)
			local data = unitYSizeOffset[unitID]
			ys = data[1]
			yo = data[2]
			
			spSetUnitCollisionData(unitID, xs, ys, zs, xo, yo, zo, vtype, htype, axis)
			spSetUnitMidAndAimPos(unitID,0, ys*0.5, 0,0, ys*0.5,0,true)
		elseif (pieceCollisionVolume[unitDefID]) then
			local t = pieceCollisionVolume[unitDefID]
			for pieceIndex=1, #spGetPieceList(unitID) do
				local p = t[tostring(pieceIndex)]
				if p then
					spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
				else
					spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
				end
			end
			if t.offsets then
				p = t.offsets
				Spring.SetUnitMidAndAimPos(unitID, 0, spGetUnitHeight(unitID)/2, 0, p[1], p[2], p[3],true)
			end
		elseif dynamicPieceCollisionVolume[unitDefID] then
			local t = dynamicPieceCollisionVolume[unitDefID].on
			for pieceIndex=1, #spGetPieceList(unitID) do
				local p = t[tostring(pieceIndex)]
				if p then
					spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
				else
					spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
				end
			end
		end
	end


	--check if a pop-up type unit was destroyed
	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		if popupUnits[unitID] then
			popupUnits[unitID] = nil
		end
		if unitYSizeOffset[unitID] then
			unitYSizeOffset[unitID] = nil
		end
	end

	
	--Dynamic adjustment of pop-up style of units' collision volumes based on unit's ARMORED status, runs twice per second
	--rescaling of radius and height of 3DO buildings
	function gadget:GameFrame(n)
		if (n%15 ~= 0) then
			return
		end
		local p, t, stateString, stateInt
		for unitID,defs in pairs(popupUnits) do
			if spArmor(unitID) then
				stateString = "off"
				stateInt = 0
			else
				stateString = "on"
				stateInt = 1
			end
			if defs.state ~= stateInt then
				if defs.perPiece then
					t = dynamicPieceCollisionVolume[defs.id][stateString]
					for pieceIndex=1, defs.numPieces do
						p = t[tostring(pieceIndex)]
						if p then
							spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
						else
							spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
						end
					end
					if t.offsets then
						p = t.offsets
						local unitHeight = spGetUnitHeight(unitID)
						if unitHeight == nil then  -- had error once, hope this nil check helps
							popupUnits[unitID] = nil
						else
							spSetUnitMidAndAimPos(unitID, 0, unitHeight/2, 0, p[1], p[2], p[3],true)
						end
					end
				else
					local unitHeight = spGetUnitHeight(unitID)
					if unitHeight == nil then  -- had error once, hope this nil check helps
						popupUnits[unitID] = nil
					else
						p = unitCollisionVolume[defs.id][stateString]
						spSetUnitCollisionData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
						if p[10] then
							spSetUnitMidAndAimPos(unitID, 0, unitHeight/2, 0, p[10], p[11], p[12],true)
						end
					end
				end
				if popupUnits[unitID] ~= nil then
					popupUnits[unitID].state = stateInt
				end
			end			
		end
		-- adjust collision volume height based on build %
		-- runs 6 times per second
		if (n%5 == 0) then
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, disabled
			local val = 0
			for unitID,data in pairs(unitYSizeOffset) do
				local _,_,_,_,bp = spGetUnitHealth(unitID)
				
				-- only affect units under construction
				-- height grows until build % reaches 60
				if bp and (bp < BP_SIZE_LIMIT) then
					xs, ys, zs, xo, yo, zo, vtype, htype, axis,_ = spGetUnitCollisionData(unitID)
	
					val = math.max(bp*BP_SIZE_MULTIPLIER,0.1)
					ys = data[1] * val
					yo = data[2] * val
					--Spring.Echo(unitID, xs, ys, zs, xo, yo, zo, vtype, htype, axis)


					--WIP per piece collision volumes can now grow a trunk piece with build percentage
					local unitDefID = Spring.GetUnitDefID(unitID)
					if (pieceCollisionVolume[unitDefID]) then
						local t = pieceCollisionVolume[unitDefID]
						local p = t[tostring(data[3])]
						spSetPieceCollisionData(unitID, data[3], true, p[1], ys, p[3], p[4], yo, p[6], p[7], p[8])
						if t.offsets then
							p = t.offsets
							Spring.SetUnitMidAndAimPos(unitID, 0, ys*0.5, 0, p[1], ys*0.5, p[3],true)
						else
							spSetUnitMidAndAimPos(unitID,0, ys*0.5, 0,0, ys*0.5,0,true)
						end
					elseif dynamicPieceCollisionVolume[unitDefID] then
						local t = dynamicPieceCollisionVolume[unitDefID].off
						local p = t[tostring(data[3])]
						spSetPieceCollisionData(unitID, data[3], true, p[1], ys, p[3], p[4], yo, p[6], p[7], p[8])
						if t.offsets then
							p = t.offsets
							Spring.SetUnitMidAndAimPos(unitID, 0, ys*0.5, 0, p[1], ys*0.5, p[3],true)
						else
							spSetUnitMidAndAimPos(unitID,0, ys*0.5, 0,0, ys*0.5,0,true)
						end
					else
						spSetUnitCollisionData(unitID, xs, ys, zs, xo, yo, zo, vtype, htype, axis)
						spSetUnitMidAndAimPos(unitID,0, ys*0.5, 0,0, ys*0.5,0,true)
					end
				end
			end
		end
	end
end
