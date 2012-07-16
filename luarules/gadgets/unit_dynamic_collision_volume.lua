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
local unitCollisionVolume, pieceCollisionVolume, dynamicPieceCollisionVolume = include("LuaRules/Configs/CollisionVolumes.lua")

-- Localization and speedups
local spGetPieceCollisionData = Spring.GetUnitPieceCollisionVolumeData
local spSetPieceCollisionData = Spring.SetUnitPieceCollisionVolumeData
local spGetPieceList = Spring.GetUnitPieceList
local spGetUnitCollisionData = Spring.GetUnitCollisionVolumeData
local spSetUnitCollisionData = Spring.SetUnitCollisionVolumeData
local spSetUnitRadiusAndHeight = Spring.SetUnitRadiusAndHeight
local spGetUnitRadius = Spring.GetUnitRadius
local spGetUnitHeight = Spring.GetUnitHeight
local spGetFeatureCollisionData = Spring.GetFeatureCollisionVolumeData
local spSetFeatureCollisionData = Spring.SetFeatureCollisionVolumeData
local spSetFeatureRadiusAndHeight = Spring.SetFeatureRadiusAndHeight
local spGetFeatureRadius = Spring.GetFeatureRadius
local spGetFeatureHeight = Spring.GetFeatureHeight

local spArmor = Spring.GetUnitArmored
local spActive = Spring.GetUnitIsActive
local pairs = pairs	


