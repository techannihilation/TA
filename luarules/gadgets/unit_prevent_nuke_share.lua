function gadget:GetInfo()
	return {
		name = "Prevent Share Nukes",
		desc = "Prevent Share Nukes",
		author = "Silver",
		version = "",
		date = "2019",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true
	}
end

--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
Echo = Spring.Echo
local color = "\255\255\64\64"

--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local NUKES = {
	[UnitDefNames.armsilo.id] = UnitDefNames.armsilo.humanName,
	[UnitDefNames.armsilo1.id] = UnitDefNames.armsilo1.humanName,
	[UnitDefNames.corsilo.id] = UnitDefNames.corsilo.humanName,
	[UnitDefNames.corsilo1.id] = UnitDefNames.corsilo1.humanName,
	[UnitDefNames.tllsilo.id] = UnitDefNames.tllsilo.humanName,
	[UnitDefNames.tllsilo1.id] = UnitDefNames.tllsilo1.humanName
}

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
		if NUKES[unitDefID] then
			Echo(color .. "Warning: " .. NUKES[unitDefID] .. " can not be shared to other team !")

			return false
		end
	end
else
	--------------------------------------------------------------------------------
	-- END SYNCED
	-- BEGIN UNSYNCED
	--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-- END UNSYNCED
--------------------------------------------------------------------------------