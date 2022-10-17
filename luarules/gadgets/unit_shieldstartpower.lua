function gadget:GetInfo()
	return {
		name = "Shield Starting Power",
		desc = "Sets starting power of shields",
		author = "Silver",
		date = "2018",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true
	}
end

--------------------------------------------------------------------------------
-- Synced only
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then return false end
--------------------------------------------------------------------------------
-- Speedups
--------------------------------------------------------------------------------
local StartingPowerPercent = 5
local SetUnitShieldState = Spring.SetUnitShieldState

--------------------------------------------------------------------------------
-- Callins
--------------------------------------------------------------------------------
function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	local uDef = UnitDefs[unitDefID]

	if uDef.customParams and uDef.customParams.shield_power then
		SetUnitShieldState(unitID, -1, true, (uDef.customParams.shield_power / 100) * StartingPowerPercent)
	end
end
