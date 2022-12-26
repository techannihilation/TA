function gadget:GetInfo()
	return {
		name = "Xmas",
		desc = "For Christmas time",
		author = "Silver",
		version = "",
		date = "2022",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = false
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
local maxUnits = 1
local unitsList = {"umex"} -- you can add other too e.g. {"umex", "armpw", "armck"} etc.
local XmasUnits = {}

for _, v in pairs(unitsList) do
	if not UnitDefNames[v] then return end
	XmasUnits[UnitDefNames[v].id] = {
		name = UnitDefNames[v].humanName
	}
end



local TeamUnitNb = {}
local color = "\255\64\255\64"

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
	--------------------------------------------------------------------------------
	-- BEGIN SYNCED
	--------------------------------------------------------------------------------
	function gadget:Initialize()
		for _, teamID in ipairs(GetTeamList()) do
			TeamUnitNb[teamID] = 0
			AllTeamUnits = GetTeamUnits(teamID)
			for i = 1, #AllTeamUnits do
				local unitID = AllTeamUnits[i]
				local unitDefID = GetUnitDefID(unitID)
				if XmasUnits[unitDefID] then
					TeamUnitNb[teamID] = TeamUnitNb[teamID] + 1
				end
			end
		end
	end

	function gadget:UnitCreated(unitID, unitDefID, unitTeam)
		if XmasUnits[unitDefID] then
			TeamUnitNb[unitTeam] = TeamUnitNb[unitTeam] + 1
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
		if XmasUnits[unitDefID] then
			TeamUnitNb[unitTeam] = TeamUnitNb[unitTeam] - 1
		end
	end

	function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
		if XmasUnits[unitDefID] then
			TeamUnitNb[oldTeam] = TeamUnitNb[oldTeam] - 1
			TeamUnitNb[newTeam] = TeamUnitNb[newTeam] + 1
		end
	end

	function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z, facing)
		if XmasUnits[unitDefID] and (TeamUnitNb[builderTeam] >= maxUnits) then
			SendMessageToTeam(builderTeam, color .. "Xmas warning: Can't build " .. XmasUnits[unitDefID].name .. ", Xmas limit has been reached.")
			return false
		end
		return true
	end

	function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
		if XmasUnits[unitDefID] and (TeamUnitNb[newTeam] >= maxUnits) then
			SendMessageToTeam(oldTeam, color .. "Xmas warning: Can't share " .. XmasUnits[unitDefID].name .. ", Xmas limit for team " .. newTeam .. " has been reached.")
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
