function gadget:GetInfo()
  return {
    name      = "Dynamic collision volume & Hitsphere Scaledown",
    desc      = "Adjusts collision volume for pop-up style units & Reduces the diameter of default sphere collision volume for 3DO models",
    author    = "Deadnight Warrior",
    date      = "Sep 30, 2010",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end


local popupUnits = {}		--list of pop-up style units
local unitCollisionVolume = include("LuaRules/Configs/CollisionVolumes.lua")	--pop-up style unit collision volume definitions
	



if (gadgetHandler:IsSyncedCode()) then

	--Reduces the diameter of default (unspecified) collision volume for 3DO models,
	--for S3O models it's not needed and will in fact result in wrong collision volume
	function gadget:UnitCreated(unitID, unitDefID, unitTeam)
		if UnitDefs[unitDefID].model.type=="3do" then
			local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = Spring.GetUnitCollisionVolumeData(unitID)
			if (vtype==4 and xs==ys and ys==zs) then
				if (xs>47 and not UnitDefs[unitDefID].canFly) then
					Spring.SetUnitCollisionVolumeData(unitID, xs*0.68, ys*0.68, zs*0.68,  xo, yo, zo,  vtype, htype, axis)
				else
					Spring.SetUnitCollisionVolumeData(unitID, xs*0.75, ys*0.75, zs*0.75,  xo, yo, zo,  vtype, htype, axis)
				end
			end
		end
	end


	--[[ unsupported by engine ATM, same as for 3DO units, but for features
	function gadget:FeatureCreated(featureID, allyTeam)
		local xs, ys, zs, xo, yo, zo, vtype, htype, axis, _ = Spring.GetFeatureCollisionVolumeData(featureID)
		if (vtype==4 and xs==ys and ys==zs) then
			Spring.SetFeatureCollisionVolumeData(unitID, xs*0.75, ys*0.75, zs*0.75,  xo, yo, zo,  vtype, htype, axis)

		end
	end
	]]--


	--check if a unit is pop-up type (the list must be entered manually)
	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		local un = UnitDefs[unitDefID].name
		if unitCollisionVolume[un] then
			popupUnits[unitID]=un
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
		local p
		for unitID,name in pairs(popupUnits) do
			if Spring.GetUnitArmored(unitID) then
				p = unitCollisionVolume[name].off
			else
				p = unitCollisionVolume[name].on

				--[[ if units doesn't use ARMORED variable, uncomment this block to make it use ACTIVATION as well
				if ( Spring.GetUnitIsActive(unitID) ) then
					p = unitCollisionVolume[name].on
				else
					p = unitCollisionVolume[name].off
				end
				]]--

			end
			Spring.SetUnitCollisionVolumeData(unitID, p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9])
		end
	end
end