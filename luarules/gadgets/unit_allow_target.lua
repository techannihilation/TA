function gadget:GetInfo()
  return {
    name      = "Allow Weapon Target Priority",
    desc      = "",
    author    = "Silver",
    version   = "1.0",
    date      = "2018",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end
--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
local GetUnitDefID              = Spring.GetUnitDefID
--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local attackers = {
    [UnitDefNames.screamer.id] = true,
    [UnitDefNames.mercury.id]  = true,
}
local oldTargetID
--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	function gadget:AllowWeaponTarget(attackerID, targetID, attackerWeaponNum, attackerWeaponDefID, defPriority)
		local attackerDefID = GetUnitDefID(attackerID)
		if attackers[attackerDefID] and oldTargetID == targetID then
			return true, 1
		end
		oldTargetID = targetID	
		return true, defPriority
	end
else
--------------------------------------------------------------------------------
-- END SYNCED
-- BEGIN UNSYNCED
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-- END UNSYNCED
--------------------------------------------------------------------------------
