function gadget:GetInfo()
	return {
		name = "Tech Limit",
		desc = "Limits tech level", --based on "Disable Buildoptions" made by quantum
		author = "Silver",
		version = "",
		date = "2019",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = false --disabled for now, not finished
	}
end

--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
local EditUnitCmdDesc = Spring.EditUnitCmdDesc
local FindUnitCmdDesc = Spring.FindUnitCmdDesc

--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
--ECONOMY TECH LEVELS -----------
local TECH_ONE_PLUS = {
	[UnitDefNames.correch1.id] = {true},
	[UnitDefNames.cbuilderlvl2.id] = {true}
}

local TECH_TWO = {
	[UnitDefNames.corack.id] = {true},
	[UnitDefNames.coracv.id] = {true},
	[UnitDefNames.coraca.id] = {true},
	[UnitDefNames.correch2.id] = {true},
	[UnitDefNames.cbuilderlvl3.id] = {true}
}

local TECH_THREE = {
	[UnitDefNames.pinchy.id] = {true},
	[UnitDefNames.corecv.id] = {true},
	[UnitDefNames.coreca.id] = {true},
	[UnitDefNames.correch3.id] = {true},
	[UnitDefNames.cbuilderlvl4.id] = {true}
}

local TECH_FOUR = {
	[UnitDefNames.corcrab.id] = {true},
	[UnitDefNames.correch4.id] = {true},
	[UnitDefNames.cbuilderlvl5.id] = {true}
}

---------------------------------
local disableTable = {}
local warncolor = "\255\255\64\64"
local infocolor = "\255\255\255\64"

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	local function DisableBuildButtons(unitID, disableTable)
		for _, disable in ipairs(disableTable) do
			local cmdDescID = FindUnitCmdDesc(unitID, -disable[1])

			if (cmdDescID) then
				local cmdArray = {
					disabled = true,
					tooltip = disable[2],
					hidden = true
				}

				EditUnitCmdDesc(unitID, cmdDescID, cmdArray)
			end
		end
	end

	function gadget:UnitCreated(unitID, unitDefID)
		local unitDef = UnitDefs[unitDefID]

		if unitDef.buildOptions then
			for _, buildoptionID in ipairs(unitDef.buildOptions) do
				if TECH_ONE_PLUS[buildoptionID] then
					disableTable[#disableTable + 1] = {buildoptionID, warncolor .. "ADVANCED T1 TECHNOLOGY IS DISABLED BY " .. infocolor .. "MOD OPTION"}
				end

				if TECH_TWO[buildoptionID] then
					disableTable[#disableTable + 1] = {buildoptionID, warncolor .. "T2 TECHNOLOGY IS DISABLED BY " .. infocolor .. "MOD OPTION"}
				end

				if TECH_THREE[buildoptionID] then
					disableTable[#disableTable + 1] = {buildoptionID, warncolor .. "T3 TECHNOLOGY IS DISABLED BY " .. infocolor .. "MOD OPTION"}
				end

				if TECH_FOUR[buildoptionID] then
					disableTable[#disableTable + 1] = {buildoptionID, warncolor .. "T4 TECHNOLOGY IS DISABLED BY " .. infocolor .. "MOD OPTION"}
				end
			end
		end

		DisableBuildButtons(unitID, disableTable)
	end

	function gadget:UnitFinished(unitID, unitDefID)
		DisableBuildButtons(unitID, disableTable)
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