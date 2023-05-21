function gadget:GetInfo()
	return {
		name = "Max Nukes",
		desc = "Limits number of nukes",
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
local SendMessageToTeam = Spring.SendMessageToTeam
local GetTeamUnits = Spring.GetTeamUnits
local GetUnitDefID = Spring.GetUnitDefID
local GetTeamList = Spring.GetTeamList
--------------------------------------------------------------------------------
-- CONSTANS
--------------------------------------------------------------------------------
local maxNukes = 12
local NukeList = {"armsilo", "armsilo1", "corsilo", "corsilo1", "tllsilo", "tllsilo1", "talon_silo1", "talon_silo", "tllfsilo", "talon_elixir", "corfsilo", "armfsilo", "gok_silo", "gok_silo1", "gok_silo2", "rumad_silo", "rumad_silo1"}
local NUKES = {}

for _, v in pairs(NukeList) do
	NUKES[UnitDefNames[v].id] = {
		name = UnitDefNames[v].humanName
	}
end

local TeamNukesNb = {}
local color = "\255\255\64\64"

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:Initialize()
		for _, teamID in ipairs(GetTeamList()) do
			TeamNukesNb[teamID] = 0
			AllTeamUnits = GetTeamUnits(teamID)
			for i = 1, #AllTeamUnits do
				local unitID = AllTeamUnits[i]
				local unitDefID = GetUnitDefID(unitID)
				if NUKES[unitDefID] then
					TeamNukesNb[teamID] = TeamNukesNb[teamID] + 1
				end
			end
		end
	end

	function gadget:UnitCreated(unitID, unitDefID, unitTeam)
		if NUKES[unitDefID] then
			TeamNukesNb[unitTeam] = TeamNukesNb[unitTeam] + 1
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		if NUKES[unitDefID] then
			TeamNukesNb[unitTeam] = TeamNukesNb[unitTeam] - 1
		end
	end

	function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
		if NUKES[unitDefID] then
			TeamNukesNb[oldTeam] = TeamNukesNb[oldTeam] - 1
			TeamNukesNb[newTeam] = TeamNukesNb[newTeam] + 1
		end
	end

	function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z, facing)
		if NUKES[unitDefID] and (TeamNukesNb[builderTeam] >= maxNukes) then
			SendMessageToTeam(builderTeam, color .. "Warning: Can't build " .. NUKES[unitDefID].name .. ", nuke number limit has been reached.")
			return false
		end
		return true
	end

	function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
		if NUKES[unitDefID] and (TeamNukesNb[newTeam] >= maxNukes) then
			SendMessageToTeam(oldTeam, color .. "Warning: Can't share " .. NUKES[unitDefID].name .. ", nuke number limit for team " .. newTeam .. " has been reached.")
			return false
		end
		return true
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
