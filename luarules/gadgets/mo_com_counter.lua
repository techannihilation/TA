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

local comDefs = {
  [UnitDefNames["corcom"].id] = true,
  [UnitDefNames["corcom1"].id] = true,
  [UnitDefNames["corcom3"].id] = true,
  [UnitDefNames["corcom5"].id] = true,
  [UnitDefNames["corcom6"].id] = true,
  [UnitDefNames["corcom7"].id] = true,
--Arm 
  [UnitDefNames["armcom"].id] = true,
  [UnitDefNames["armcom1"].id] = true,
  [UnitDefNames["armcom4"].id] = true,
  [UnitDefNames["armcom5"].id] = true,
  [UnitDefNames["armcom6"].id] = true,
  [UnitDefNames["armcom7"].id] = true,
--The lost legacy
  [UnitDefNames["tllcom"].id] = true,
  [UnitDefNames["tllcom1"].id] = true,
  [UnitDefNames["tllcom3"].id] = true,
  [UnitDefNames["tllcom5"].id] = true,
  [UnitDefNames["tllcom6"].id] = true,
  [UnitDefNames["tllcom7"].id] = true,
}

local countChanged  = true 

function isCom(unitID,unitDefID)
	if not unitDefID and unitID then
		unitDefID =  Spring.GetUnitDefID(unitID)
	end
	if not unitDefID or not UnitDefs[unitDefID] or not UnitDefs[unitDefID].customParams then
		return false
	end
	return UnitDefs[unitDefID].customParams.iscommander ~= nil
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
	-- record com creation
	if isCom(unitID) then
		if not teamComs[teamID] then 
			teamComs[teamID] = 0
		end
		teamComs[teamID] = teamComs[teamID] + 1
		countChanged = true
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID)
	-- record com death
	if isCom(unitID) then
		if not teamComs[teamID] then 
			teamComs[teamID] = 0 --should never happen
		end
		teamComs[teamID] = teamComs[teamID] - 1
		countChanged = true
	end
end

-- BA does not allow sharing to enemy, so no need to check Given, Taken, etc

local function ReCheck()
	-- occasionally, recheck just to make sure...
	local teamList = Spring.GetTeamList()
	for _,teamID in pairs(teamList) do
	  	local newCount = 0

	  for commanders,_ in pairs(comDefs) do
		 newCount = newCount + Spring.GetTeamUnitDefCount(teamID, commanders)
	  end
		if newCount ~= teamComs[teamID] then
			countChanged = true
			teamComs[teamID] = newCount
		end
	end
end

function gadget:GameFrame(n)

	if n%30==0 then
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
