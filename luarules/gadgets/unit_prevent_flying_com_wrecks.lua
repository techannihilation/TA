function gadget:GetInfo()
  return {
    name      = "prevent_flying_com_wrecks",
    desc      = "prevent_flying_com_wrecks",
    author    = "TheFatController",
    date      = "17 Aug 2010",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = flase  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

local commanders = {}
for unitDefID, ud in pairs(UnitDefs) do
  if ud.customParams.iscommander then
    commanders[unitDefID] = true
  end
end

local GetUnitHealth = Spring.GetUnitHealth
--local LICHE_BOMB = WeaponDefNames['armcybr_arm_pidr'].id

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
	--if (UnitDefs[unitDefID].customParams.iscommander) and ((damage > GetUnitHealth(unitID)) or (weaponID==LICHE_BOMB)) then
	if commanders[unitDefID] and damage > GetUnitHealth(unitID) then
		return damage, 0
	end
	return damage, 1
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------