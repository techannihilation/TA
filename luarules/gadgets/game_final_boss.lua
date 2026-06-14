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

local FINAL_BOSS_UNIT = "core_core"

local FRAMES_PER_SECOND = 30
local DEFAULT_SPAWN_MINUTES = 60
local MIN_SPAWN_MINUTES = 10
local WARNING_MINUTES = 10
local RETARGET_INTERVAL_FRAMES = 30 * FRAMES_PER_SECOND
local ORDER_REFRESH_FRAMES = 10 * FRAMES_PER_SECOND
local PROGRESS_CHECK_FRAMES = 5 * FRAMES_PER_SECOND
local STALL_TIMEOUT_FRAMES = 20 * FRAMES_PER_SECOND
local FORCED_MOVE_FRAMES = 30 * FRAMES_PER_SECOND
local MIN_PROGRESS_ELOS = 100
local TARGET_REACHED_RADIUS = 650

local STATE_COUNTDOWN = 0
local STATE_FIGHT = 1
local STATE_FORCED_MOVE = 2
local STATE_DEAD = 3

local ATTACKER_UNKNOWN = 0
local ATTACKER_COMMANDER = 1
local ATTACKER_AIR = 2
local ATTACKER_NAVAL = 3
local ATTACKER_STATIC = 4
local ATTACKER_ARTILLERY = 5
local ATTACKER_BUILDER = 6
local ATTACKER_GROUND = 7

local spGetGameFrame = Spring.GetGameFrame
local spGetGaiaTeamID = Spring.GetGaiaTeamID
local spGetTeamList = Spring.GetTeamList
local spGetTeamInfo = Spring.GetTeamInfo
local spGetTeamStatsHistory = Spring.GetTeamStatsHistory
local spGetTeamUnits = Spring.GetTeamUnits
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitNearestEnemy = Spring.GetUnitNearestEnemy
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitWeaponState = Spring.GetUnitWeaponState
local spGetGroundHeight = Spring.GetGroundHeight
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spCreateUnit = Spring.CreateUnit
local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spSendMessageToPlayer = Spring.SendMessageToPlayer
local spSetUnitArmored = Spring.SetUnitArmored
local spSetUnitHealth = Spring.SetUnitHealth
local spSetGameRulesParam = Spring.SetGameRulesParam
local spSetTeamResource = Spring.SetTeamResource
local spSetUnitRulesParam = Spring.SetUnitRulesParam
local spSetUnitNeutral = Spring.SetUnitNeutral

local MAP_X = Game.mapSizeX
local MAP_Z = Game.mapSizeZ
local random = math.random
local commanderDefs = VFS.Include("luarules/configs/comDefIDs.lua") or {}
local modOptions = (Spring.GetModOptions and Spring.GetModOptions()) or {}

local spawnMinutes = tonumber(modOptions.mo_final_boss_spawn_minutes) or DEFAULT_SPAWN_MINUTES
if spawnMinutes < MIN_SPAWN_MINUTES then
	spawnMinutes = MIN_SPAWN_MINUTES
end
local SPAWN_FRAME = math.floor((spawnMinutes * 60 * FRAMES_PER_SECOND) + 0.5)
local WARNING_FRAME = math.max(0, SPAWN_FRAME - (WARNING_MINUTES * 60 * FRAMES_PER_SECOND))
local BOSS_TEAM_ENERGY_STORAGE = 90000000
local BOSS_TEAM_METAL_STORAGE = 9000000
local RESOURCE_TOPUP_FRAMES = FRAMES_PER_SECOND
local HEALTH_PARAM_UPDATE_FRAMES = 15
local PRE_BOSS_COMMENT_INTERVAL_FRAMES = 3 * 60 * FRAMES_PER_SECOND
local FRONT_ENEMY_RANGE = 2500
local FINAL_BOSS_WEAPON_POLL_FRAMES = 5
local FINAL_BOSS_IDLE_REHEAL_TICK_FRAMES = FRAMES_PER_SECOND
local FINAL_BOSS_IDLE_REHEAL_DELAY_FRAMES = 10 * FRAMES_PER_SECOND
local FINAL_BOSS_IDLE_REHEAL_RATE = 0.0025
-- Armor is a permanent enraged phase after the boss drops to 30% HP.
-- Damage: Techno Lands final default 3.9, doubled for TA final boss pressure = 7.8
local FINAL_BOSS_HP_MULT = 20
local FINAL_BOSS_DAMAGE_MULT = 7.8
local FINAL_BOSS_SHIELD_HEALTH_FRACTION = 0.30

