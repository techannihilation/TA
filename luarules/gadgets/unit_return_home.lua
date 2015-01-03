--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Return home Liche",
    desc      = "Set's Liche to attack units on way home once missile is fired",
    author    = "nixtux",
    date      = "Jan, 2015",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  
local cybr = UnitDefNames.armcybr.id

local cybr_bomb = WeaponDefNames.armcybr_arm_pidr.id

local unitlist = {}

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  if cybr == unitDefID then
    local ux, uy, uz = Spring.GetUnitPosition(unitID)
    local pos = {ux, uy, uz}
    unitlist[unitID] = {position = pos}
  end
end

function gadget:ProjectileCreated(proID, proOwnerID, proWeaponDefID)
  if unitlist[proOwnerID] and cybr_bomb == proWeaponDefID then
    local position = unitlist[proOwnerID].position
    Spring.GiveOrderToUnit(proOwnerID, CMD.FIGHT, {position[1] ,position[2], position[3]},{'shift'})
    --Spring.GiveOrderToUnit(proOwnerID, CMD.MOVE, {position[1] ,position[2], position[3]},{'shift'})
  end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
  if unitlist[unitID] then
    unitlist[unitID] = nil
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end
