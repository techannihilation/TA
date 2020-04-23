function gadget:GetInfo()
  return {
    name      = "Com Counter",
    desc      = "Tells each team the total number of commanders alive in enemy allyteams",
    author    = "Bluestone",
    date      = "08/03/2014",
    license   = "Horses",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

local enabled = (tostring(Spring.GetModOptions().mo_enemycomcount) == "1") or false
if not enabled then 
  return false
end

if not (gadgetHandler:IsSyncedCode()) then --synced only
	return false
end

local teamComs = {} -- format is enemyComs[teamID] = total # of coms in enemy teams

-- Get coms from UnitDefs
local comDefs = {}
for _, u in ipairs(UnitDefs) do
	if u.customParams.iscommander then
		comDefs[u.id] = true
	end
end

local countChanged  = true 

function gadget:UnitCreated(unitID, unitDefID, teamID)
	-- record com creation
	if comDefs[unitDefID] then
		if not teamComs[teamID] then 
			teamComs[teamID] = 0
		end
		teamComs[teamID] = teamComs[teamID] + 1
		countChanged = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	-- record com death
	if comDefs[unitDefID] then
		if not teamComs[teamID] then 
			teamComs[teamID] = 0 --should never happen
		end
		teamComs[teamID] = teamComs[teamID] - 1
		countChanged = true
	end
end

-- TA does not allow sharing to enemy, so no need to check Given, Taken, etc

local function ReCheck()
	-- occasionally, recheck just to make sure...
	local teamList = Spring.GetTeamList()
	for _,teamID in ipairs(teamList) do
	  local newCount = 0

	  for commander,_ in pairs(comDefs) do
		 newCount = newCount + Spring.GetTeamUnitDefCount(teamID, commander)
	  end
		if newCount ~= teamComs[teamID] then
			countChanged = true
			teamComs[teamID] = newCount
		end
	end
end

function gadget:GameFrame(n)

	if n % 30 == 0 then
		ReCheck()
	end

	if countChanged then
		UpdateCount()
		countChanged = false
	end
end

function UpdateCount()
	-- for each teamID, set a TeamRulesParam containing the # of coms in enemy allyteams
	for teamID,_ in pairs(teamComs) do
		local enemyComCount = 0
		local _,_,_,_,_,allyTeamID = Spring.GetTeamInfo(teamID)
		for otherTeamID,val in pairs(teamComs) do -- count all coms in enemy teams, to get enemy allyteam com count
			local _,_,_,_,_,otherAllyTeamID = Spring.GetTeamInfo(otherTeamID)
			if otherAllyTeamID ~= allyTeamID then
				enemyComCount = enemyComCount + teamComs[otherTeamID]
			end
		end
		--Spring.Echo(teamID, teamComs[teamID], enemyComCount)
		Spring.SetTeamRulesParam(teamID, "enemyComCount", enemyComCount, {private=true, allied=false})
	end
end
