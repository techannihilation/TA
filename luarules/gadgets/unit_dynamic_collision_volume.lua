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

-- Pop-up style unit and per piece collision volume definitions
local popupUnits = {}		--list of pop-up style units
local unitCollisionVolume, pieceCollisionVolume, dynamicPieceCollisionVolume, sublist, isship = include("LuaRules/Configs/CollisionVolumes.lua")
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
					elseif featureModel:find(".s3o") then
						local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featID)
						Spring.Echo(featureModel, xs, ys, zs, xo, yo, zo, vtype, htype, axis)
						if (vtype>=3 and xs==ys and ys==zs) then
							spSetFeatureCollisionData(featID, xs, ys*0.75, zs,  xo, yo-ys*0.09, zo,  1, htype, 1)
						end
					end
				end
			end			
		else
			for _, featID in pairs(Spring.GetAllFeatures()) do
					local modelpath = FeatureDefs[Spring.GetFeatureDefID(featID)].modelpath
					local featureModel = modelpath:lower()
					if featureModel:find(".3do") then
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
				elseif featureModel:find(".s3o") then
					local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featID)
					if (vtype>=3 and xs==ys and ys==zs) then
						spSetFeatureCollisionData(featID, xs, ys*0.75, zs,  xo, yo-ys*0.09, zo,  vtype, htype, axis)
					end
				end
			end
		end
	end

	
	--Reduces the diameter of default (unspecified) collision volume for 3DO models,
	--for S3O models it's not needed and will in fact result in wrong collision volume
	--also handles per piece collision volume definitions
	function gadget:UnitCreated(unitID, unitDefID, unitTeam)
		local uDef = UnitDefs[unitDefID]
	  	--Spring.Echo("Units Armor Class is : " .. (Game.armorTypes[uDef.armorType] or ""))
		if (pieceCollisionVolume[UnitDefs[unitDefID].name]) then
			local t = pieceCollisionVolume[UnitDefs[unitDefID].name]
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
		elseif dynamicPieceCollisionVolume[UnitDefs[unitDefID].name] then
			local t = dynamicPieceCollisionVolume[UnitDefs[unitDefID].name].on
			for pieceIndex=1, #spGetPieceList(unitID) do
				local p = t[tostring(pieceIndex)]
				if p then
					spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
				else
					spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
				end
			end
		elseif UnitDefs[unitDefID].modeltype=="3do" and not (Game.armorTypes[uDef.armorType] =="subs") then
			local rs, hs, ws, ars, ahs
			if (spGetUnitRadius(unitID)>47 and not UnitDefs[unitDefID].canFly) then
				rs, hs, ws = 0.59, 0.59, 0.59
				ars, ahs = 0.66, 0.66
			elseif (not UnitDefs[unitDefID].canFly) then
				rs, hs, ws = 0.68, 0.68, 0.68
				ars, ahs = 0.70, 0.70 
			else
				rs, hs, ws = 0.53, 0.26, 0.53
				ars, ahs = 0.55, 0.55 
			end
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetUnitCollisionData(unitID)
			if (vtype>=3 and xs==ys and ys==zs) then
			  if ( ys*hs ) < 13 and (UnitDefs[unitDefID].canFly) then -- Limit Max V height
			        spSetUnitCollisionData(unitID, xs*ws, 13, zs*rs,  xo, yo, zo,  1, htype, 1)
			  elseif (UnitDefs[unitDefID].canFly) then
				spSetUnitCollisionData(unitID, xs*ws, ys*hs, zs*rs,  xo, yo, zo,  1, htype, 1)
			  else 
				spSetUnitCollisionData(unitID, xs*ws, ys*hs, zs*rs,  xo, yo, zo,  vtype, htype, axis)
			  end
			end
			
			if UnitDefs[unitDefID].canFly and UnitDefs[unitDefID].transportCapacity>0 then
				spSetUnitRadiusAndHeight(unitID, 16, 16)
			else
				spSetUnitRadiusAndHeight(unitID, spGetUnitRadius(unitID)*ars, spGetUnitHeight(unitID)*ahs)
			end
		end
		if UnitDefs[unitDefID].modeltype=="3do" and (Game.armorTypes[uDef.armorType] =="subs") then
			spSetUnitRadiusAndHeight(unitID, spGetUnitRadius(unitID)*0.45, spGetUnitHeight(unitID)*0.45)
		end
		if UnitDefs[unitDefID].modeltype=="3do" and (Game.armorTypes[uDef.armorType] =="ships") and (Game.armorTypes[uDef.armorType] =="experimental_ships") then 
			local bx,by,bz,mx,my,mz,ax,ay,az = Spring.GetUnitPosition(unitID,true,true) --basepoint,midpoint,aimpoint
			local h = Spring.GetUnitHeight(unitID)
			if by <= 0 and by + h >= 0 then
				--Spring.Echo("Aimpoint Waterline: Set aimpoint of " .. unitID)
				Spring.SetUnitMidAndAimPos(unitID,mx,my,mz,ax,2,az) 
			end		
		end
		if UnitDefs[unitDefID].name == "armtl" or UnitDefs[unitDefID].name == "armatl" or UnitDefs[unitDefID].name == "cortl" or UnitDefs[unitDefID].name == "coratl"
		or UnitDefs[unitDefID].name == "tlltorp" or UnitDefs[unitDefID].name == "tllatorp" or UnitDefs[unitDefID].name == "tllwmjam" then
			local bx,by,bz,mx,my,mz,ax,ay,az = Spring.GetUnitPosition(unitID,true,true) --basepoint,midpoint,aimpoint
			--Spring.Echo("Aimpoint Waterline: Set aimpoint of " .. unitID .. " torp ".. ay)
			Spring.SetUnitMidAndAimPos(unitID,mx,my,mz,ax,2,az)
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
		elseif featureModelTrim:find(".3do") then
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
		local un = UnitDefs[unitDefID].name
		if unitCollisionVolume[un] then
			popupUnits[unitID]={name=un, state=-1, perPiece=false}
		elseif dynamicPieceCollisionVolume[un] then
			popupUnits[unitID]={name=un, state=-1, perPiece=true, numPieces = #spGetPieceList(unitID)}
		end
	end


	--check if a pop-up type unit was destroyed
	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		if popupUnits[unitID] then
			popupUnits[unitID] = nil
		end
	end

	
	--Dynamic adjustment of pop-up style of units' collision volumes based on unit's ARMORED status, runs twice per second
	--rescaling of radius and height of 3DO buildings
	function gadget:GameFrame(n)
		if (n%15 ~= 0) then
			return
		end
		local p, t 
		for unitID,defs in pairs(popupUnits) do
			if spArmor(unitID) then
				if (defs.state ~= 0) then
					if defs.perPiece then
						t = dynamicPieceCollisionVolume[defs.name].off
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
							Spring.SetUnitMidAndAimPos(unitID, 0, spGetUnitHeight(unitID)/2, 0, p[1], p[2], p[3],true)
						end
					else
						p = unitCollisionVolume[defs.name].off
						spSetUnitCollisionData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
						if p[10] then
							Spring.SetUnitMidAndAimPos(unitID, 0, spGetUnitHeight(unitID)/2, 0, p[10], p[11], p[12],true)
						end
					end
					popupUnits[unitID].state = 0
				end
			else
				if (defs.state ~= 1) then
					if defs.perPiece then
						t = dynamicPieceCollisionVolume[defs.name].on
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
							Spring.SetUnitMidAndAimPos(unitID, 0, spGetUnitHeight(unitID)/2, 0, p[1], p[2], p[3],true)
						end
					else
						p = unitCollisionVolume[defs.name].on
						spSetUnitCollisionData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
						if p[10] then
							Spring.SetUnitMidAndAimPos(unitID, 0, spGetUnitHeight(unitID)/2, 0, p[10], p[11], p[12],true)
						end
					end
					popupUnits[unitID].state = 1
				end
			end			
		end
	end
	
end
