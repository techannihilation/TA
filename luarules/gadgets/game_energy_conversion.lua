function gadget:GetInfo()
    return {
        name      = 'Energy Conversion',
        desc      = 'Handles converting energy to metal',
        author    = 'Niobium(modified by TheFatController, Finkky)',
        version   = 'v2.2',
        date      = 'May 2011',
        license   = 'GNU GPL, v2 or later',
        layer     = 0,
        enabled   = true
    }
end

----------------------------------------------------------------
-- Synced only
----------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then
    return false
end

----------------------------------------------------------------
-- Config
----------------------------------------------------------------
local alterLevelRegex = '^' .. string.char(137) .. '(%d+)$'
local mmLevelParamName = 'mmLevel'
local mmCapacityParamName = 'mmCapacity'
local mmUseParamName = 'mmUse'
local mmAvgEfficiencyParamName = 'mmAvgEfficiency'
local mmAvgEffiParamName = 'mmAvgEffi'

local frameRate = 32
local resourceRefreshRate = 16 -- In Frames
local resourceFraction = resourceRefreshRate / frameRate
local resourceUpdatesPerGameSec = frameRate / resourceRefreshRate

local convertCapacities = include("LuaRules/Configs/maker_defs.lua")

----------------------------------------------------------------
-- Vars
----------------------------------------------------------------
local teamList = {}
local teamCapacities = {}
local teamUsages = {}
local teamMMList = {}
local teamEfficiencies = {}
local eSteps = {}
local teamActiveMM = {}
local lastPost = {}
local splitMMPointer = 1
local splitMMUpdate = 90

----------------------------------------------------------------
-- Speedups
----------------------------------------------------------------
local min = math.min
local spGetPlayerInfo = Spring.GetPlayerInfo
local spGetTeamRulesParam = Spring.GetTeamRulesParam
local spSetTeamRulesParam = Spring.SetTeamRulesParam
local spGetTeamResources = Spring.GetTeamResources
local spUseTeamResource = Spring.UseTeamResource
local spAddTeamResource = Spring.AddTeamResource
local spGetUnitHealth = Spring.GetUnitHealth
local spSetUnitCOBValue = Spring.SetUnitCOBValue

----------------------------------------------------------------
-- Functions
----------------------------------------------------------------

