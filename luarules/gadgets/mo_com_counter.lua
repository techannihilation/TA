function gadget:GetInfo()
	--  loaded by default?
	return {
		name = "Com Counter",
		desc = "Tells each team the total number of commanders alive in enemy allyteams",
		author = "Bluestone",
		date = "08/03/2014",
		license = "Horses",
		layer = 0,
		enabled = true
	}
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

local enabled = (tostring(Spring.GetModOptions().mo_enemycomcount) == "1") or false
if not enabled then return false end
if not (gadgetHandler:IsSyncedCode()) then return false end --synced only
local teamComs = {} -- format is enemyComs[teamID] = total # of coms in enemy teams
local comDefs = VFS.Include("luarules/configs/comDefIDs.lua")

local function UpdateCount()
	for teamID, _ in pairs(teamComs) do
		local enemyComCount = 0
		local _, _, _, _, _, allyTeamID = Spring.GetTeamInfo(teamID, false)
		for otherTeamID, _ in pairs(teamComs) do
			local _, _, _, _, _, otherAllyTeamID = Spring.GetTeamInfo(otherTeamID, false)

			if otherAllyTeamID ~= allyTeamID then
				enemyComCount = enemyComCount + teamComs[otherTeamID]
			end
		end
		Spring.SetTeamRulesParam(teamID, "enemyComCount", enemyComCount, {
			private = true,
			allied = false
		})
	end
end

function gadget:Initialize()
	local teamList = Spring.GetTeamList()
	for _, teamID in ipairs(teamList) do
		local newCount = 0

		for commanders in pairs(comDefs) do
			newCount = newCount + Spring.GetTeamUnitDefCount(teamID, commanders)
		end
		teamComs[teamID] = newCount
	end
	UpdateCount()
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	if comDefs[unitDefID] then
		if not teamComs[teamID] then
			teamComs[teamID] = 0
		end
		teamComs[teamID] = teamComs[teamID] + 1
		UpdateCount()
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	if comDefs[unitDefID] then
		if not teamComs[teamID] then
			teamComs[teamID] = 0
		end
		teamComs[teamID] = teamComs[teamID] - 1
		UpdateCount()
	end
end

function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
	if comDefs[unitDefID] then
		teamComs[newTeam] = teamComs[newTeam] + 1
		teamComs[oldTeam] = teamComs[oldTeam] - 1
		UpdateCount()
	end
end