function gadget:GetInfo()
	return {
		name = "Final Boss",
		desc = "Spawns and controls the final boss event",
		author = "Codex",
		date = "2026-06-13",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true,
	}
end

if not gadgetHandler:IsSyncedCode() then
	return false
end

local PHASE_CORE = 1
local PHASE_DARK_DEUS = 2
local FINAL_BOSS_UNITS = {
	[PHASE_CORE] = "core_core_boss",
	[PHASE_DARK_DEUS] = "gok_darkdeus_boss",
}
local DEV_MODE_CHAT_ACTION = "bossdevmode"
local DEV_SPAWN_CORE_MSG = "final_boss_dev:spawn_now"
local DEV_SPAWN_DARK_DEUS_MSG = "final_boss_dev:spawn_phase2_now"

local FRAMES_PER_SECOND = 30
local SPAWN_MINUTES_CONFIG = {
	default = 0,
	min = 0,
	max = 120,
}
local WARNING_MINUTES = 10
local RETARGET_INTERVAL_FRAMES = 30 * FRAMES_PER_SECOND
local ORDER_REFRESH_FRAMES = 10 * FRAMES_PER_SECOND
local PROGRESS_CHECK_FRAMES = 5 * FRAMES_PER_SECOND
local STALL_TIMEOUT_FRAMES = 20 * FRAMES_PER_SECOND
local MIDDLE_ROAM_DURATION_FRAMES = 3 * 60 * FRAMES_PER_SECOND
local MIN_PROGRESS_POSITION_ELOS = 500
local TARGET_REACHED_RADIUS = 650
local TARGET_CLEAR_RANGE_MULT = 0.8
local AREA_RETARGET_RADIUS = 300
local BASE_CLUSTER_CONFIG = {
	linkRangeMult = 1.5,
	minLinkRange = TARGET_REACHED_RADIUS * 3,
	clearPadding = TARGET_REACHED_RADIUS,
}
local MIDDLE_ROAM_EDGE_RANGE_MULT = 1.1
local FALLBACK_BOSS_WEAPON_RANGE = 1800
local ECO_ROAM_ADVANTAGE = 0.50
local ECO_ATTACK_ADVANTAGE = 0.70
local ECO_FORCE_ATTACK_DELAY_FRAMES = 20 * 60 * FRAMES_PER_SECOND
local DUAL_BOSS_CONFIG = {
	minPlayerTS = 30,
	fallbackMinTS = 5,
	fallbackMaxTS = 40,
	spawnBaseFraction = 0.25,
	spawnSeparation = 650,
	weakHpMult = 0.10,
	weakSpeedMult = 1.50,
}

local STATE_COUNTDOWN = 0
local STATE_FIGHT = 1
local STATE_FORCED_MOVE = 2
local STATE_DEAD = 3
local STATE_MIDDLE_ROAM = 4

local MODE_ATTACK = 1
local MODE_MIDDLE_ROAM = 2

local TARGET_STAGE_BASE = 1
local TARGET_STAGE_ENERGY = 2

local ATTACKER_UNKNOWN = 0
local ATTACKER_COMMANDER = 1
local ATTACKER_AIR = 2
local ATTACKER_NAVAL = 3
local ATTACKER_STATIC = 4
local ATTACKER_ARTILLERY = 5
local ATTACKER_BUILDER = 6
local ATTACKER_GROUND = 7

local modOptions = (Spring.GetModOptions and Spring.GetModOptions()) or {}
local spawnMinutes = tonumber(modOptions.mo_final_boss_spawn_minutes) or SPAWN_MINUTES_CONFIG.default
spawnMinutes = math.max(SPAWN_MINUTES_CONFIG.min, math.min(SPAWN_MINUTES_CONFIG.max, spawnMinutes))
if spawnMinutes <= 0 then
	return false
end

local spGetGameFrame = Spring.GetGameFrame
local spGetGaiaTeamID = Spring.GetGaiaTeamID
local spGetTeamList = Spring.GetTeamList
local spGetTeamInfo = Spring.GetTeamInfo
local spGetTeamAllyTeamID = Spring.GetTeamAllyTeamID
local spGetTeamStatsHistory = Spring.GetTeamStatsHistory
local spGetTeamUnits = Spring.GetTeamUnits
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetAllyTeamStartBox = Spring.GetAllyTeamStartBox
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitTeam = Spring.GetUnitTeam
local spGetUnitsInCylinder = Spring.GetUnitsInCylinder
local spGetGroundHeight = Spring.GetGroundHeight
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spCreateUnit = Spring.CreateUnit
local spDestroyUnit = Spring.DestroyUnit
local spGiveOrderToUnit = Spring.GiveOrderToUnit
-- local spGiveOrderToUnit = function(...) return end
local spSendMessageToPlayer = Spring.SendMessageToPlayer
local spSetUnitArmored = Spring.SetUnitArmored
local spSetGameRulesParam = Spring.SetGameRulesParam
local spSetTeamResource = Spring.SetTeamResource
local spSetUnitRulesParam = Spring.SetUnitRulesParam
local spSetUnitNeutral = Spring.SetUnitNeutral

local MAP_X = Game.mapSizeX
local MAP_Z = Game.mapSizeZ
local commanderDefs = VFS.Include("luarules/configs/comDefIDs.lua") or {}
local SPAWN_FRAME = math.floor((spawnMinutes * 60 * FRAMES_PER_SECOND) + 0.5)
local WARNING_FRAME = math.max(0, SPAWN_FRAME - (WARNING_MINUTES * 60 * FRAMES_PER_SECOND))
local BOSS_TEAM_ENERGY_STORAGE = 90000000
local BOSS_TEAM_METAL_STORAGE = 9000000
local RESOURCE_TOPUP_FRAMES = FRAMES_PER_SECOND
local HEALTH_PARAM_UPDATE_FRAMES = 15
-- Armor is a permanent enraged phase after the boss drops to 40% HP.
local FINAL_BOSS_HP_MULT = 21
local FINAL_BOSS_SHIELD_HEALTH_FRACTION = 0.40

local bossUnitID
local bossTeamID
local bossUnits = {}
local devReplacedBossUnits = {}
local bossPhase = PHASE_CORE
local bossSpawned = false
local bossSpawnFrame = -1
local phase2SpawnFrame = -1
local phase2Pending = false
local bossAlive = false
local bossState = STATE_COUNTDOWN
local bossMode
local targetAllyTeamID
local targetTeamID
local targetX
local targetY
local targetZ
local targetClearsArea = false
local targetClearX
local targetClearZ
local targetArea = {}
local targetStage = TARGET_STAGE_BASE
local middleRoamTopAllyTeamID
local middleRoamSecondAllyTeamID
local middleRoamStartedFrame = 0
local middleRoamLeg = 0
local middleRoamEdgeLeg = 0
local middleRoamInEdgePhase = false
local nextRetargetFrame = 0
local nextOrderRefreshFrame = 0
local nextProgressCheckFrame = 0
local lastProgressFrame = 0
local lastProgressX
local lastProgressZ
local nextResourceTopupFrame = 0
local nextHealthParamFrame = 0
local shieldActive = false
local devMode = false
local attackerClass = ATTACKER_UNKNOWN
local attackerFrame = -1
local attackerDamageByClass = {}

local bossRuntime = {
	contexts = {
		darkDeus = {
			key = "dark_deus",
			phase = PHASE_DARK_DEUS,
			targetArea = {},
		},
		core = {
			key = "core",
			phase = PHASE_CORE,
			targetArea = {},
			weakVariant = true,
		},
	},
	eventResolved = false,
	eventSpawned = false,
	eventCancelled = false,
	actualSpawnFrame = -1,
	gameID = "",
	fallbackTS = {
		players = {},
		teams = {},
	},
}
bossRuntime.order = {
	bossRuntime.contexts.darkDeus,
	bossRuntime.contexts.core,
}

local function setBossRuleParam(key, value)
	local context = bossRuntime.active
	if context then
		spSetGameRulesParam("final_boss_" .. context.key .. "_" .. key, value)
		if context == bossRuntime.contexts.darkDeus then
			spSetGameRulesParam("final_boss_" .. key, value)
		end
		return
	end
	spSetGameRulesParam("final_boss_" .. key, value)
end

function bossRuntime.load(context)
	bossRuntime.active = context
	bossUnitID = context.unitID
	bossTeamID = context.teamID
	bossPhase = context.phase or PHASE_CORE
	bossSpawned = context.spawned == true
	bossSpawnFrame = context.spawnFrame or -1
	phase2SpawnFrame = context.phase2SpawnFrame or -1
	phase2Pending = context.phase2Pending == true
	bossAlive = context.alive == true
	bossState = context.state or STATE_COUNTDOWN
	bossMode = context.mode
	targetAllyTeamID = context.targetAllyTeamID
	targetTeamID = context.targetTeamID
	targetX = context.targetX
	targetY = context.targetY
	targetZ = context.targetZ
	targetClearsArea = context.targetClearsArea == true
	targetClearX = context.targetClearX
	targetClearZ = context.targetClearZ
	targetArea = context.targetArea or {}
	context.targetArea = targetArea
	targetStage = context.targetStage or TARGET_STAGE_BASE
	middleRoamTopAllyTeamID = context.middleRoamTopAllyTeamID
	middleRoamSecondAllyTeamID = context.middleRoamSecondAllyTeamID
	middleRoamStartedFrame = context.middleRoamStartedFrame or 0
	middleRoamLeg = context.middleRoamLeg or 0
	middleRoamEdgeLeg = context.middleRoamEdgeLeg or 0
	middleRoamInEdgePhase = context.middleRoamInEdgePhase == true
	nextRetargetFrame = context.nextRetargetFrame or 0
	nextOrderRefreshFrame = context.nextOrderRefreshFrame or 0
	nextProgressCheckFrame = context.nextProgressCheckFrame or 0
	lastProgressFrame = context.lastProgressFrame or 0
	lastProgressX = context.lastProgressX
	lastProgressZ = context.lastProgressZ
	nextResourceTopupFrame = context.nextResourceTopupFrame or 0
	nextHealthParamFrame = context.nextHealthParamFrame or 0
	shieldActive = context.shieldActive == true
	attackerClass = context.attackerClass or ATTACKER_UNKNOWN
	attackerFrame = context.attackerFrame or -1
	attackerDamageByClass = context.attackerDamageByClass or {}
	context.attackerDamageByClass = attackerDamageByClass
