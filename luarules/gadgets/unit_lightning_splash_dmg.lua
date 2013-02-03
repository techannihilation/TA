
function gadget:GetInfo()
    return {
        name      = 'Lightning Spash Damage',
        desc      = 'Handles Lightning Weapons Spash Damage',
        author    = 'TheFatController',
        version   = 'v1.0',
        date      = 'April 2011',
        license   = 'GNU GPL, v2 or later',
        layer     = 0,
        enabled   = true
    }
end

----------------------------------------------------------------
-- Synced only
----------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
    return false
end

----------------------------------------------------------------
-- Config
----------------------------------------------------------------

local sparkWeapons = {
    [WeaponDefNames.armzeus_lightning.id] = {ceg = "ZEUS_FLASH_SUB", forkdamage = 0.5, maxunits = 2, radius = 60},
    [WeaponDefNames.armzeus1_lightning1.id] = {ceg = "ZEUS_FLASH_SUB", forkdamage = 0.5, maxunits = 3, radius = 60},
    [WeaponDefNames.armclaw_dclaw.id] = {ceg = "CLAW_FLASH_SUB", forkdamage = 0.325, maxunits = 2, radius = 60},
}

local immuneToSplash = {
    [UnitDefNames["armzeus"].id] = true,
    [UnitDefNames["armzeus1"].id] = true,
    [UnitDefNames["armclaw"].id] = true,
}

local mRandom = math.random
local rad = math.rad
local SpGetUnitPosition = Spring.GetUnitPosition
local SpGetUnitsInSphere = Spring.GetUnitsInSphere
local SpGetUnitDefID = Spring.GetUnitDefID
local SpSpawnCEG = Spring.SpawnCEG
local SpAddUnitDamage = Spring.AddUnitDamage

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------
function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
    if sparkWeapons[weaponID] then
      local x,y,z = SpGetUnitPosition(unitID)
      local angle = rad(mRandom(1,360))
      local nearUnits = SpGetUnitsInSphere(x,y,z,sparkWeapons[weaponID].radius)
      local count = 0
      for _,nearUnit in ipairs(nearUnits) do
        if (count >= sparkWeapons[weaponID].maxunits) then 
          return
        end
        local nearUnitDefID = SpGetUnitDefID(nearUnit)
        if (nearUnit ~= unitID) and (not immuneToSplash[nearUnitDefID]) then
          local nx,ny,nz = SpGetUnitPosition(nearUnit)
          SpSpawnCEG(sparkWeapons[weaponID].ceg,nx,ny,nz,0,0,0)
          SpAddUnitDamage(nearUnit, damage*sparkWeapons[weaponID].forkdamage, 0, attackerID)
          count = count + 1
        end
      end    
    end
end
