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

local comDefs = {
	[UnitDefNames["corcom"].id] = true,
	[UnitDefNames["corcom1"].id] = true,
	[UnitDefNames["corcom3"].id] = true,
	[UnitDefNames["corcom_fusion"].id] = true,
	[UnitDefNames["corcom5"].id] = true,
	[UnitDefNames["corcom6"].id] = true,
	[UnitDefNames["corcom7"].id] = true,
	--Arm 
	[UnitDefNames["armcom"].id] = true,
	[UnitDefNames["armcom1"].id] = true,
	[UnitDefNames["armcom4"].id] = true,
	[UnitDefNames["armcom_fusion"].id] = true,
	[UnitDefNames["armcom5"].id] = true,
	[UnitDefNames["armcom6"].id] = true,
	[UnitDefNames["armcom7"].id] = true,
	--The lost legacy
	[UnitDefNames["tllcom"].id] = true,
	[UnitDefNames["tllcom1"].id] = true,
	[UnitDefNames["tllcom3"].id] = true,
	[UnitDefNames["tllcom_fusion"].id] = true,
	[UnitDefNames["tllcom5"].id] = true,
	[UnitDefNames["tllcom6"].id] = true,
	[UnitDefNames["tllcom7"].id] = true,
	--Talon
	[UnitDefNames["talon_com"].id] = true,
	[UnitDefNames["talon_com1"].id] = true,
	[UnitDefNames["talon_com3"].id] = true,
	[UnitDefNames["talon_com_fusion"].id] = true,
	[UnitDefNames["talon_com5"].id] = true,
	[UnitDefNames["talon_com6"].id] = true,
	[UnitDefNames["talon_com7"].id] = true
}

local function UpdateCount()
	for teamID, _ in pairs(teamComs) do
		local enemyComCount = 0
		local _, _, _, _, _, allyTeamID = Spring.GetTeamInfo(teamID,false)
		for otherTeamID, _ in pairs(teamComs) do
			local _, _, _, _, _, otherAllyTeamID = Spring.GetTeamInfo(otherTeamID,false)
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