local function prototype(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

local function AdjustTeamCapacity(teamID, adjustment, e)
    local newCapacity = teamCapacities[teamID][e] + adjustment
    teamCapacities[teamID][e] = newCapacity
	
	local totalCapacity = 0
	for j = 1, #eSteps do
		totalCapacity = totalCapacity + teamCapacities[teamID][eSteps[j]]
	end
    spSetTeamRulesParam(teamID, mmCapacityParamName, totalCapacity)
end

local function UpdateMetalMakers(teamID, energyUse)
	for j = 1, #eSteps do
		for unitID,defs in pairs(teamMMList[teamID][eSteps[j]]) do
			if (energyUse > 0) then
				energyUse = (energyUse - defs.capacity)
				if (defs.status == 0) then
					spSetUnitCOBValue(unitID,1024,1)
					defs.status = 1
					teamActiveMM[teamID] = (teamActiveMM[teamID] + 1)
				end
			else
				if (teamActiveMM[teamID] == 0) then break end
				if (defs.status == 1) then
					spSetUnitCOBValue(unitID,1024,0)
					defs.status = 0
					teamActiveMM[teamID] = (teamActiveMM[teamID] - 1)
				end
			end
		end
	end
end

----------------------------------------------------------------
-- Efficiencies Methods
----------------------------------------------------------------
local Efficiencies = {size =4, buffer={}, pointer=0, tID = -1}

function Efficiencies:avg()
	local sumE = 0
	local sumM = 0
	local nonZeroCount = 0
	for j=1, self.size do
		if not (self.buffer[j] == nil) then
			sumM = sumM + self.buffer[j].m
			sumE = sumE + self.buffer[j].e
			nonZeroCount = nonZeroCount + 1 
		end
	end
	if(nonZeroCount > 0 and sumE > 0) then return sumM/sumE end
	return 0
end

function Efficiencies:push(o)
	self.buffer[self.pointer + 1] = o
	self.pointer = (self.pointer +1) % self.size
end



function Efficiencies:init(tID)
	for j=1, self.size do
		self.buffer[j]=nil
	end
	self.tID = tID
end

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------
function gadget:Initialize()
    local i = 1
    for defid, defs in pairs(convertCapacities) do
		local inTable = false
		for _,e in ipairs(eSteps) do
			if (e == defs.e) then
			  inTable = true
			end
		end
		if (inTable == false) then
			eSteps[i] = defs.e
			i = (i + 1)
		end
    end
    table.sort(eSteps, function(m1,m2) return m1 > m2; end)
    teamList = Spring.GetTeamList()
    for i = 1, #teamList do
        local tID = teamList[i]
        teamCapacities[tID] = {}
		teamEfficiencies[tID] = prototype(Efficiencies)
		teamEfficiencies[tID]:init(tID)
        teamMMList[tID] = {}
        teamActiveMM[tID] = 0
        lastPost[tID] = 0
        for j = 1, #eSteps do
			teamCapacities[tID][eSteps[j]] = 0
			teamMMList[tID][eSteps[j]] = {}
        end
        teamUsages[tID] = 0
        spSetTeamRulesParam(tID, mmLevelParamName, 0.75)
        spSetTeamRulesParam(tID, mmCapacityParamName, 0)
        spSetTeamRulesParam(tID, mmUseParamName, 0)
		spSetTeamRulesParam(tID, mmAvgEffiParamName, teamEfficiencies[tID]:avg())

    end
    splitMMUpdate = math.floor(math.max((90 / #teamList),1))
end
-- DEV
-- local infoTimer = 0
function gadget:GameFrame(n)
	if (n % resourceRefreshRate == 0) then
		for i = 1, #teamList do
			local tID = teamList[i]
			local eCur, eStor = spGetTeamResources(tID, 'energy')
			local convertAmount = eCur - eStor * spGetTeamRulesParam(tID, mmLevelParamName)
			local eConvert = 0
			local mConvert = 0
			local eConverted = 0
			local mConverted = 0
			
			for j = 1, #eSteps do
				if(teamCapacities[tID][eSteps[j]] > 1) then
					if (convertAmount > 1) then
						--Spring.Echo(string.format('[C: %i E: %.1f%s (x1000) ]: %.1f  - %.1f', teamCapacities[tID][eSteps[j]], eSteps[j] * 1000, '%', teamCapacities[tID][eSteps[j]] * resourceFraction, convertAmount))
						local convertStep = min(teamCapacities[tID][eSteps[j]] * resourceFraction, convertAmount)
						eConverted = convertStep + eConverted
						mConverted = convertStep * eSteps[j] + mConverted
						
						spUseTeamResource(tID, 'energy', convertStep)
						spAddTeamResource(tID, 'metal',  convertStep * eSteps[j])
						teamUsages[tID] = teamUsages[tID] + convertStep
						convertAmount = convertAmount - convertStep
					else break end
				end
			end

			teamEfficiencies[tID]:push({m=mConverted, e=eConverted})
			-- DEV
			-- if(infoTimer == 15) then
				-- Spring.Echo(teamEfficiencies[tID].tID .. ", "..teamEfficiencies[tID]avg())
			-- end
			local tUsage = (resourceUpdatesPerGameSec * teamUsages[tID])
			spSetTeamRulesParam(tID, mmUseParamName, tUsage)
			spSetTeamRulesParam(tID, mmAvgEffiParamName, teamEfficiencies[tID]:avg())			
			
			lastPost[tID] = tUsage
			teamUsages[tID] = 0
		end
		-- DEV
		-- if (infoTimer == 15) then infoTimer = 0 end
		-- infoTimer = infoTimer + 1 
	end

    if (n%splitMMUpdate == 0) then
		local tID = teamList[splitMMPointer]
		UpdateMetalMakers(tID,lastPost[tID])
		if (splitMMPointer == #teamList) then
			splitMMPointer = 1
		else
			splitMMPointer = splitMMPointer + 1
		end
    end
end




function gadget:UnitFinished(uID, uDefID, uTeam)
    local cDefs = convertCapacities[uDefID]
    if cDefs then
        teamMMList[uTeam][cDefs.e][uID] = {capacity=cDefs.c, status=1}
        teamActiveMM[uTeam] = teamActiveMM[uTeam] + 1
        spSetUnitCOBValue(uID,1024,1)
        AdjustTeamCapacity(uTeam, cDefs.c, cDefs.e)
    end
end

function gadget:UnitDestroyed(uID, uDefID, uTeam)
    local cDefs = convertCapacities[uDefID]
    if cDefs then
        local _, _, _, _, buildProg = spGetUnitHealth(uID)
        if buildProg == 1 then
			if (teamMMList[uTeam][cDefs.e][uID].status == 1) then
				teamActiveMM[uTeam] = teamActiveMM[uTeam] - 1
			end
            teamMMList[uTeam][cDefs.e][uID] = nil
            AdjustTeamCapacity(uTeam, -cDefs.c, cDefs.e)
        end
    end
end

function gadget:UnitGiven(uID, uDefID, newTeam, oldTeam)
    local cDefs = convertCapacities[uDefID]
    if cDefs then
        local _, _, _, _, buildProg = spGetUnitHealth(uID)
        if (buildProg == 1) then
            AdjustTeamCapacity(oldTeam, -cDefs.c, cDefs.e)
            AdjustTeamCapacity(newTeam,  cDefs.c, cDefs.e)
            teamMMList[newTeam][cDefs.e][uID] = teamMMList[oldTeam][cDefs.e][uID]
            if (teamMMList[oldTeam][cDefs.e][uID].status == 1) then
				teamActiveMM[oldTeam] = teamActiveMM[oldTeam] - 1
				teamActiveMM[newTeam] = teamActiveMM[newTeam] + 1
			end
            teamMMList[oldTeam][cDefs.e][uID] = nil
        end
    end
end

function gadget:RecvLuaMsg(msg, playerID)
    local newLevel = tonumber(msg:match(alterLevelRegex))
    if newLevel and newLevel >= 0 and newLevel <= 100 then
        local _, _, playerIsSpec, playerTeam = spGetPlayerInfo(playerID)
        if not playerIsSpec then
            spSetTeamRulesParam(playerTeam, mmLevelParamName, newLevel / 100)
            return true
        end
    end
end
