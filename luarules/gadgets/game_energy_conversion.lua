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


local AC0 = 1.2/100
local AC1 = 1.3/100
local AC2 = 1.4/100
local AC3 = 1.5/100
local AC4 = 1.6/100
local AC5 = 1.7/100
local AC6 = 1.8/100

local T0 = 1.08/100
local T1 = 1.16/100
local T2 = 1.24/100
local T3 = 1.31/100
local T4 = 1.39/100
local T5 = 1.47/100
local T6 = 1.53/100



local convertCapacities = {

		--ARM
		[UnitDefNames.armmakr.id]  = { c = 50, e = (AC0) }, -- Normal
		[UnitDefNames.armfmkr.id]  = { c = 100, e = (AC1) }, -- Floating
		[UnitDefNames.ametalmakerlvl1.id]  = { c = 200, e = (AC2) }, -- T1,5
		--[UnitDefNames.____.id]  = { c = 400, e = (AC3) }, -- Cloaked/Hardened
		[UnitDefNames.armmmkr.id]  = { c = 800, e = (AC4) }, -- Moho
		[UnitDefNames.armuwmmm.id]  = { c = 1000, e = (AC5) }, -- Underwater
		[UnitDefNames.ametalmakerlvl2.id]  = { c = 16000, e = (AC6) }, -- Super
					
		--CORE
		[UnitDefNames.cormakr.id]  = { c = 64, e = (AC0) }, -- Normal
		[UnitDefNames.corfmkr.id]  = { c = 128, e = (AC1) }, -- Floating
		[UnitDefNames.cmetalmakerlvl1.id]  = { c = 256, e = (AC2) }, -- T1,5
		--[UnitDefNames.____.id]  = { c = 512, e = (AC3) }, -- Cloaked/Hardened
		[UnitDefNames.cormmkr.id]  = { c = 1024, e = (AC4) }, -- Moho
		[UnitDefNames.coruwmmm.id]  = { c = 1280, e = (AC5) }, -- Underwater
		[UnitDefNames.cmetalmakerlvl2.id]  = { c =20480, e = (AC6) }, -- Super

		--TLL
		[UnitDefNames.tllmm.id]  = { c = 100, e = (T0) }, -- Normal
		[UnitDefNames.tllwmconv.id]  = { c = 100, e = (T1) }, -- Floating
		--[UnitDefNames.____.id]  = { c = 300, e = (T2) }, -- T1,5
		--[UnitDefNames.____.id]  = { c = 600, e = (T3) }, -- Cloaked/Hardened
		[UnitDefNames.tllammaker.id]  = { c = 1000, e = (T4) }, -- Moho
		--[UnitDefNames.____.id]  = { c = 1000, e = (T5) }, -- Underwater
		--[UnitDefNames.____.id]  = { c = 10000, e = (T6) }, -- Super

    }

----------------------------------------------------------------
-- Vars
----------------------------------------------------------------
local teamList = {}
local teamCapacities = {}
local teamUsages = {}
local teamMMList = {}
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
local Efficiencies = {size =4, buffer={}, pointer=0}

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



function Efficiencies:init()
	for j=1, self.size do
		self.buffer[j]=nil
	end
end

----------------------------------------------------------------
-- Callins
----------------------------------------------------------------
function gadget:Initialize()
	Efficiencies:init()
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
		spSetTeamRulesParam(tID, mmAvgEffiParamName, Efficiencies:avg())

    end
    splitMMUpdate = math.floor(math.max((90 / #teamList),1))
end

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
						-- Spring.Echo(string.format('[C: %i E: %.1f%s (x1000) ]: %.1f  - %.1f', teamCapacities[tID][eSteps[j]], eSteps[j] * 1000, '%', teamCapacities[tID][eSteps[j]] * resourceFraction, convertAmount))
					
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
			
			Efficiencies:push({m=mConverted, e=eConverted})
						
			local tUsage = (resourceUpdatesPerGameSec * teamUsages[tID])
			spSetTeamRulesParam(tID, mmUseParamName, tUsage)
			spSetTeamRulesParam(tID, mmAvgEffiParamName, Efficiencies:avg())			
			
			lastPost[tID] = tUsage
			teamUsages[tID] = 0
		end
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
    if convertCapacity then
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