local bossUnitID
local bossTeamID
local bossUnits = {}
local bossSpawned = false
local bossAlive = false
local bossState = STATE_COUNTDOWN
local targetTeamID
local targetX
local targetY
local targetZ
local nextRetargetFrame = 0
local nextOrderRefreshFrame = 0
local nextProgressCheckFrame = 0
local forcedMoveUntilFrame = 0
local lastProgressFrame = 0
local lastProgressDistance
local nextResourceTopupFrame = 0
local nextHealthParamFrame = 0
local shieldActive = false
local devMode = false
local attackerClass = ATTACKER_UNKNOWN
local attackerFrame = -1
local attackerDamageByClass = {}
local nextPreBossCommentFrame = 0
local bossWeaponReloadFrames = {}
local bossWeaponCount = 0
local nextBossWeaponPollFrame = 0
local nextIdleRehealFrame = 0
local lastBossFiredFrame = 0
local lastBossDamagedFrame = 0

local function setBossRuleParam(key, value)
	spSetGameRulesParam("final_boss_" .. key, value)
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
		return info.isDead
	end
	return select(3, spGetTeamInfo(teamID))
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

local function getCandidateTeams()
	local gaiaTeamID = spGetGaiaTeamID()
	local teams = {}
	for _, teamID in ipairs(spGetTeamList()) do
		if teamID ~= gaiaTeamID and not isTeamDead(teamID) and teamHasLiveUnits(teamID) then
			teams[#teams + 1] = teamID
		end
	end
	return teams
end

local function pickRichestTeam()
	local teams = getCandidateTeams()
	if #teams == 0 then
		return nil
	end

	local bestTeamID
	local bestScore = -1
	local tiedBestCount = 0
	for i = 1, #teams do
		local teamID = teams[i]
		local score = getTeamProducedMetalEquivalent(teamID)
		if score > bestScore then
			bestTeamID = teamID
			bestScore = score
			tiedBestCount = 1
		elseif score == bestScore then
			tiedBestCount = tiedBestCount + 1
			if random(tiedBestCount) == 1 then
				bestTeamID = teamID
			end
		end
	end
	return bestTeamID
end

local function isBuildingDef(ud)
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

local function getTeamBuildingCentroid(teamID)
	local units = spGetTeamUnits(teamID)
	if not units then
		return nil
	end
	local totalX, totalY, totalZ = 0, 0, 0
	local count = 0
	for i = 1, #units do
		local unitID = units[i]
		local defID = spGetUnitDefID(unitID)
		if isBuildingDef(defID and UnitDefs[defID]) then
			local x, y, z = spGetUnitPosition(unitID)
			if x and z then
				totalX = totalX + x
				totalY = totalY + (y or spGetGroundHeight(x, z) or 0)
				totalZ = totalZ + z
				count = count + 1
			end
		end
	end
	if count > 0 then
		return totalX / count, totalY / count, totalZ / count
	end
	return nil
end

local function getMostExpensiveUnitPosition(teamID)
	local units = spGetTeamUnits(teamID)
	if not units then
		return nil
	end
	local bestUnitID
	local bestCost = -1
	for i = 1, #units do
		local unitID = units[i]
		local defID = spGetUnitDefID(unitID)
		local cost = unitCost(defID)
		if cost > bestCost then
			bestCost = cost
			bestUnitID = unitID
		end
	end
	if bestUnitID then
		return spGetUnitPosition(bestUnitID)
	end
	return nil
end

local function getFirstUnitPosition(teamID)
	local units = spGetTeamUnits(teamID)
	if units and units[1] then
		return spGetUnitPosition(units[1])
	end
	return nil
end

local function getTargetPosition(teamID)
	if not teamID then
		return nil
	end

	local x, y, z = spGetTeamStartPosition(teamID)
	if x and z and x >= 0 and z >= 0 then
		return x, y or spGetGroundHeight(x, z), z
	end

	x, y, z = getTeamBuildingCentroid(teamID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z
	end

	x, y, z = getMostExpensiveUnitPosition(teamID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z
	end

	x, y, z = getFirstUnitPosition(teamID)
	if x and z then
		return x, y or spGetGroundHeight(x, z), z
	end

	return nil
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
	if ud.canFly then
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

local function getPrimaryWeaponDefID(ud)
	if not ud or not ud.weapons then
		return nil
	end
	if ud.primaryWeapon and ud.weapons[ud.primaryWeapon] then
		return ud.weapons[ud.primaryWeapon].weaponDef
	end
	for i = 1, #ud.weapons do
		if ud.weapons[i] and ud.weapons[i].weaponDef then
			return ud.weapons[i].weaponDef
		end
	end
	return nil
end

local function isMobileCombatUnitDef(unitDefID)
	local ud = unitDefID and UnitDefs[unitDefID]
	if not ud then
		return false
	end
	if commanderDefs[unitDefID] or (ud.customParams and ud.customParams.iscommander) then
		return true
	end
	if isStaticDef(ud) or not ud.weapons or #ud.weapons == 0 then
		return false
	end
	if ud.isBuilder or ud.canAssist or ud.canReclaim or (ud.buildOptions and ud.buildOptions[1]) then
		return false
	end
	return true
end

local function classifyFrontUnit(unitDefID)
	local ud = unitDefID and UnitDefs[unitDefID]
	return classifyAttacker(unitDefID, getPrimaryWeaponDefID(ud))
end

local function pickPreBossCommentClass()
	local teams = getCandidateTeams()
	local bestFrontClass = ATTACKER_UNKNOWN
	local bestFrontCost = -1
	local bestFallbackClass = ATTACKER_UNKNOWN
	local bestFallbackCost = -1
	for i = 1, #teams do
		local units = spGetTeamUnits(teams[i])
		if units then
			for j = 1, #units do
				local unitID = units[j]
				local defID = spGetUnitDefID(unitID)
				if isMobileCombatUnitDef(defID) then
					local cost = unitCost(defID)
					if cost > bestFallbackCost then
						bestFallbackCost = cost
						bestFallbackClass = classifyFrontUnit(defID)
					end
					if spGetUnitNearestEnemy and cost > bestFrontCost and spGetUnitNearestEnemy(unitID, FRONT_ENEMY_RANGE, false) then
						bestFrontCost = cost
						bestFrontClass = classifyFrontUnit(defID)
					end
				end
			end
		end
	end
	if bestFrontCost >= 0 then
		return bestFrontClass
	end
	return bestFallbackClass
end

local function updatePreBossComment(frame)
	if bossSpawned or frame < WARNING_FRAME or frame < nextPreBossCommentFrame then
		return
	end
	setBossRuleParam("pre_spawn_comment_class", pickPreBossCommentClass())
	setBossRuleParam("pre_spawn_comment_frame", frame)
	nextPreBossCommentFrame = frame + PRE_BOSS_COMMENT_INTERVAL_FRAMES
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
	updateBossHealthParam()
end

local function resetBossIdleRehealState(unitID, unitDef, frame)
	lastBossFiredFrame = frame
	lastBossDamagedFrame = frame
	nextBossWeaponPollFrame = frame + FINAL_BOSS_WEAPON_POLL_FRAMES
	nextIdleRehealFrame = frame + FINAL_BOSS_IDLE_REHEAL_TICK_FRAMES
	bossWeaponReloadFrames = {}
	bossWeaponCount = 0

	if not unitID or not unitDef or not unitDef.weapons or not spGetUnitWeaponState then
		return
	end

	bossWeaponCount = #unitDef.weapons
	for weaponNum = 1, bossWeaponCount do
		bossWeaponReloadFrames[weaponNum] = spGetUnitWeaponState(unitID, weaponNum, "reloadFrame") or 0
	end
end

local function updateBossWeaponFireState(frame)
	if frame < nextBossWeaponPollFrame then
		return
	end
	nextBossWeaponPollFrame = frame + FINAL_BOSS_WEAPON_POLL_FRAMES

	if not bossUnitID or bossWeaponCount <= 0 or not spGetUnitWeaponState then
		return
	end

	for weaponNum = 1, bossWeaponCount do
		local reloadFrame = spGetUnitWeaponState(bossUnitID, weaponNum, "reloadFrame")
		if reloadFrame then
			local previousReloadFrame = bossWeaponReloadFrames[weaponNum]
			if previousReloadFrame and reloadFrame > previousReloadFrame and reloadFrame > frame then
				lastBossFiredFrame = frame
			end
			bossWeaponReloadFrames[weaponNum] = reloadFrame
		end
	end
end

local function updateBossIdleReheal(frame)
	if frame < nextIdleRehealFrame then
		return
	end
	nextIdleRehealFrame = frame + FINAL_BOSS_IDLE_REHEAL_TICK_FRAMES

	if not bossUnitID or not spGetUnitHealth or not spSetUnitHealth then
		return
	end

	local lastCombatFrame = lastBossFiredFrame
	if lastBossDamagedFrame > lastCombatFrame then
		lastCombatFrame = lastBossDamagedFrame
	end
	if frame - lastCombatFrame < FINAL_BOSS_IDLE_REHEAL_DELAY_FRAMES then
		return
	end

	local health, maxHealth = spGetUnitHealth(bossUnitID)
	if not health or not maxHealth or maxHealth <= 0 or health >= maxHealth then
		return
	end

	local healAmount = maxHealth * FINAL_BOSS_IDLE_REHEAL_RATE
	local newHealth = health + healAmount
	if newHealth > maxHealth then
		newHealth = maxHealth
	end
	spSetUnitHealth(bossUnitID, newHealth)
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
	lastProgressDistance = nil
	nextProgressCheckFrame = frame + PROGRESS_CHECK_FRAMES
end

local function orderFight(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_FIGHT
	forcedMoveUntilFrame = 0
	spGiveOrderToUnit(bossUnitID, CMD.FIGHT, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {})
	spGiveOrderToUnit(bossUnitID, CMD.MOVE_STATE, { 2 }, { "shift" })
	spGiveOrderToUnit(bossUnitID, CMD.FIRE_STATE, { 2 }, { "shift" })
	nextOrderRefreshFrame = frame + ORDER_REFRESH_FRAMES
	updateHudParams()
end

local function orderForcedMove(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_FORCED_MOVE
	forcedMoveUntilFrame = frame + FORCED_MOVE_FRAMES
	spGiveOrderToUnit(bossUnitID, CMD.MOVE, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {}, forcedMoveUntilFrame)
	updateHudParams()
end

local function refreshTarget(frame, force)
	if not force and frame < nextRetargetFrame then
		return false
	end
	nextRetargetFrame = frame + RETARGET_INTERVAL_FRAMES

	local newTargetTeamID = pickRichestTeam()
	local x, y, z = getTargetPosition(newTargetTeamID)
	if not newTargetTeamID or not x or not z then
		return false
	end

	local changed = newTargetTeamID ~= targetTeamID
		or math.abs((targetX or x) - x) > 200
		or math.abs((targetZ or z) - z) > 200
	targetTeamID = newTargetTeamID
	targetX = x
	targetY = y or spGetGroundHeight(x, z)
	targetZ = z
	updateHudParams()

	if changed or force then
		resetProgress(frame)
		return true
	end
	return false
end

local function spawnBoss(frame)
	local unitDef = UnitDefNames[FINAL_BOSS_UNIT]
	if not unitDef then
		Spring.Echo("Final Boss: missing UnitDef " .. FINAL_BOSS_UNIT)
		return
	end

	if not refreshTarget(frame, true) then
		return
	end

	local x = MAP_X * 0.5
	local z = MAP_Z * 0.5
	local y = spGetGroundHeight(x, z)
	local teamID = spGetGaiaTeamID()
	ensureBossTeamResources(teamID)
	local unitID = spCreateUnit(FINAL_BOSS_UNIT, x, y, z, "n", teamID)
	if not unitID then
		Spring.Echo("Final Boss: failed to spawn " .. FINAL_BOSS_UNIT)
		return
	end

	bossUnitID = unitID
	bossTeamID = teamID
	bossSpawned = true
	bossAlive = true
	bossState = STATE_FIGHT
	shieldActive = false
	clearBossAttackerDamage()
	resetBossIdleRehealState(unitID, UnitDefs[spGetUnitDefID(unitID)] or unitDef, frame)
	nextResourceTopupFrame = frame + RESOURCE_TOPUP_FRAMES
	nextHealthParamFrame = frame + HEALTH_PARAM_UPDATE_FRAMES
	if spSetUnitNeutral then
		spSetUnitNeutral(unitID, false)
	end
	spSetUnitRulesParam(unitID, "final_boss", 1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_target_team", targetTeamID or -1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_shield_active", 0, { public = true })
	setBossRuleParam("actual_spawn_frame", frame)
	setBossRuleParam("shield_active", 0)
	setBossRuleParam("shield_frame", -1)
	bossUnits[unitID] = {
		damageMult = FINAL_BOSS_DAMAGE_MULT,
	}
	updateHudParams()
	orderFight(frame)
end

local function bossDistanceToTarget()
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
	updateBossWeaponFireState(frame)
	updateBossShield(frame)
	updateBossIdleReheal(frame)

	local targetChanged = refreshTarget(frame, false)
	if targetChanged then
		spSetUnitRulesParam(bossUnitID, "final_boss_target_team", targetTeamID or -1, { public = true })
		orderFight(frame)
		return
	end

	if bossState == STATE_FORCED_MOVE then
		if frame >= forcedMoveUntilFrame then
			resetProgress(frame)
			orderFight(frame)
		end
		return
	end

	if frame >= nextOrderRefreshFrame then
		orderFight(frame)
	end

	if frame < nextProgressCheckFrame then
		return
	end
	nextProgressCheckFrame = frame + PROGRESS_CHECK_FRAMES

	local distance = bossDistanceToTarget()
	if not distance then
		return
	end
	if distance <= TARGET_REACHED_RADIUS then
		lastProgressFrame = frame
		lastProgressDistance = distance
		return
	end
	if not lastProgressDistance then
		lastProgressDistance = distance
		lastProgressFrame = frame
		return
	end
	if distance <= (lastProgressDistance - MIN_PROGRESS_ELOS) then
		lastProgressDistance = distance
		lastProgressFrame = frame
		return
	end
	if frame - lastProgressFrame >= STALL_TIMEOUT_FRAMES then
		orderForcedMove(frame)
	end
end

function gadget:Initialize()
	setBossRuleParam("enabled", 1)
	setBossRuleParam("spawn_frame", SPAWN_FRAME)
	setBossRuleParam("warning_frame", WARNING_FRAME)
	setBossRuleParam("actual_spawn_frame", -1)
	setBossAttackerClass(ATTACKER_UNKNOWN, -1)
	setBossRuleParam("pre_spawn_comment_class", ATTACKER_UNKNOWN)
	setBossRuleParam("pre_spawn_comment_frame", -PRE_BOSS_COMMENT_INTERVAL_FRAMES)
	setBossRuleParam("shield_active", 0)
	setBossRuleParam("shield_frame", -1)
	setDevMode(false)
	gadgetHandler:AddChatAction("devmode", toggleDevMode, " toggles Final Boss dev mode (requires cheats)")
	updateHudParams()
end

function gadget:Shutdown()
	gadgetHandler:RemoveChatAction("devmode")
end

function gadget:GameFrame(frame)
	if devMode and (not spIsCheatingEnabled or not spIsCheatingEnabled()) then
		setDevMode(false)
	end
	if not bossSpawned then
		updatePreBossComment(frame)
	end
	if not bossSpawned and frame >= SPAWN_FRAME then
		spawnBoss(frame)
	end
	updateBoss(frame)
end

function gadget:RecvLuaMsg(msg, playerID)
	if msg ~= "final_boss_dev:spawn_now" then
		return false
	end
	if not canUseDevMode(playerID) or not devMode then
		return true
	end
	if not bossSpawned then
		spawnBoss(spGetGameFrame())
	end
	return true
end

function gadget:UnitDestroyed(unitID)
	if unitID == bossUnitID then
		bossUnits[unitID] = nil
		bossAlive = false
		bossState = STATE_DEAD
		bossWeaponReloadFrames = {}
		bossWeaponCount = 0
		updateHudParams()
	end
end

function gadget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam)
	if unitID == bossUnitID and bossAlive and unitTeam == bossTeamID and attackerTeam and attackerTeam ~= bossTeamID and damage and damage > 0 then
		lastBossDamagedFrame = spGetGameFrame()
	end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
	local target = bossUnits[unitID]
	local bossDamageClass
	if target and unitTeam == bossTeamID and weaponID and WeaponDefs then
		local weaponDef = WeaponDefs[weaponID]
		if weaponDef and weaponDef.type == "DGun" then
			return 0, 1
		end
		if attackerTeam and attackerTeam ~= bossTeamID then
			bossDamageClass = classifyAttacker(attackerDefID, weaponID)
		end
	end

	local attacker = attackerID and bossUnits[attackerID]
	if attacker and attackerTeam == bossTeamID and unitTeam ~= bossTeamID then
		local damageMult = attacker.damageMult or 1
		if damageMult > 1 then
			damage = damage * damageMult
		end
	end
	if bossDamageClass then
		addBossAttackerDamage(bossDamageClass, damage, spGetGameFrame())
	end
	return damage, 1
end

function gadget:TeamDied(teamID)
	if teamID == targetTeamID then
		nextRetargetFrame = 0
	end
end