end

function bossRuntime.capture(context)
	context.unitID = bossUnitID
	context.teamID = bossTeamID
	context.phase = bossPhase
	context.spawned = bossSpawned
	context.spawnFrame = bossSpawnFrame
	context.phase2SpawnFrame = phase2SpawnFrame
	context.phase2Pending = phase2Pending
	context.alive = bossAlive
	context.state = bossState
	context.mode = bossMode
	context.targetAllyTeamID = targetAllyTeamID
	context.targetTeamID = targetTeamID
	context.targetX = targetX
	context.targetY = targetY
	context.targetZ = targetZ
	context.targetClearsArea = targetClearsArea
	context.targetClearX = targetClearX
	context.targetClearZ = targetClearZ
	context.targetArea = targetArea
	context.targetStage = targetStage
	context.middleRoamTopAllyTeamID = middleRoamTopAllyTeamID
	context.middleRoamSecondAllyTeamID = middleRoamSecondAllyTeamID
	context.middleRoamStartedFrame = middleRoamStartedFrame
	context.middleRoamLeg = middleRoamLeg
	context.middleRoamEdgeLeg = middleRoamEdgeLeg
	context.middleRoamInEdgePhase = middleRoamInEdgePhase
	context.nextRetargetFrame = nextRetargetFrame
	context.nextOrderRefreshFrame = nextOrderRefreshFrame
	context.nextProgressCheckFrame = nextProgressCheckFrame
	context.lastProgressFrame = lastProgressFrame
	context.lastProgressX = lastProgressX
	context.lastProgressZ = lastProgressZ
	context.nextResourceTopupFrame = nextResourceTopupFrame
	context.nextHealthParamFrame = nextHealthParamFrame
	context.shieldActive = shieldActive
	context.attackerClass = attackerClass
	context.attackerFrame = attackerFrame
	context.attackerDamageByClass = attackerDamageByClass
end

local function getBossUnitName(phase)
	return FINAL_BOSS_UNITS[phase or bossPhase] or FINAL_BOSS_UNITS[PHASE_CORE]
end

local function setDevMode(enabled)
	devMode = enabled and true or false
	setBossRuleParam("devmode", devMode and 1 or 0)
end

local function canUseDevMode(playerID)
	if playerID ~= 0 then
		if spSendMessageToPlayer then
			spSendMessageToPlayer(playerID, "Final Boss dev mode is host-only.")
		end
		return false
	end
	if not spIsCheatingEnabled or not spIsCheatingEnabled() then
		if spSendMessageToPlayer then
			spSendMessageToPlayer(playerID, "Final Boss dev mode requires /cheat.")
		end
		setDevMode(false)
		return false
	end
	return true
end

local function toggleDevMode(cmd, line, words, playerID)
	if not canUseDevMode(playerID) then
		return true
	end
	setDevMode(not devMode)
	if spSendMessageToPlayer then
		spSendMessageToPlayer(playerID, "Final Boss dev mode " .. (devMode and "enabled." or "disabled."))
	end
	return true
end

local function isTeamDead(teamID)
	if not spGetTeamInfo then
		return false
	end
	local info = spGetTeamInfo(teamID)
	if type(info) == "table" then
		return info.isDead == true or info.isDead == 1
	end
	local isDead = select(3, spGetTeamInfo(teamID))
	return isDead == true or isDead == 1
end

local function unitCost(unitDefID)
	local ud = unitDefID and UnitDefs[unitDefID]
	if not ud then
		return 0
	end
	local metal = ud.metalCost or ud.buildCostMetal or ud.buildcostmetal or 0
	local energy = ud.energyCost or ud.buildCostEnergy or ud.buildcostenergy or 0
	return (metal or 0) + ((energy or 0) / 60)
end

local function teamHasLiveUnits(teamID)
	local units = spGetTeamUnits(teamID)
	return units and units[1] ~= nil
end

local function getTeamAllyTeamID(teamID)
	if not teamID then
		return nil
	end
	if spGetTeamAllyTeamID then
		return spGetTeamAllyTeamID(teamID)
	end
	if not spGetTeamInfo then
		return nil
	end
	local info = spGetTeamInfo(teamID, false)
	if type(info) == "table" then
		return info.allyTeam or info.allyTeamID
	end
	return select(6, spGetTeamInfo(teamID, false))
end