if (gadgetHandler:IsSyncedCode()) then

	--Process all initial map features
	function gadget:Initialize()
		local mapConfig = "LuaRules/Configs/DynCVmapCFG/" .. Game.mapName .. ".lua"
		if VFS.FileExists(mapConfig) then
			local mapFeatures = include(mapConfig)
			for _, featID in pairs(Spring.GetAllFeatures()) do
				local featureModel = FeatureDefs[Spring.GetFeatureDefID(featID)].modelname:lower()
				if featureModel:len() > 4 then
					local featureModelTrim = featureModel:match("/.*%."):sub(2,-2)
					if mapFeatures[featureModelTrim] then
						local p = mapFeatures[featureModelTrim]
						spSetFeatureCollisionData(featID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
						spSetFeatureRadiusAndHeight(featID, math.min(p[1], p[3])/2, p[2])
					elseif featureModel:find(".s3o") then
						local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featID)
						if (vtype==4 and xs==ys and ys==zs) then
							spSetFeatureCollisionData(featID, xs, ys*0.75, zs,  xo, yo-ys*0.09, zo,  vtype, htype, axis)
						end
					end
				end
			end			
		else
			for _, featID in pairs(Spring.GetAllFeatures()) do
				local featureModel = FeatureDefs[Spring.GetFeatureDefID(featID)].modelname:lower()
				local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featID)
				if featureModel:find(".3do") then
					local rs, hs = 0.75, 0.67  
					if (vtype==4 and xs==ys and ys==zs) then
						if (xs>47) then
							rs, hs = 0.68, 0.60
							spSetFeatureCollisionData(featureID, xs*0.68, ys*0.60, zs*0.68,  xo, yo-ys*0.09, zo,  vtype, htype, axis)
						else
							spSetFeatureCollisionData(featureID, xs*0.75, ys*0.67, zs*0.75,  xo, yo-ys*0.1005, zo,  vtype, htype, axis)
						end
					end
					spSetFeatureRadiusAndHeight(featureID, spGetFeatureRadius(featID)*rs, spGetFeatureHeight(featID)*hs)			
				elseif featureModel:find(".s3o") then
					if (vtype==4 and xs==ys and ys==zs) then
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
		local rs, hs = 0.75, 0.75
		if (pieceCollisionVolume[UnitDefs[unitDefID].name]) then
			--[[  ment for per piece collision volumes for XTA commanders 
			if (UnitDefs[unitDefID].isCommander==true) then
				for i=0, #spGetPieceList-1 do
					local xs, ys, zs, xo, yo, zo, vtype, ttype, axis, en = spGetPieceCollisionData(unitID, i)
					spSetPieceCollisionData(unitID, i, true, true,true,true, xs, ys, zs, xo, yo, zo, 1, 1)
				end
			else
			]]--
				local t = pieceCollisionVolume[UnitDefs[unitDefID].name]
				for pieceIndex=0, #spGetPieceList(unitID)-1 do
					local p = t[tostring(pieceIndex)]
					if p then
						spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
					else
						spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
					end
				end
			--end
		elseif dynamicPieceCollisionVolume[UnitDefs[unitDefID].name] then
			local t = dynamicPieceCollisionVolume[UnitDefs[unitDefID].name].on
			for pieceIndex=0, #spGetPieceList(unitID)-1 do
				local p = t[tostring(pieceIndex)]
				if p then
					spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
				else
					spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
				end
			end
		elseif UnitDefs[unitDefID].model.type=="3do" then
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetUnitCollisionData(unitID)
			if (vtype==4 and xs==ys and ys==zs) then
				if (xs>47 and not UnitDefs[unitDefID].canFly) then
					rs, hs = 0.68, 0.68
					spSetUnitCollisionData(unitID, xs*0.68, ys*0.68, zs*0.68,  xo, yo, zo,  vtype, htype, axis)
				elseif (not UnitDefs[unitDefID].canFly) then
					spSetUnitCollisionData(unitID, xs*0.75, ys*0.75, zs*0.75,  xo, yo, zo,  vtype, htype, axis)
				else
					rs, hs = 0.48, 0.225
					spSetUnitCollisionData(unitID, xs*0.375, ys*0.225, zs*0.48,  xo, yo, zo,  vtype, htype, axis)
				end
			end
		
		end
		if UnitDefs[unitDefID].model.type=="3do" then
			spSetUnitRadiusAndHeight(unitID, spGetUnitRadius(unitID)*rs, spGetUnitHeight(unitID)*hs)
		end
	end


	-- Same as for 3DO units, but for features
	function gadget:FeatureCreated(featureID, allyTeam)
		local featureModel = FeatureDefs[Spring.GetFeatureDefID(featureID)].modelname:lower()
		if featureModel:find(".3do") then
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = spGetFeatureCollisionData(featureID)
			local rs, hs = 0.75, 0.67
			if (vtype==4 and xs==ys and ys==zs) then
				if (xs>47) then
					rs, hs = 0.68, 0.60
					spSetFeatureCollisionData(featureID, xs*0.68, ys*0.60, zs*0.68,  xo, yo-ys*0.09, zo,  vtype, htype, axis)
				else
					spSetFeatureCollisionData(featureID, xs*0.75, ys*0.67, zs*0.75,  xo, yo-ys*0.1005, zo,  vtype, htype, axis)
				end
			end
			spSetFeatureRadiusAndHeight(featureID, spGetFeatureRadius(featureID)*rs, spGetFeatureHeight(featureID)*hs)			
		end
	end


	--check if a unit is pop-up type (the list must be entered manually)
	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		local un = UnitDefs[unitDefID].name
		if unitCollisionVolume[un] then
			popupUnits[unitID]={name=un, state=-1, perPiece=false}
		elseif dynamicPieceCollisionVolume[un] then
			popupUnits[unitID]={name=un, state=-1, perPiece=true, numPieces = #spGetPieceList(unitID)-1}
		end
	end


	--check if a pop-up type unit was destroyed
	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		if popupUnits[unitID] then
			popupUnits[unitID] = nil
		end
	end

	
	--Dynamic adjustment of pop-up style of units' collision volumes based on
	--unit's ARMORED status, runs twice per second
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
						for pieceIndex=0, defs.numPieces do
							p = t[tostring(pieceIndex)]
							if p then
								spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
							else
								spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
							end
						end	
					else
						p = unitCollisionVolume[defs.name].off
						spSetUnitCollisionData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
					end
					popupUnits[unitID].state = 0
				end
			else
				if (defs.state ~= 1) then
					if defs.perPiece then
						t = dynamicPieceCollisionVolume[defs.name].on
						for pieceIndex=0, defs.numPieces do
							p = t[tostring(pieceIndex)]
							if p then
								spSetPieceCollisionData(unitID, pieceIndex, true, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8])
							else
								spSetPieceCollisionData(unitID, pieceIndex, false, 1, 1, 1, 0, 0, 0, 1, 1)
							end
						end
					else
						p = unitCollisionVolume[defs.name].on
						spSetUnitCollisionData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
					end
					popupUnits[unitID].state = 1
				end
			end			
		end
	end
	
end