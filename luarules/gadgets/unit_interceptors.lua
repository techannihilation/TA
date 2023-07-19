function gadget:GetInfo()
  return {
    name = "Don't target flyover nukes",
    desc = "bla",
    author = "ashdnazg + [teh]decay",
    date = "Too late",
    license = "GNU GPL, v2 or later",
    layer = 0,
    enabled = true
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local GetUnitPosition = Spring.GetUnitPosition
local GetProjectileTarget = Spring.GetProjectileTarget
local GetFeaturePosition = Spring.GetFeaturePosition

if (not gadgetHandler:IsSyncedCode()) then return false end --  no unsynced code

local antiNukes = {
  --Arm
  [UnitDefNames["armscab"].id] = true,
  [UnitDefNames["armamd"].id] = true,
  [UnitDefNames["armamd1"].id] = true,
  [UnitDefNames["armamd2"].id] = true,
  [UnitDefNames["armcarry"].id] = true,
  [UnitDefNames["armucar"].id] = true,
  --Core
  [UnitDefNames["cormabm"].id] = true,
  [UnitDefNames["corfmd"].id] = true,
  [UnitDefNames["corfmd1"].id] = true,
  [UnitDefNames["corfmd2"].id] = true,
  [UnitDefNames["corcarry"].id] = true,
  [UnitDefNames["corucar"].id] = true,
  --The lost legacy
  [UnitDefNames["tllturtle"].id] = true,
  [UnitDefNames["tllantinuke"].id] = true,
  [UnitDefNames["tllantinuke1"].id] = true,
  [UnitDefNames["tllantinuke2"].id] = true,
  [UnitDefNames["tllcarry"].id] = true,
  [UnitDefNames["tllucar"].id] = true,
  --Talon
  [UnitDefNames["talon_damascus"].id] = true,
  [UnitDefNames["talon_damascus1"].id] = true,
  [UnitDefNames["talon_carry"].id] = true,
  [UnitDefNames["talon_damascus2"].id] = true,
  [UnitDefNames["talon_tribulation"].id] = true,
  [UnitDefNames["talon_ucar"].id] = true,
  --Gok
  [UnitDefNames["gok_antinuke"].id] = true,
  [UnitDefNames["gok_antinuke1"].id] = true,
  [UnitDefNames["gok_antinuke2"].id] = true,
  [UnitDefNames["gok_carry"].id] = true,
  [UnitDefNames["gok_morningstar"].id] = true,
  [UnitDefNames["gok_ucar"].id] = true,
  --Rumad
  [UnitDefNames["rumad_antinuke"].id] = true,
  [UnitDefNames["rumad_antinuke1"].id] = true,
  [UnitDefNames["rumad_antinuke2"].id] = true,
}

local interceptorsID = {}
local projectileTargetCache = {}

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

function gadget:ProjectileDestroyed(proID)
  if projectileTargetCache[proID] then
    projectileTargetCache[proID] = nil
  end
end

function gadget:AllowWeaponInterceptTarget(interceptorUnitID, interceptorWeaponID, targetProjectileID)
  local ox, _, oz = GetUnitPosition(interceptorUnitID)
  local coverageRange = interceptorsID[interceptorUnitID]
  --Spring.GetProjectileTarget( number projectileID ) -> nil | [number targetTypeInt, number targetID | table targetPos = {x, y, z}]
  if not coverageRange then
    return false
  end
  if projectileTargetCache[targetProjectileID] and projectileTargetCache[targetProjectileID][1] then
    local tx = projectileTargetCache[targetProjectileID][1] or nil
    local tz = projectileTargetCache[targetProjectileID][2] or nil
    local areaX = ox - tx
    local areaZ = oz - tz
    return areaX * areaX + areaZ * areaZ < coverageRange
  else
    local targetType, targetID = GetProjectileTarget(targetProjectileID)
    if targetType then
      local tx, tz
      if targetType == 117 then
        tx, _, tz = GetUnitPosition(targetID) -- unit
      elseif targetType == 102 then
        tx, _, tz = GetFeaturePosition(targetID) -- feature
      elseif targetType == 112 then
        tx, _, tz = GetProjectilePosition(targetID) -- PROJECTILE
      elseif targetType == 103 then
        tx, _, tz = targetID[1], targetID[2], targetID[3] -- ground
      end
      local areaX = ox - tx
      local areaZ = oz - tz
      projectileTargetCache[targetProjectileID] = {tx, tz}
      return areaX * areaX + areaZ * areaZ < coverageRange
    end
  end
end

function gadget:Initialize()
  for unitDefID, _ in pairs(antiNukes) do
    local coverageRange = WeaponDefs[UnitDefs[unitDefID].weapons[1].weaponDef].coverageRange
    antiNukes[unitDefID] = coverageRange * coverageRange
  end

  for wdid, wd in pairs(WeaponDefs) do
    if (wd.interceptor and wd.interceptor ~= 16) and wd.coverageRange then
      Script.SetWatchWeapon(wdid, true)
    end
  end
end