local function getTeamProducedMetalEquivalent(teamID)
	if not spGetTeamStatsHistory then
		return 0
	end
	local range = spGetTeamStatsHistory(teamID)
	if not range or range <= 0 then
		return 0
	end
	local history = spGetTeamStatsHistory(teamID, range)
	if not history then
		return 0
	end
	local latest = history[#history]
	if not latest then
		return 0
	end
	return (latest.metalProduced or 0) + ((latest.energyProduced or 0) / 60)
end

local function getNonGaiaTeams(allyTeamID)
	local gaiaTeamID = spGetGaiaTeamID()
	local teams = {}
	local teamList
	if allyTeamID ~= nil then
		teamList = spGetTeamList(allyTeamID) or {}
	else
		teamList = spGetTeamList() or {}
	end
	for _, teamID in ipairs(teamList) do
		if teamID ~= gaiaTeamID then
			teams[#teams + 1] = teamID
		end
	end
	return teams
end

local function getCandidateTeams(allyTeamID)
	local teams = getNonGaiaTeams(allyTeamID)
	local candidates = {}
	for i = 1, #teams do
		local teamID = teams[i]
		if not isTeamDead(teamID) and teamHasLiveUnits(teamID) then
			candidates[#candidates + 1] = teamID
		end
	end
	return candidates
end

local function scoreIsBetter(allyTeamID, score, bestAllyTeamID, bestScore)
	if not bestAllyTeamID then
		return true
	end
	if score ~= bestScore then
		return score > bestScore
	end
	return allyTeamID < bestAllyTeamID
end

local function getAllyTeamEcoLeaders()
	local teams = getNonGaiaTeams()
	if #teams == 0 then
		return nil
	end

	local scores = {}
	local allyTeamIDs = {}
	local aliveAllyTeams = {}
	for i = 1, #teams do
		local teamID = teams[i]
		local allyTeamID = getTeamAllyTeamID(teamID)
		if allyTeamID then
			if not scores[allyTeamID] then
				allyTeamIDs[#allyTeamIDs + 1] = allyTeamID
				scores[allyTeamID] = 0
			end
			scores[allyTeamID] = (scores[allyTeamID] or 0) + getTeamProducedMetalEquivalent(teamID)
			if not isTeamDead(teamID) and teamHasLiveUnits(teamID) then
				aliveAllyTeams[allyTeamID] = true
			end
		end
	end

	local topAllyTeamID, topScore
	local secondAllyTeamID, secondScore
	for i = 1, #allyTeamIDs do
		local allyTeamID = allyTeamIDs[i]
		if aliveAllyTeams[allyTeamID] then
			local score = scores[allyTeamID]
			if scoreIsBetter(allyTeamID, score, topAllyTeamID, topScore) then
				secondAllyTeamID = topAllyTeamID
				secondScore = topScore
				topAllyTeamID = allyTeamID
				topScore = score
			elseif scoreIsBetter(allyTeamID, score, secondAllyTeamID, secondScore) then
				secondAllyTeamID = allyTeamID
				secondScore = score
			end
		end
	end

	return topAllyTeamID, topScore or 0, secondAllyTeamID, secondScore or 0
end

function bossRuntime.parsePlayerSkill(playerOptions)
	if type(playerOptions) ~= "table" then
		return nil
	end
	local skillText = playerOptions.skill
	return skillText and tonumber(tostring(skillText):match("%d+%.?%d*"))
end

function bossRuntime.getFallbackTS(cache, entityType, entityID)
	local fallbackTS = cache[entityID]
	if fallbackTS then
		return fallbackTS
	end

	local hash = 5381
	local hashText = (bossRuntime.gameID or "") .. ":" .. entityType .. ":" .. tostring(entityID)
	for i = 1, #hashText do
		hash = ((hash * 33) + string.byte(hashText, i)) % 2147483647
	end
	hash = ((hash * 48271) + 12820163) % 2147483647
	local fallbackRange = DUAL_BOSS_CONFIG.fallbackMaxTS - DUAL_BOSS_CONFIG.fallbackMinTS + 1
	fallbackTS = DUAL_BOSS_CONFIG.fallbackMinTS + (hash % fallbackRange)
	cache[entityID] = fallbackTS
	Spring.Echo("Final Boss: assigned fallback TS", fallbackTS, "to", entityType, entityID)
	return fallbackTS
end

function bossRuntime.teamHasAI(teamID)
	if not spGetTeamInfo then
		return false
	end
	local teamInfo, _, _, hasAI = spGetTeamInfo(teamID, false)
	if type(teamInfo) == "table" then
		hasAI = teamInfo.hasAI or teamInfo.isAI
	end
	return hasAI == true or hasAI == 1
end

function bossRuntime.shouldUseFallbackTS()
	if bossRuntime.useFallbackTS ~= nil then
		return bossRuntime.useFallbackTS
	end
	if not Spring.GetPlayerList or not Spring.GetPlayerInfo then
		bossRuntime.useFallbackTS = true
		return true
	end

	local players = Spring.GetPlayerList(-1, true) or {}
	for i = 1, #players do
		local _, active, spectator, _, _, _, _, _, _, _, playerOptions = Spring.GetPlayerInfo(players[i], true)
		if active and not spectator and bossRuntime.parsePlayerSkill(playerOptions) then
			bossRuntime.useFallbackTS = false
			return false
		end
	end
	bossRuntime.useFallbackTS = true
	Spring.Echo(
		"Final Boss: no reported player TS found; using deterministic fallback TS range",
		DUAL_BOSS_CONFIG.fallbackMinTS,
		DUAL_BOSS_CONFIG.fallbackMaxTS
	)
	return true
end

function bossRuntime.initializeFallbackTS()
	if bossRuntime.fallbackTS.initialized then
		return
	end
	bossRuntime.fallbackTS.initialized = true

	local players = Spring.GetPlayerList and Spring.GetPlayerList(-1, true) or {}
	for i = 1, #players do
		local playerID = players[i]
		local _, active, spectator = Spring.GetPlayerInfo(playerID, false)
		if active and not spectator then
			bossRuntime.getFallbackTS(bossRuntime.fallbackTS.players, "player", playerID)
		end
	end

	local teams = getNonGaiaTeams()
	for i = 1, #teams do
		local teamID = teams[i]
		if bossRuntime.teamHasAI(teamID) then
			bossRuntime.getFallbackTS(bossRuntime.fallbackTS.teams, "AI team", teamID)
		end
	end
end

function bossRuntime.allyTeamHasEligibleParticipant(allyTeamID)
	if not allyTeamID or not Spring.GetPlayerList or not Spring.GetPlayerInfo then
		return false
	end
	local useFallbackTS = bossRuntime.shouldUseFallbackTS()
	if useFallbackTS then
		bossRuntime.initializeFallbackTS()
	end
	local teams = getCandidateTeams(allyTeamID)
	local fallbackCandidateCache
	local fallbackCandidateID
	local fallbackCandidateType
	local fallbackCandidateTS
	for i = 1, #teams do
		local teamID = teams[i]
		local players = Spring.GetPlayerList(teamID, true) or {}
		for j = 1, #players do
			local playerID = players[j]
			local _, active, spectator, playerTeamID, _, _, _, _, _, _, playerOptions = Spring.GetPlayerInfo(playerID, true)
			if active and not spectator and playerTeamID == teamID then
				local skill = bossRuntime.parsePlayerSkill(playerOptions)
				if not skill and useFallbackTS then
					skill = bossRuntime.fallbackTS.players[playerID]
				end
				if skill and skill >= DUAL_BOSS_CONFIG.minPlayerTS then
					return true
				end
				if useFallbackTS and skill and (not fallbackCandidateTS or skill > fallbackCandidateTS) then
					fallbackCandidateCache = bossRuntime.fallbackTS.players
					fallbackCandidateID = playerID
					fallbackCandidateType = "player"
					fallbackCandidateTS = skill
				end
			end
		end
		if useFallbackTS and bossRuntime.teamHasAI(teamID) then
			local skill = bossRuntime.fallbackTS.teams[teamID]
			if skill and skill >= DUAL_BOSS_CONFIG.minPlayerTS then
				return true
			end
			if skill and (not fallbackCandidateTS or skill > fallbackCandidateTS) then
				fallbackCandidateCache = bossRuntime.fallbackTS.teams
				fallbackCandidateID = teamID
				fallbackCandidateType = "AI team"
				fallbackCandidateTS = skill
			end
		end
	end
	if useFallbackTS and fallbackCandidateCache then
		local eligibleRange = DUAL_BOSS_CONFIG.fallbackMaxTS - DUAL_BOSS_CONFIG.minPlayerTS + 1
		local promotedTS = DUAL_BOSS_CONFIG.minPlayerTS + (fallbackCandidateTS % eligibleRange)
		fallbackCandidateCache[fallbackCandidateID] = promotedTS
		Spring.Echo(
			"Final Boss: promoted fallback TS",
			fallbackCandidateTS,
			"to",
			promotedTS,
			"for",
			fallbackCandidateType,
			fallbackCandidateID,
			"to guarantee local boss testing"
		)
		return true
	end
	return false
end

local function getEcoAdvantage(topScore, secondScore)
	if not secondScore or secondScore <= 0 then
		if topScore and topScore > 0 then
			return math.huge
		end
		return 0
	end
	return ((topScore or 0) - secondScore) / secondScore
end

local function isForceAttackActive(frame)
	if not frame or bossSpawnFrame < 0 then
		return false
	end
	return frame - bossSpawnFrame >= ECO_FORCE_ATTACK_DELAY_FRAMES
end

local function isBuildingDef(ud)
	return ud and ud.isBuilding == true
end

local function isSurfaceTargetDef(ud)
	local categories = ud and ud.modCategories
	if not categories then
		return true
	end
	return categories.surface == true
end

local function isBossAttackableBuildingDef(ud)
	return isBuildingDef(ud) and isSurfaceTargetDef(ud)
end

local function isBossAttackableEnergyBuildingDef(ud)
	return isBossAttackableBuildingDef(ud) and (ud.energyMake or 0) > 0
end

local function getUnitCost(unitID)
	return unitCost(spGetUnitDefID(unitID))
end

local function getUnitPositionWithGround(unitID)
	local x, y, z = spGetUnitPosition(unitID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z
	end
	return nil
end

local getTargetClearRadius
local getBossWeaponRange
local bossDistanceToTarget
local retargetLiveTargetAreaBuilding
local baseCluster = {}

local function getMostProductiveEnergyBuildingPosition(allyTeamID)
	local teams = getCandidateTeams(allyTeamID)
	local bestUnitID
	local bestTeamID
	local bestCost
	local bestEnergyMake

	for t = 1, #teams do
		local teamID = teams[t]
		local units = spGetTeamUnits(teamID)
		if units then
			for i = 1, #units do
				local unitID = units[i]
				local defID = spGetUnitDefID(unitID)
				local ud = defID and UnitDefs[defID]
				if isBossAttackableEnergyBuildingDef(ud) then
					local cost = getUnitCost(unitID)
					local energyMake = ud.energyMake or 0
					if not bestEnergyMake
						or energyMake > bestEnergyMake
						or (energyMake == bestEnergyMake and cost > bestCost)
						or (energyMake == bestEnergyMake and cost == bestCost and unitID < bestUnitID)
					then
						bestUnitID = unitID
						bestTeamID = teamID
						bestCost = cost
						bestEnergyMake = energyMake
					end
				end
			end
		end
	end

	if bestUnitID then
		local x, y, z = getUnitPositionWithGround(bestUnitID)
		if x and z then
			return x, y, z, true, bestTeamID
		end
	end
	return nil
end

function baseCluster.getLinkRange()
	local radius = getTargetClearRadius and getTargetClearRadius() or (FALLBACK_BOSS_WEAPON_RANGE * TARGET_CLEAR_RANGE_MULT)
	local linkRange = radius * BASE_CLUSTER_CONFIG.linkRangeMult
	if linkRange < BASE_CLUSTER_CONFIG.minLinkRange then
		return BASE_CLUSTER_CONFIG.minLinkRange
	end
	return linkRange
end

function baseCluster.addBuilding(cluster, building)
	cluster.members[#cluster.members + 1] = building
	cluster.totalX = cluster.totalX + building.x
	cluster.totalY = cluster.totalY + building.y
	cluster.totalZ = cluster.totalZ + building.z
	cluster.cost = cluster.cost + building.cost
	cluster.count = cluster.count + 1
	if not cluster.teams[building.teamID] then
		cluster.teams[building.teamID] = true
		cluster.teamCount = cluster.teamCount + 1
		if not cluster.representativeTeamID or building.teamID < cluster.representativeTeamID then
			cluster.representativeTeamID = building.teamID
		end
	end
end

function baseCluster.create(building)
	local cluster = {
		members = {},
		teams = {},
		teamCount = 0,
		totalX = 0,
		totalY = 0,
		totalZ = 0,
		cost = 0,
		count = 0,
	}
	baseCluster.addBuilding(cluster, building)
	return cluster
end

function baseCluster.buildingLinks(building, cluster, linkRangeSq)
	for i = 1, #cluster.members do
		local member = cluster.members[i]
		local dx = building.x - member.x
		local dz = building.z - member.z
		if (dx * dx) + (dz * dz) <= linkRangeSq then
			return true
		end
	end
	return false
end

function baseCluster.merge(target, source)
	for i = 1, #source.members do
		baseCluster.addBuilding(target, source.members[i])
	end
end

function baseCluster.getTeamBaseStartPosition(teamID)
	local x, _, z = spGetTeamStartPosition(teamID)
	if x and z and x >= 0 and z >= 0 and x <= MAP_X and z <= MAP_Z then
		return x, z
	end
	return nil
end

function baseCluster.collectBuildings(allyTeamID)
	local teams = getCandidateTeams(allyTeamID)
	local buildings = {}
	local fallbackBuildings = {}
	local baseRange = baseCluster.getLinkRange()
	local baseRangeSq = baseRange * baseRange

	for t = 1, #teams do
		local teamID = teams[t]
		local startX, startZ = baseCluster.getTeamBaseStartPosition(teamID)
		local units = spGetTeamUnits(teamID)
		if units then
			for i = 1, #units do
				local unitID = units[i]
				local defID = spGetUnitDefID(unitID)
				if isBossAttackableBuildingDef(defID and UnitDefs[defID]) then
					local x, y, z = spGetUnitPosition(unitID)
					if x and z then
						local building = {
							unitID = unitID,
							teamID = teamID,
							x = x,
							y = y or spGetGroundHeight(x, z) or 0,
							z = z,
							cost = getUnitCost(unitID),
						}
						fallbackBuildings[#fallbackBuildings + 1] = building
						if not startX then
							buildings[#buildings + 1] = building
						else
							local dx = x - startX
							local dz = z - startZ
							if (dx * dx) + (dz * dz) <= baseRangeSq then
								buildings[#buildings + 1] = building
							end
						end
					end
				end
			end
		end
	end
	if #buildings == 0 then
		return fallbackBuildings
	end
	return buildings
end

function baseCluster.finalize(cluster)
	if not cluster or cluster.count <= 0 then
		return nil
	end

	cluster.x = cluster.totalX / cluster.count
	cluster.y = cluster.totalY / cluster.count
	cluster.z = cluster.totalZ / cluster.count

	local radius = 0
	for i = 1, #cluster.members do
		local member = cluster.members[i]
		local dx = member.x - cluster.x
		local dz = member.z - cluster.z
		local distance = math.sqrt((dx * dx) + (dz * dz))
		if distance > radius then
			radius = distance
		end
	end

	local clearRadius = getTargetClearRadius and getTargetClearRadius() or (FALLBACK_BOSS_WEAPON_RANGE * TARGET_CLEAR_RANGE_MULT)
	if radius + BASE_CLUSTER_CONFIG.clearPadding > clearRadius then
		clearRadius = radius + BASE_CLUSTER_CONFIG.clearPadding
	end
	cluster.clearRadius = clearRadius
	return cluster
end

function baseCluster.isBetter(cluster, bestCluster)
	if not bestCluster then
		return true
	end
	if cluster.teamCount ~= bestCluster.teamCount then
		return cluster.teamCount > bestCluster.teamCount
	end
	if cluster.cost ~= bestCluster.cost then
		return cluster.cost > bestCluster.cost
	end
	if cluster.count ~= bestCluster.count then
		return cluster.count > bestCluster.count
	end
	return (cluster.representativeTeamID or math.huge) < (bestCluster.representativeTeamID or math.huge)
end

function baseCluster.select(allyTeamID)
	local buildings = baseCluster.collectBuildings(allyTeamID)
	if #buildings == 0 then
		return nil
	end

	local clusters = {}
	local linkRange = baseCluster.getLinkRange()
	local linkRangeSq = linkRange * linkRange

	for i = 1, #buildings do
		local building = buildings[i]
		local matchedCluster
		local clusterIndex = 1
		while clusterIndex <= #clusters do
			local cluster = clusters[clusterIndex]
			if baseCluster.buildingLinks(building, cluster, linkRangeSq) then
				if not matchedCluster then
					matchedCluster = cluster
					baseCluster.addBuilding(matchedCluster, building)
					clusterIndex = clusterIndex + 1
				else
					baseCluster.merge(matchedCluster, cluster)
					table.remove(clusters, clusterIndex)
				end
			else
				clusterIndex = clusterIndex + 1
			end
		end

		if not matchedCluster then
			clusters[#clusters + 1] = baseCluster.create(building)
		end
	end

	local bestCluster
	for i = 1, #clusters do
		local cluster = baseCluster.finalize(clusters[i])
		if cluster and baseCluster.isBetter(cluster, bestCluster) then
			bestCluster = cluster
		end
	end
	return bestCluster
end

function baseCluster.getCentroid(allyTeamID)
	local cluster = baseCluster.select(allyTeamID)
	if cluster then
		return cluster.x, cluster.y, cluster.z
	end
	return nil
end

local function getMostExpensiveUnitPosition(allyTeamID)
	local teams = getCandidateTeams(allyTeamID)
	local bestUnitID
	local bestTeamID
	local bestCost = -1

	for t = 1, #teams do
		local teamID = teams[t]
		local units = spGetTeamUnits(teamID)
		if units then
			for i = 1, #units do
				local unitID = units[i]
				local defID = spGetUnitDefID(unitID)
				local cost = unitCost(defID)
				if cost > bestCost then
					bestCost = cost
					bestUnitID = unitID
					bestTeamID = teamID
				end
			end
		end
	end

	if bestUnitID then
		local x, y, z = spGetUnitPosition(bestUnitID)
		if x and z then
			return x, y, z, bestTeamID
		end
	end
	return nil
end

local function getFirstUnitPosition(allyTeamID)
	local teams = getCandidateTeams(allyTeamID)
	for t = 1, #teams do
		local teamID = teams[t]
		local units = spGetTeamUnits(teamID)
		if units and units[1] then
			local x, y, z = spGetUnitPosition(units[1])
			if x and z then
				return x, y, z, teamID
			end
		end
	end
	return nil
end

local function getFallbackTargetPosition(allyTeamID)
	if not allyTeamID then
		return nil
	end

	local cluster = baseCluster.select(allyTeamID)
	if cluster then
		return cluster.x, cluster.y or spGetGroundHeight(cluster.x, cluster.z), cluster.z, true,
			cluster.representativeTeamID, cluster.x, cluster.z, cluster.clearRadius, cluster.teams
	end

	local x, y, z
	local teamID
	x, y, z, teamID = getMostExpensiveUnitPosition(allyTeamID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z, false, teamID
	end

	x, y, z, teamID = getFirstUnitPosition(allyTeamID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z, false, teamID
	end

	local teams = getCandidateTeams(allyTeamID)
	for i = 1, #teams do
		teamID = teams[i]
		x, y, z = spGetTeamStartPosition(teamID)
		if x and z and x >= 0 and z >= 0 then
			return x, y or spGetGroundHeight(x, z), z, false, teamID
		end
	end

	return nil
end

local function getBaseTargetPosition(allyTeamID)
	if not allyTeamID then
		return nil
	end

	local cluster = baseCluster.select(allyTeamID)
	if cluster then
		return cluster.x, cluster.y or spGetGroundHeight(cluster.x, cluster.z), cluster.z, true,
			cluster.representativeTeamID, cluster.x, cluster.z, cluster.clearRadius, cluster.teams
	end

	return getFallbackTargetPosition(allyTeamID)
end

local function getAttackTargetPosition(allyTeamID)
	if not allyTeamID then
		return nil
	end

	local x, y, z, clearsArea, teamID, clearX, clearZ, clearRadius, areaTeams
	if targetStage == TARGET_STAGE_BASE then
		x, y, z, clearsArea, teamID, clearX, clearZ, clearRadius, areaTeams = getBaseTargetPosition(allyTeamID)
		if x and z then
			return x, y, z, clearsArea, teamID, clearX, clearZ, clearRadius, areaTeams
		end
	end

	x, y, z, clearsArea, teamID = getMostProductiveEnergyBuildingPosition(allyTeamID)
	if x and z then
		return x, y, z, clearsArea, teamID
	end

	return getFallbackTargetPosition(allyTeamID)
end

local function clampMapPosition(x, z)
	if x < 0 then
		x = 0
	elseif x > MAP_X then
		x = MAP_X
	end
	if z < 0 then
		z = 0
	elseif z > MAP_Z then
		z = MAP_Z
	end
	return x, z
end

local function getAllyTeamStartCenter(allyTeamID)
	if not allyTeamID then
		return MAP_X * 0.5, MAP_Z * 0.5
	end

	local teams = getCandidateTeams(allyTeamID)
	local totalX, totalZ = 0, 0
	local count = 0

	for i = 1, #teams do
		local x, z = baseCluster.getTeamBaseStartPosition(teams[i])
		if x and z then
			totalX = totalX + x
			totalZ = totalZ + z
			count = count + 1
		end
	end

	if count > 0 then
		return totalX / count, totalZ / count
	end

	if spGetAllyTeamStartBox then
		local xMin, zMin, xMax, zMax = spGetAllyTeamStartBox(allyTeamID)
		if xMin and zMin and xMax and zMax and xMin < xMax and zMin < zMax then
			return (xMin + xMax) * 0.5, (zMin + zMax) * 0.5
		end
	end

	local x, _, z = baseCluster.getCentroid(allyTeamID)
	if x and z then
		return x, z
	end

	return MAP_X * 0.5, MAP_Z * 0.5
end

local function getMiddleRoamCenter()
	local topX, topZ = getAllyTeamStartCenter(middleRoamTopAllyTeamID)
	if not middleRoamSecondAllyTeamID then
		return topX, topZ
	end

	local secondX, secondZ = getAllyTeamStartCenter(middleRoamSecondAllyTeamID)
	return (topX + secondX) * 0.5, (topZ + secondZ) * 0.5
end

local function getAllyTeamBaseCenter(allyTeamID)
	local x, _, z = baseCluster.getCentroid(allyTeamID)
	if x and z then
		return x, z
	end
	return getAllyTeamStartCenter(allyTeamID)
end

function bossRuntime.getDualSpawnPositions(allyTeamID)
	local centerX = MAP_X * 0.5
	local centerZ = MAP_Z * 0.5
	local baseX, baseZ = getAllyTeamBaseCenter(allyTeamID)
	local dx = baseX - centerX
	local dz = baseZ - centerZ
	local length = math.sqrt((dx * dx) + (dz * dz))
	local anchorX = centerX + (dx * DUAL_BOSS_CONFIG.spawnBaseFraction)
	local anchorZ = centerZ + (dz * DUAL_BOSS_CONFIG.spawnBaseFraction)
	local perpendicularX = 1
	local perpendicularZ = 0
	if length > 1 then
		perpendicularX = -dz / length
		perpendicularZ = dx / length
	end
	local halfSeparation = DUAL_BOSS_CONFIG.spawnSeparation * 0.5
	local darkX, darkZ = clampMapPosition(
		anchorX + (perpendicularX * halfSeparation),
		anchorZ + (perpendicularZ * halfSeparation)
	)
	local coreX, coreZ = clampMapPosition(
		anchorX - (perpendicularX * halfSeparation),
		anchorZ - (perpendicularZ * halfSeparation)
	)
	return darkX, darkZ, coreX, coreZ
end

local function getBaseEdgePoint(allyTeamID)
	if not allyTeamID then
		return MAP_X * 0.5, MAP_Z * 0.5
	end

	local centerX, centerZ = getMiddleRoamCenter()
	local baseX, baseZ = getAllyTeamBaseCenter(allyTeamID)
	local dx = baseX - centerX
	local dz = baseZ - centerZ
	local length = math.sqrt((dx * dx) + (dz * dz))
	local radius = getBossWeaponRange() * MIDDLE_ROAM_EDGE_RANGE_MULT

	if length <= 1 then
		return clampMapPosition(baseX, baseZ)
	end

	local x = baseX - ((dx / length) * radius)
	local z = baseZ - ((dz / length) * radius)
	return clampMapPosition(x, z)
end

local function getMiddleRoamPoint(frame)
	local centerX, centerZ = getMiddleRoamCenter()
	if frame - middleRoamStartedFrame < MIDDLE_ROAM_DURATION_FRAMES then
		local radius = math.max(TARGET_REACHED_RADIUS, getTargetClearRadius())
		local leg = middleRoamLeg % 4
		local x, z = centerX, centerZ
		if leg == 0 then
			x = centerX + radius
		elseif leg == 1 then
			z = centerZ + radius
		elseif leg == 2 then
			x = centerX - radius
		else
			z = centerZ - radius
		end
		return clampMapPosition(x, z)
	end

	if not middleRoamInEdgePhase then
		middleRoamInEdgePhase = true
		middleRoamEdgeLeg = 0
	end

	local edgeAllyTeamID = middleRoamTopAllyTeamID
	if middleRoamEdgeLeg % 2 == 0 or not middleRoamSecondAllyTeamID then
		edgeAllyTeamID = middleRoamTopAllyTeamID
	else
		edgeAllyTeamID = middleRoamSecondAllyTeamID
	end
	return getBaseEdgePoint(edgeAllyTeamID)
end

local function getBossHpFraction()
	if not bossSpawned then
		return 1
	end
	if not bossAlive then
		return 0
	end
	if not bossUnitID or not spGetUnitHealth then
		return 1
	end
	local health, maxHealth = spGetUnitHealth(bossUnitID)
	if not health or not maxHealth or maxHealth <= 0 then
		return 1
	end
	local fraction = health / maxHealth
	if fraction < 0 then
		return 0
	end
	if fraction > 1 then
		return 1
	end
	return fraction
end

local function isStaticDef(ud)
	if not ud then
		return false
	end
	if ud.isBuilding then
		return true
	end
	if ud.canFly then
		return false
	end
	return (ud.speed or ud.maxSpeed or ud.maxVelocity or 0) <= 0
end

local function isArtilleryWeapon(weaponID)
	local wd = weaponID and WeaponDefs and WeaponDefs[weaponID]
	if not wd then
		return false
	end
	return (wd.range or 0) >= 1000
end

local function classifyAttacker(unitDefID, weaponID)
	local ud = unitDefID and UnitDefs[unitDefID]
	if not ud then
		return ATTACKER_UNKNOWN
	end
	if commanderDefs[unitDefID] or (ud.customParams and ud.customParams.iscommander) then
		return ATTACKER_COMMANDER
	end
	if ud.isBomberAirUnit then
		return ATTACKER_AIR
	end
	if (ud.minWaterDepth or 0) > 0 and (ud.waterline or 0) > 10 then
		return ATTACKER_NAVAL
	end
	if isStaticDef(ud) then
		return ATTACKER_STATIC
	end
	if isArtilleryWeapon(weaponID) then
		return ATTACKER_ARTILLERY
	end
	if ud.isBuilder or ud.canAssist or ud.canReclaim or (ud.buildOptions and ud.buildOptions[1]) then
		return ATTACKER_BUILDER
	end
	return ATTACKER_GROUND
end

local function setBossAttackerClass(classID, frame)
	if not classID then
		classID = ATTACKER_UNKNOWN
	end
	attackerClass = classID
	attackerFrame = frame or spGetGameFrame()
	setBossRuleParam("attacker_class", attackerClass)
	setBossRuleParam("attacker_frame", attackerFrame)
end

local function clearBossAttackerDamage()
	attackerDamageByClass = {}
	setBossAttackerClass(ATTACKER_UNKNOWN, -1)
end

local function addBossAttackerDamage(classID, damage, frame)
	if not classID or classID == ATTACKER_UNKNOWN or not damage or damage <= 0 then
		return
	end
	attackerDamageByClass[classID] = (attackerDamageByClass[classID] or 0) + damage
	local bestClass = attackerClass
	local bestDamage = bestClass and (attackerDamageByClass[bestClass] or 0) or 0
	if attackerDamageByClass[classID] > bestDamage then
		setBossAttackerClass(classID, frame)
	end
end

local function updateBossHealthParam()
	setBossRuleParam("hp_fraction", getBossHpFraction())
end

local function updateHudParams()
	setBossRuleParam("spawned", bossSpawned and 1 or 0)
	setBossRuleParam("alive", bossAlive and 1 or 0)
	setBossRuleParam("unit_id", bossUnitID or -1)
	setBossRuleParam("target_team", targetTeamID or -1)
	setBossRuleParam("state", bossState)
	setBossRuleParam("phase", bossPhase)
	setBossRuleParam("phase2_spawn_frame", phase2SpawnFrame)
	setBossRuleParam("phase2_pending", phase2Pending and 1 or 0)
	updateBossHealthParam()
end

function bossRuntime.getHpFraction(context)
	if not context.spawned then
		return 1
	end
	if not context.alive or not context.unitID then
		return 0
	end
	local health, maxHealth = spGetUnitHealth(context.unitID)
	if not health or not maxHealth or maxHealth <= 0 then
		return 1
	end
	return math.max(0, math.min(1, health / maxHealth))
end

function bossRuntime.publishContext(context)
	local prefix = "final_boss_" .. context.key .. "_"
	spSetGameRulesParam(prefix .. "spawned", context.spawned and 1 or 0)
	spSetGameRulesParam(prefix .. "alive", context.alive and 1 or 0)
	spSetGameRulesParam(prefix .. "unit_id", context.unitID or -1)
	spSetGameRulesParam(prefix .. "target_team", context.targetTeamID or -1)
	spSetGameRulesParam(prefix .. "state", context.state or STATE_COUNTDOWN)
	spSetGameRulesParam(prefix .. "phase", context.phase)
	spSetGameRulesParam(prefix .. "hp_fraction", bossRuntime.getHpFraction(context))
	spSetGameRulesParam(prefix .. "shield_active", context.shieldActive and 1 or 0)
	spSetGameRulesParam(prefix .. "shield_frame", context.shieldFrame or -1)
	spSetGameRulesParam(prefix .. "attacker_class", context.attackerClass or ATTACKER_UNKNOWN)
	spSetGameRulesParam(prefix .. "attacker_frame", context.attackerFrame or -1)
end

function bossRuntime.publishEvent()
	local aliveCount = 0
	for i = 1, #bossRuntime.order do
		local context = bossRuntime.order[i]
		bossRuntime.publishContext(context)
		if context.alive then
			aliveCount = aliveCount + 1
		end
	end

	local selected = bossRuntime.contexts.darkDeus
	if not selected.alive and bossRuntime.contexts.core.alive then
		selected = bossRuntime.contexts.core
	end
	spSetGameRulesParam("final_boss_spawned", bossRuntime.eventSpawned and 1 or 0)
	spSetGameRulesParam("final_boss_alive", aliveCount > 0 and 1 or 0)
	spSetGameRulesParam("final_boss_alive_count", aliveCount)
	spSetGameRulesParam("final_boss_total_count", 2)
	spSetGameRulesParam("final_boss_dual", bossRuntime.eventSpawned and 1 or 0)
	spSetGameRulesParam("final_boss_cancelled", bossRuntime.eventCancelled and 1 or 0)
	spSetGameRulesParam("final_boss_unit_id", selected.unitID or -1)
	spSetGameRulesParam("final_boss_target_team", selected.targetTeamID or -1)
	local eventState = STATE_COUNTDOWN
	if bossRuntime.eventSpawned then
		eventState = aliveCount > 0 and (selected.state or STATE_FIGHT) or STATE_DEAD
	end
	spSetGameRulesParam("final_boss_state", eventState)
	spSetGameRulesParam("final_boss_phase", selected.phase or PHASE_DARK_DEUS)
	spSetGameRulesParam("final_boss_hp_fraction", bossRuntime.getHpFraction(selected))
	spSetGameRulesParam("final_boss_shield_active", selected.shieldActive and 1 or 0)
	spSetGameRulesParam("final_boss_shield_frame", selected.shieldFrame or -1)
	spSetGameRulesParam("final_boss_attacker_class", selected.attackerClass or ATTACKER_UNKNOWN)
	spSetGameRulesParam("final_boss_attacker_frame", selected.attackerFrame or -1)
	spSetGameRulesParam("final_boss_actual_spawn_frame", bossRuntime.actualSpawnFrame)
	spSetGameRulesParam("final_boss_phase2_pending", 0)
	spSetGameRulesParam("final_boss_phase2_spawn_frame", bossRuntime.actualSpawnFrame)
end

getBossWeaponRange = function()
	local unitDef = UnitDefNames and UnitDefNames[getBossUnitName()]
	if unitDef and unitDef.maxWeaponRange and unitDef.maxWeaponRange > 0 then
		return unitDef.maxWeaponRange
	end

	local bestRange = 0
	local weapons = unitDef and unitDef.weapons
	if weapons and WeaponDefs then
		for i = 1, #weapons do
			local weaponDefID = weapons[i].weaponDef
			local weaponDef = weaponDefID and WeaponDefs[weaponDefID]
			local range = weaponDef and weaponDef.range
			if range and range > bestRange then
				bestRange = range
			end
		end
	end

	if bestRange > 0 then
		return bestRange
	end
	return FALLBACK_BOSS_WEAPON_RANGE
end

getTargetClearRadius = function()
	return getBossWeaponRange() * TARGET_CLEAR_RANGE_MULT
end

local function copyTeamSet(teamSet)
	if not teamSet then
		return nil
	end
	local result = {}
	local count = 0
	for teamID in pairs(teamSet) do
		result[teamID] = true
		count = count + 1
	end
	if count > 0 then
		return result
	end
	return nil
end

local function getCurrentTargetAreaRadius()
	local defaultRadius = getTargetClearRadius()
	if targetArea.radius and targetArea.radius > defaultRadius then
		return targetArea.radius
	end
	return defaultRadius
end

local function unitMatchesCurrentTarget(unitTeamID)
	if not unitTeamID then
		return false
	end
	if targetArea.teams then
		return targetArea.teams[unitTeamID] == true
	end
	if targetAllyTeamID then
		return getTeamAllyTeamID(unitTeamID) == targetAllyTeamID
	end
	return unitTeamID == targetTeamID
end

local function getTargetAreaAnchor()
	return targetClearX or targetX, targetClearZ or targetZ
end

local function targetAreaHasLiveBuilding()
	local anchorX, anchorZ = getTargetAreaAnchor()
	if not anchorX or not anchorZ or not spGetUnitsInCylinder then
		return false
	end

	local units = spGetUnitsInCylinder(anchorX, anchorZ, getCurrentTargetAreaRadius())
	if not units then
		return false
	end

	for i = 1, #units do
		local unitID = units[i]
		local unitTeamID = spGetUnitTeam(unitID)
		if unitMatchesCurrentTarget(unitTeamID) then
			local defID = spGetUnitDefID(unitID)
			if isBossAttackableBuildingDef(defID and UnitDefs[defID]) then
				local health = spGetUnitHealth(unitID)
				if health and health > 0 then
					return true
				end
			end
		end
	end
	return false
end

local function getLiveTargetAreaBuilding(minTargetDistance)
	local anchorX, anchorZ = getTargetAreaAnchor()
	if not targetX or not targetZ or not anchorX or not anchorZ or not spGetUnitsInCylinder then
		return nil
	end

	local units = spGetUnitsInCylinder(anchorX, anchorZ, getCurrentTargetAreaRadius())
	if not units then
		return nil
	end

	local bestX, bestY, bestZ, bestTeamID
	local bestDistance = -1
	minTargetDistance = minTargetDistance or 0
	for i = 1, #units do
		local unitID = units[i]
		local unitTeamID = spGetUnitTeam(unitID)
		if unitMatchesCurrentTarget(unitTeamID) then
			local defID = spGetUnitDefID(unitID)
			if isBossAttackableBuildingDef(defID and UnitDefs[defID]) then
				local health = spGetUnitHealth(unitID)
				if health and health > 0 then
					local x, y, z = getUnitPositionWithGround(unitID)
					if x and z then
						local dx = x - targetX
						local dz = z - targetZ
						local distance = math.sqrt(dx * dx + dz * dz)
						if distance >= minTargetDistance and distance > bestDistance then
							bestDistance = distance
							bestX = x
							bestY = y
							bestZ = z
							bestTeamID = unitTeamID
						end
					end
				end
			end
		end
	end

	return bestX, bestY, bestZ, bestTeamID
end

local function advanceTargetStage()
	if targetStage == TARGET_STAGE_BASE then
		targetStage = TARGET_STAGE_ENERGY
	end
end

local function ensureBossTeamResources(teamID)
	if not teamID or not spSetTeamResource then
		return
	end
	spSetTeamResource(teamID, "es", BOSS_TEAM_ENERGY_STORAGE)
	spSetTeamResource(teamID, "e", BOSS_TEAM_ENERGY_STORAGE)
	spSetTeamResource(teamID, "ms", BOSS_TEAM_METAL_STORAGE)
	spSetTeamResource(teamID, "m", BOSS_TEAM_METAL_STORAGE)
end

local function applyBossArmor(unitID)
	if not unitID or not spSetUnitArmored then
		return
	end
	local armorMultiple = 1 / FINAL_BOSS_HP_MULT
	if armorMultiple < 0.01 then
		armorMultiple = 0.01
	end
	pcall(spSetUnitArmored, unitID, true, armorMultiple)
end

local function setBossShieldActive(unitID, frame)
	if shieldActive then
		return
	end
	shieldActive = true
	if bossRuntime.active then
		bossRuntime.active.shieldFrame = frame
	end
	applyBossArmor(unitID)
	spSetUnitRulesParam(unitID, "final_boss_shield_active", 1, { public = true })
	setBossRuleParam("shield_active", 1)
	setBossRuleParam("shield_frame", frame)
end

local function updateBossShield(frame)
	if shieldActive or not bossUnitID or not spGetUnitHealth then
		return
	end
	local health, maxHealth = spGetUnitHealth(bossUnitID)
	if not health or not maxHealth or maxHealth <= 0 then
		return
	end
	if (health / maxHealth) <= FINAL_BOSS_SHIELD_HEALTH_FRACTION then
		setBossShieldActive(bossUnitID, frame)
	end
end

local function resetProgress(frame)
	lastProgressFrame = frame
	lastProgressX = nil
	lastProgressZ = nil
	if bossUnitID then
		local x, _, z = spGetUnitPosition(bossUnitID)
		if x and z then
			lastProgressX = x
			lastProgressZ = z
		end
	end
	nextProgressCheckFrame = frame + PROGRESS_CHECK_FRAMES
end

local function orderFight(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_FIGHT
	spGiveOrderToUnit(bossUnitID, CMD.FIGHT, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {})
	spGiveOrderToUnit(bossUnitID, CMD.MOVE_STATE, { 2 }, { "shift" })
	spGiveOrderToUnit(bossUnitID, CMD.IDLEMODE, { 0 }, {})
	nextOrderRefreshFrame = frame + ORDER_REFRESH_FRAMES
	updateHudParams()
end

local function orderForcedMove(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_FORCED_MOVE
	spGiveOrderToUnit(bossUnitID, CMD.MOVE, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {})
	nextOrderRefreshFrame = frame + ORDER_REFRESH_FRAMES
	updateHudParams()
end

local function setTargetPosition(teamID, allyTeamID, x, y, z, clearsArea, clearX, clearZ, clearRadius, areaTeams)
	targetAllyTeamID = allyTeamID
	targetTeamID = teamID
	targetX = x
	targetY = y or spGetGroundHeight(x, z)
	targetZ = z
	targetClearsArea = clearsArea and true or false
	if targetClearsArea then
		targetClearX = clearX or x
		targetClearZ = clearZ or z
		targetArea.radius = clearRadius
		targetArea.teams = copyTeamSet(areaTeams)
	else
		targetClearX = nil
		targetClearZ = nil
		targetArea.radius = nil
		targetArea.teams = nil
	end
	if bossUnitID then
		spSetUnitRulesParam(bossUnitID, "final_boss_target_team", targetTeamID or -1, { public = true })
	end
	updateHudParams()
end

local function resendMiddleRoamMove(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_MIDDLE_ROAM
	spGiveOrderToUnit(bossUnitID, CMD.MOVE, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {})
	spGiveOrderToUnit(bossUnitID, CMD.MOVE_STATE, { 2 }, { "shift" })
	nextOrderRefreshFrame = frame + ORDER_REFRESH_FRAMES
	updateHudParams()
end

local function orderMiddleRoam(frame, advance)
	if not bossUnitID or not middleRoamTopAllyTeamID then
		return
	end

	local edgePhase = frame - middleRoamStartedFrame >= MIDDLE_ROAM_DURATION_FRAMES
	if advance then
		if edgePhase then
			if middleRoamInEdgePhase then
				middleRoamEdgeLeg = middleRoamEdgeLeg + 1
			end
		else
			middleRoamLeg = middleRoamLeg + 1
		end
	end

	local x, z = getMiddleRoamPoint(frame)
	setTargetPosition(nil, nil, x, spGetGroundHeight(x, z), z, false)
	resendMiddleRoamMove(frame)
end

local function chooseBossMode(frame)
	local topAllyTeamID, topScore, secondAllyTeamID, secondScore = getAllyTeamEcoLeaders()
	if not topAllyTeamID then
		return nil
	end
	local context = bossRuntime.active
	if context and context.weakVariant then
		local lockedAllyTeamID = context.lockedTargetAllyTeamID
		if lockedAllyTeamID and #getCandidateTeams(lockedAllyTeamID) > 0 then
			return MODE_ATTACK, lockedAllyTeamID, secondAllyTeamID
		end
		context.lockedTargetAllyTeamID = topAllyTeamID
		return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
	end
	if bossPhase == PHASE_DARK_DEUS then
		return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
	end
	if not secondAllyTeamID then
		return MODE_ATTACK, topAllyTeamID, nil
	end

	local advantage = getEcoAdvantage(topScore, secondScore)
	if isForceAttackActive(frame) then
		return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
	end

	if not bossMode then
		if advantage >= ECO_ATTACK_ADVANTAGE then
			return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
		end
		return MODE_MIDDLE_ROAM, topAllyTeamID, secondAllyTeamID
	end

	if bossMode == MODE_ATTACK then
		if advantage <= ECO_ROAM_ADVANTAGE then
			return MODE_MIDDLE_ROAM, topAllyTeamID, secondAllyTeamID
		end
		if advantage < ECO_ATTACK_ADVANTAGE and targetAllyTeamID and #getCandidateTeams(targetAllyTeamID) > 0 then
			return MODE_ATTACK, targetAllyTeamID, secondAllyTeamID
		end
		return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
	end

	if advantage >= ECO_ATTACK_ADVANTAGE then
		return MODE_ATTACK, topAllyTeamID, secondAllyTeamID
	end
	return MODE_MIDDLE_ROAM, topAllyTeamID, secondAllyTeamID
end

local function enterMiddleRoam(frame, topAllyTeamID, secondAllyTeamID, force)
	local modeChanged = bossMode ~= MODE_MIDDLE_ROAM
	local teamsChanged = topAllyTeamID ~= middleRoamTopAllyTeamID or secondAllyTeamID ~= middleRoamSecondAllyTeamID
	bossMode = MODE_MIDDLE_ROAM
	middleRoamTopAllyTeamID = topAllyTeamID
	middleRoamSecondAllyTeamID = secondAllyTeamID
	if not force and not modeChanged and not teamsChanged and targetX and targetZ then
		return false
	end

	if modeChanged or force then
		middleRoamStartedFrame = frame
		middleRoamLeg = 0
		middleRoamEdgeLeg = 0
		middleRoamInEdgePhase = false
	end

	local x, z = getMiddleRoamPoint(frame)
	setTargetPosition(nil, nil, x, spGetGroundHeight(x, z), z, false)
	resetProgress(frame)
	return modeChanged or teamsChanged or force
end

local function enterAttackMode(frame, allyTeamID, force)
	local modeChanged = bossMode ~= MODE_ATTACK
	local allyChanged = allyTeamID ~= targetAllyTeamID
	if not force and not modeChanged and not allyChanged and targetX and targetZ then
		return false
	end
	if modeChanged or allyChanged or force then
		targetStage = TARGET_STAGE_BASE
	end

	local x, y, z, clearsArea, teamID, clearX, clearZ, clearRadius, areaTeams = getAttackTargetPosition(allyTeamID)
	if not x or not z then
		return false
	end

	bossMode = MODE_ATTACK
	local changed = modeChanged
		or allyChanged
		or math.abs((targetX or x) - x) > 200
		or math.abs((targetZ or z) - z) > 200
	setTargetPosition(teamID, allyTeamID, x, y, z, clearsArea, clearX, clearZ, clearRadius, areaTeams)

	if changed or force then
		resetProgress(frame)
		return true
	end
	return false
end

local function refreshTarget(frame, force)
	if not force and frame < nextRetargetFrame then
		return false
	end
	nextRetargetFrame = frame + RETARGET_INTERVAL_FRAMES

	local mode, topAllyTeamID, secondAllyTeamID = chooseBossMode(frame)
	if not mode then
		return false
	end

	if mode == MODE_MIDDLE_ROAM then
		return enterMiddleRoam(frame, topAllyTeamID, secondAllyTeamID, force)
	end
	return enterAttackMode(frame, topAllyTeamID, force)
end

local function refreshClearedTarget(frame)
	if bossMode ~= MODE_ATTACK or not targetClearsArea or not targetAllyTeamID then
		return false
	end
	if targetAreaHasLiveBuilding() then
		if retargetLiveTargetAreaBuilding and retargetLiveTargetAreaBuilding(frame) then
			return true
		end
		return false
	end

	advanceTargetStage()
	local x, y, z, clearsArea, teamID, clearX, clearZ, clearRadius, areaTeams = getAttackTargetPosition(targetAllyTeamID)
	if not x or not z then
		return false
	end

	setTargetPosition(teamID, targetAllyTeamID, x, y, z, clearsArea, clearX, clearZ, clearRadius, areaTeams)
	resetProgress(frame)
	return true
end

function bossRuntime.createUnit(unitName, preferredX, preferredZ, teamID)
	local offsets = {
		{ 0, 0 },
		{ 256, 0 },
		{ -256, 0 },
		{ 0, 256 },
		{ 0, -256 },
		{ 384, 384 },
		{ -384, 384 },
		{ 384, -384 },
		{ -384, -384 },
		{ 768, 0 },
		{ -768, 0 },
		{ 0, 768 },
		{ 0, -768 },
	}
	for i = 1, #offsets do
		local x, z = clampMapPosition(preferredX + offsets[i][1], preferredZ + offsets[i][2])
		local y = spGetGroundHeight(x, z)
		local unitID = spCreateUnit(unitName, x, y, z, "n", teamID)
		if unitID then
			return unitID, x, y, z
		end
	end
	return nil
end

function bossRuntime.applyWeakVariant(unitID, unitDef)
	local _, maxHealth = spGetUnitHealth(unitID)
	if maxHealth and maxHealth > 0 and Spring.SetUnitMaxHealth and Spring.SetUnitHealth then
		local reducedMaxHealth = math.max(1, math.floor((maxHealth * DUAL_BOSS_CONFIG.weakHpMult) + 0.5))
		Spring.SetUnitMaxHealth(unitID, reducedMaxHealth)
		Spring.SetUnitHealth(unitID, reducedMaxHealth)
	end

	local moveData = Spring.GetUnitMoveTypeData and Spring.GetUnitMoveTypeData(unitID)
	local baseSpeed = (moveData and moveData.maxSpeed) or (unitDef and unitDef.speed) or 0
	local moveCtrl = Spring.MoveCtrl
	if baseSpeed > 0 and moveCtrl and moveCtrl.SetGunshipMoveTypeData then
		local boostedSpeed = baseSpeed * DUAL_BOSS_CONFIG.weakSpeedMult
		moveCtrl.SetGunshipMoveTypeData(unitID, {
			maxSpeed = boostedSpeed,
			maxWantedSpeed = boostedSpeed,
		})
	end
	spSetUnitRulesParam(unitID, "final_boss_weak_variant", 1, { public = true })
end

local function spawnBossPhase(frame, phase, preferredX, preferredZ)
	local unitName = getBossUnitName(phase)
	local unitDef = UnitDefNames[unitName]
	if not unitDef then
		Spring.Echo("Final Boss: missing UnitDef " .. unitName)
		return false
	end

	bossPhase = phase or PHASE_CORE
	bossMode = nil
	targetAllyTeamID = nil
	targetTeamID = nil
	targetX = nil
	targetY = nil
	targetZ = nil
	targetClearsArea = false
	targetClearX = nil
	targetClearZ = nil
	targetArea.radius = nil
	targetArea.teams = nil
	targetStage = TARGET_STAGE_BASE
	nextRetargetFrame = 0

	if not refreshTarget(frame, true) then
		return false
	end

	local x = preferredX or (MAP_X * 0.5)
	local z = preferredZ or (MAP_Z * 0.5)
	local teamID = spGetGaiaTeamID()
	ensureBossTeamResources(teamID)
	local unitID, actualX, y, actualZ = bossRuntime.createUnit(unitName, x, z, teamID)
	if not unitID then
		Spring.Echo("Final Boss: failed to spawn " .. unitName)
		return false
	end
	x = actualX
	z = actualZ

	bossUnitID = unitID
	bossTeamID = teamID
	bossSpawned = true
	bossSpawnFrame = frame
	bossAlive = true
	bossState = (bossMode == MODE_MIDDLE_ROAM) and STATE_MIDDLE_ROAM or STATE_FIGHT
	shieldActive = false
	if bossRuntime.active then
		bossRuntime.active.shieldFrame = -1
	end
	clearBossAttackerDamage()
	nextResourceTopupFrame = frame + RESOURCE_TOPUP_FRAMES
	nextHealthParamFrame = frame + HEALTH_PARAM_UPDATE_FRAMES
	if spSetUnitNeutral then
		spSetUnitNeutral(unitID, false)
	end
	if bossRuntime.active and bossRuntime.active.weakVariant then
		bossRuntime.applyWeakVariant(unitID, unitDef)
	end
	spSetUnitRulesParam(unitID, "final_boss", 1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_phase", bossPhase, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_target_team", targetTeamID or -1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_shield_active", 0, { public = true })
	setBossRuleParam("actual_spawn_frame", frame)
	setBossRuleParam("phase", bossPhase)
	setBossRuleParam("shield_active", 0)
	setBossRuleParam("shield_frame", -1)
	if bossPhase == PHASE_DARK_DEUS then
		phase2Pending = false
		phase2SpawnFrame = frame
		setBossRuleParam("phase2_pending", 0)
		setBossRuleParam("phase2_spawn_frame", phase2SpawnFrame)
	end
	bossUnits[unitID] = bossRuntime.active or true
	updateHudParams()
	if bossMode == MODE_MIDDLE_ROAM then
		orderMiddleRoam(frame, false)
	else
		orderFight(frame)
	end
	return true
end

local function resetBossRuntimeState(frame, phase)
	if bossUnitID then
		bossUnits[bossUnitID] = nil
	end
	bossUnitID = nil
	bossTeamID = nil
	bossPhase = phase or PHASE_CORE
	bossSpawned = false
	bossSpawnFrame = -1
	phase2SpawnFrame = -1
	phase2Pending = false
	bossAlive = false
	bossState = STATE_COUNTDOWN
	bossMode = nil
	targetAllyTeamID = nil
	targetTeamID = nil
	targetX = nil
	targetY = nil
	targetZ = nil
	targetClearsArea = false
	targetClearX = nil
	targetClearZ = nil
	targetArea.radius = nil
	targetArea.teams = nil
	targetStage = TARGET_STAGE_BASE
	middleRoamTopAllyTeamID = nil
	middleRoamSecondAllyTeamID = nil
	middleRoamStartedFrame = 0
	middleRoamLeg = 0
	middleRoamEdgeLeg = 0
	middleRoamInEdgePhase = false
	nextRetargetFrame = 0
	nextOrderRefreshFrame = 0
	nextProgressCheckFrame = 0
	lastProgressFrame = frame or 0
	lastProgressX = nil
	lastProgressZ = nil
	nextResourceTopupFrame = 0
	nextHealthParamFrame = 0
	shieldActive = false
	if bossRuntime.active then
		bossRuntime.active.shieldFrame = -1
	end
	clearBossAttackerDamage()
	setBossRuleParam("actual_spawn_frame", -1)
	setBossRuleParam("shield_active", 0)
	setBossRuleParam("shield_frame", -1)
	updateHudParams()
end

function bossRuntime.resetContexts(frame)
	for i = 1, #bossRuntime.order do
		local context = bossRuntime.order[i]
		bossRuntime.load(context)
		resetBossRuntimeState(frame, context.phase)
		context.lockedTargetAllyTeamID = nil
		bossRuntime.capture(context)
	end
	bossRuntime.active = nil
end

function bossRuntime.removeAllBosses(frame)
	for i = 1, #bossRuntime.order do
		local context = bossRuntime.order[i]
		local unitID = context.unitID
		if unitID then
			devReplacedBossUnits[unitID] = true
			bossUnits[unitID] = nil
			if spDestroyUnit then
				spDestroyUnit(unitID, false, true)
			end
		end
	end
	bossRuntime.resetContexts(frame)
end

function bossRuntime.cancelEvent(frame)
	bossRuntime.removeAllBosses(frame)
	bossRuntime.eventResolved = true
	bossRuntime.eventSpawned = false
	bossRuntime.eventCancelled = true
	bossRuntime.actualSpawnFrame = -1
	bossRuntime.active = nil
	spSetGameRulesParam("final_boss_enabled", 0)
	bossRuntime.publishEvent()
end

function bossRuntime.spawnEvent(frame)
	local topAllyTeamID, _, secondAllyTeamID = getAllyTeamEcoLeaders()
	if not topAllyTeamID
		or not secondAllyTeamID
		or not bossRuntime.allyTeamHasEligibleParticipant(topAllyTeamID)
	then
		bossRuntime.cancelEvent(frame)
		return false
	end

	local darkX, darkZ, coreX, coreZ = bossRuntime.getDualSpawnPositions(topAllyTeamID)
	local darkContext = bossRuntime.contexts.darkDeus
	local coreContext = bossRuntime.contexts.core

	darkContext.lockedTargetAllyTeamID = nil
	bossRuntime.load(darkContext)
	local darkSpawned = spawnBossPhase(frame, PHASE_DARK_DEUS, darkX, darkZ)
	bossRuntime.capture(darkContext)

	coreContext.lockedTargetAllyTeamID = secondAllyTeamID
	bossRuntime.load(coreContext)
	local coreSpawned = spawnBossPhase(frame, PHASE_CORE, coreX, coreZ)
	bossRuntime.capture(coreContext)

	if not darkSpawned or not coreSpawned then
		bossRuntime.cancelEvent(frame)
		return false
	end

	bossRuntime.eventResolved = true
	bossRuntime.eventSpawned = true
	bossRuntime.eventCancelled = false
	bossRuntime.actualSpawnFrame = frame
	bossRuntime.active = nil
	bossRuntime.publishEvent()
	return true
end

local function replaceBossPhase(frame, phase)
	local oldUnitID = bossUnitID
	if oldUnitID and not spDestroyUnit then
		Spring.Echo("Final Boss: cannot replace boss because Spring.DestroyUnit is unavailable")
		return false
	end
	if oldUnitID then
		devReplacedBossUnits[oldUnitID] = true
	end
	resetBossRuntimeState(frame, phase)
	if oldUnitID then
		spDestroyUnit(oldUnitID, false, true)
	end
	return spawnBossPhase(frame, phase)
end

bossDistanceToTarget = function()
	if not bossUnitID or not targetX or not targetZ then
		return nil
	end
	local x, _, z = spGetUnitPosition(bossUnitID)
	if not x or not z then
		return nil
	end
	local dx = x - targetX
	local dz = z - targetZ
	return math.sqrt(dx * dx + dz * dz)
end

retargetLiveTargetAreaBuilding = function(frame, requireReached, minTargetDistance)
	if requireReached ~= false then
		local distance = bossDistanceToTarget()
		if not distance or distance > TARGET_REACHED_RADIUS then
			return false
		end
	end

	local clearX = targetClearX
	local clearZ = targetClearZ
	local clearRadius = targetArea.radius
	local areaTeams = targetArea.teams
	local x, y, z, teamID = getLiveTargetAreaBuilding(minTargetDistance or AREA_RETARGET_RADIUS)
	if not x or not z then
		return false
	end

	setTargetPosition(teamID, targetAllyTeamID, x, y, z, true, clearX, clearZ, clearRadius, areaTeams)
	resetProgress(frame)
	return true
end

local function updateMiddleRoam(frame)
	if bossMode ~= MODE_MIDDLE_ROAM then
		return false
	end

	local distance = bossDistanceToTarget()
	if distance and distance <= TARGET_REACHED_RADIUS then
		orderMiddleRoam(frame, true)
	elseif frame >= nextOrderRefreshFrame then
		resendMiddleRoamMove(frame)
	elseif bossState ~= STATE_MIDDLE_ROAM then
		resendMiddleRoamMove(frame)
	end
	return true
end

local function updateBoss(frame)
	if not bossAlive or not bossUnitID then
		return
	end
	if frame >= nextResourceTopupFrame then
		ensureBossTeamResources(bossTeamID or spGetGaiaTeamID())
		nextResourceTopupFrame = frame + RESOURCE_TOPUP_FRAMES
	end
	if frame >= nextHealthParamFrame then
		updateBossHealthParam()
		nextHealthParamFrame = frame + HEALTH_PARAM_UPDATE_FRAMES
	end
	if not spGetUnitDefID(bossUnitID) then
		bossAlive = false
		bossState = STATE_DEAD
		updateHudParams()
		return
	end
	updateBossShield(frame)

	if bossState == STATE_FORCED_MOVE then
		-- Attack-only bosses keep their assigned allyTeam current while forced-moving.
		if (bossPhase == PHASE_DARK_DEUS or (bossRuntime.active and bossRuntime.active.weakVariant))
			and refreshTarget(frame, false)
		then
			orderForcedMove(frame)
			return
		end

		local distance = bossDistanceToTarget()
		if distance and distance <= TARGET_REACHED_RADIUS then
			resetProgress(frame)
			orderFight(frame)
		elseif frame >= nextOrderRefreshFrame then
			orderForcedMove(frame)
		end
		return
	end

	local targetChanged = refreshTarget(frame, false)
	if targetChanged then
		if bossMode == MODE_MIDDLE_ROAM then
			orderMiddleRoam(frame, false)
		else
			orderFight(frame)
		end
		return
	end

	if updateMiddleRoam(frame) then
		return
	end

	if refreshClearedTarget(frame) then
		orderFight(frame)
		return
	end

	if frame >= nextOrderRefreshFrame then
		orderFight(frame)
	end

	if frame < nextProgressCheckFrame then
		return
	end
	nextProgressCheckFrame = frame + PROGRESS_CHECK_FRAMES

	local bossX, _, bossZ = spGetUnitPosition(bossUnitID)
	if not bossX or not bossZ then
		return
	end
	local dxToTarget = bossX - targetX
	local dzToTarget = bossZ - targetZ
	local distance = math.sqrt((dxToTarget * dxToTarget) + (dzToTarget * dzToTarget))
	if distance <= TARGET_REACHED_RADIUS then
		lastProgressFrame = frame
		lastProgressX = bossX
		lastProgressZ = bossZ
		return
	end
	if not lastProgressX or not lastProgressZ then
		lastProgressX = bossX
		lastProgressZ = bossZ
		lastProgressFrame = frame
		return
	end
	local dx = bossX - lastProgressX
	local dz = bossZ - lastProgressZ
	local movedDistance = math.sqrt((dx * dx) + (dz * dz))
	if movedDistance >= MIN_PROGRESS_POSITION_ELOS then
		lastProgressX = bossX
		lastProgressZ = bossZ
		lastProgressFrame = frame
		return
	end
	if frame - lastProgressFrame >= STALL_TIMEOUT_FRAMES then
		if targetClearsArea and retargetLiveTargetAreaBuilding and retargetLiveTargetAreaBuilding(frame, false, 0) then
			orderFight(frame)
			return
		end
		orderForcedMove(frame)
	end
end

function gadget:Initialize()
	bossRuntime.eventResolved = false
	bossRuntime.eventSpawned = false
	bossRuntime.eventCancelled = false
	bossRuntime.actualSpawnFrame = -1
	bossRuntime.resetContexts(0)
	setBossRuleParam("enabled", 1)
	setBossRuleParam("spawn_frame", SPAWN_FRAME)
	setBossRuleParam("warning_frame", WARNING_FRAME)
	setBossRuleParam("actual_spawn_frame", -1)
	setBossRuleParam("phase", PHASE_DARK_DEUS)
	setBossRuleParam("phase2_spawn_frame", -1)
	setBossRuleParam("phase2_pending", 0)
	setBossRuleParam("shield_active", 0)
	setBossRuleParam("shield_frame", -1)
	setDevMode(false)
	gadgetHandler:AddChatAction(DEV_MODE_CHAT_ACTION, toggleDevMode, " toggles Final Boss dev mode (requires cheats)")
	bossRuntime.publishEvent()
end

function gadget:Shutdown()
	gadgetHandler:RemoveChatAction(DEV_MODE_CHAT_ACTION)
end

function gadget:GameID(gameID)
	bossRuntime.gameID = gameID or ""
end

function gadget:GameFrame(frame)
	if devMode and (not spIsCheatingEnabled or not spIsCheatingEnabled()) then
		setDevMode(false)
	end
	if not bossRuntime.eventResolved and frame >= SPAWN_FRAME then
		bossRuntime.spawnEvent(frame)
	end
	if bossRuntime.eventSpawned then
		for i = 1, #bossRuntime.order do
			local context = bossRuntime.order[i]
			if context.alive then
				bossRuntime.load(context)
				updateBoss(frame)
				bossRuntime.capture(context)
			end
		end
		bossRuntime.active = nil
		bossRuntime.publishEvent()
	end
end

function gadget:RecvLuaMsg(msg, playerID)
	if msg ~= DEV_SPAWN_CORE_MSG and msg ~= DEV_SPAWN_DARK_DEUS_MSG then
		return false
	end
	if not canUseDevMode(playerID) or not devMode then
		return true
	end
	local frame = spGetGameFrame()
	local context
	if msg == DEV_SPAWN_CORE_MSG then
		context = bossRuntime.contexts.core
		local topAllyTeamID, _, secondAllyTeamID = getAllyTeamEcoLeaders()
		context.lockedTargetAllyTeamID = secondAllyTeamID or topAllyTeamID
	else
		context = bossRuntime.contexts.darkDeus
		context.lockedTargetAllyTeamID = nil
	end
	bossRuntime.load(context)
	local spawned = replaceBossPhase(frame, context.phase)
	bossRuntime.capture(context)
	bossRuntime.active = nil
	if spawned then
		bossRuntime.eventResolved = true
		bossRuntime.eventSpawned = true
		bossRuntime.eventCancelled = false
		if bossRuntime.actualSpawnFrame < 0 then
			bossRuntime.actualSpawnFrame = frame
		end
		spSetGameRulesParam("final_boss_enabled", 1)
	end
	bossRuntime.publishEvent()
	return true
end

function gadget:UnitDestroyed(unitID)
	if devReplacedBossUnits[unitID] then
		devReplacedBossUnits[unitID] = nil
		bossUnits[unitID] = nil
		return
	end
	local context = bossUnits[unitID]
	if type(context) == "table" then
		bossRuntime.load(context)
		bossUnits[unitID] = nil
		bossAlive = false
		bossUnitID = nil
		bossState = STATE_DEAD
		updateHudParams()
		bossRuntime.capture(context)
		bossRuntime.active = nil
		bossRuntime.publishEvent()
	end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
	local context = bossUnits[unitID]
	local bossDamageClass
	if type(context) == "table" then
		bossRuntime.load(context)
	end
	if context and unitTeam == bossTeamID and weaponID and WeaponDefs then
		local weaponDef = WeaponDefs[weaponID]
		if weaponDef and weaponDef.type == "DGun" then
			if type(context) == "table" then
				bossRuntime.capture(context)
				bossRuntime.active = nil
			end
			return 0, 1
		end
		if attackerTeam and attackerTeam ~= bossTeamID then
			bossDamageClass = classifyAttacker(attackerDefID, weaponID)
		end
	end

	if bossDamageClass then
		addBossAttackerDamage(bossDamageClass, damage, spGetGameFrame())
	end
	if type(context) == "table" then
		bossRuntime.capture(context)
		bossRuntime.active = nil
	end
	return damage, 1
end

function gadget:TeamDied(teamID)
	local allyTeamID = getTeamAllyTeamID(teamID)
	for i = 1, #bossRuntime.order do
		local context = bossRuntime.order[i]
		bossRuntime.load(context)
		if teamID == targetTeamID
			or allyTeamID == targetAllyTeamID
			or allyTeamID == middleRoamTopAllyTeamID
			or allyTeamID == middleRoamSecondAllyTeamID
		then
			nextRetargetFrame = 0
		end
		bossRuntime.capture(context)
	end
	bossRuntime.active = nil
end
