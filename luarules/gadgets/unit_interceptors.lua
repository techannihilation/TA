function gadget:GetInfo()
	return {
		name     = "Don't target flyover nukes",
		desc     = "bla",
		author	 = "ashdnazg + [teh]decay",
		date     = "Too late",
		license	 = "GNU GPL, v2 or later",
		layer    = 0,
		enabled  = true
	}
end


-- changelog:
-- 17 jul 2015 [teh]decay - fixed error: unit_interceptors.lua"]:27: bad argument #1 to 'unpack' (table expected, got number)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local GetUnitPosition = Spring.GetUnitPosition
local GetProjectileTarget = Spring.GetProjectileTarget

if (not gadgetHandler:IsSyncedCode()) then
	return false	--	no unsynced code
end

local antiNukes = {
--Arm 
  [UnitDefNames["armscab"].id] = true,
  [UnitDefNames["armscab1"].id] = true,
  [UnitDefNames["armamd"].id] = true,
  [UnitDefNames["armamd1"].id] = true,
  [UnitDefNames["armamd2"].id] = true,
  [UnitDefNames["armcarry"].id] = true,
--Core
  [UnitDefNames["cormabm"].id] = true,
  [UnitDefNames["cormabm1"].id] = true,
  [UnitDefNames["corfmd"].id] = true,
  [UnitDefNames["corfmd1"].id] = true,
  [UnitDefNames["corfmd2"].id] = true,
  [UnitDefNames["corcarry"].id] = true,
--The lost legacy
  [UnitDefNames["tllturtle"].id] = true,
  [UnitDefNames["tllantinuke"].id] = true,
  [UnitDefNames["tllantinuke1"].id] = true,
  [UnitDefNames["tllgazelle"].id] = true,
  [UnitDefNames["tllgiant"].id] = true,
}

local interceptorsID = {}
 
function gadget:UnitCreated(unitID, unitDefID, unitTeam)
    if (antiNukes[unitDefID]) then
        interceptorsID[unitID] = antiNukes[unitDefID]
  end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if (antiNukes[unitDefID]) then 
		interceptorsID[unitID] = nil
	end
end

function gadget:AllowWeaponInterceptTarget(interceptorUnitID, interceptorWeaponID, targetProjectileID)
	local ox, _, oz = GetUnitPosition(interceptorUnitID)
	local coverageRange = interceptorsID[interceptorUnitID]
	local targetType, targetID = GetProjectileTarget(targetProjectileID)
	if targetType then
		local tx, tz
		if targetType == 117 then  -- unit
			tx, _, tz = GetUnitPosition(targetID)
		elseif targetType == 102 then  -- feature
			tx, _, tz = GetFeaturePosition(targetID)
		elseif targetType == 112 then -- PROJECTILE
			tx, _, tz = GetProjectilePosition(targetID)
		elseif targetType == 103 then  -- ground
			tx, _, tz = targetID[1], targetID[2], targetID[3]
		end
		local areaX = ox - tx
		local areaZ = oz - tz
		return areaX * areaX + areaZ * areaZ < coverageRange
	end
end


function gadget:Initialize()
	for unitDefID, _ in pairs(antiNukes) do
		local coverageRange = WeaponDefs[UnitDefs[unitDefID].weapons[1].weaponDef].coverageRange
    	antiNukes[unitDefID] = coverageRange * coverageRange
	end
	for wdid, wd in pairs(WeaponDefs) do
		if (wd.interceptor and wd.interceptor ~=16) and wd.coverageRange then
			Script.SetWatchWeapon(wdid, true)
		end
	end
end