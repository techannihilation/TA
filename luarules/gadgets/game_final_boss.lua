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
local DEFAULT_SPAWN_MINUTES = 90
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

local spGetGameFrame = Spring.GetGameFrame
local spGetGaiaTeamID = Spring.GetGaiaTeamID
local spGetTeamList = Spring.GetTeamList
local spGetTeamInfo = Spring.GetTeamInfo
local spGetTeamResources = Spring.GetTeamResources
local spGetTeamUnits = Spring.GetTeamUnits
local spGetTeamStartPosition = Spring.GetTeamStartPosition
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitPosition = Spring.GetUnitPosition
local spGetGroundHeight = Spring.GetGroundHeight
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spCreateUnit = Spring.CreateUnit
local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spSendMessageToPlayer = Spring.SendMessageToPlayer
local spSetUnitArmored = Spring.SetUnitArmored
local spSetGameRulesParam = Spring.SetGameRulesParam
local spSetTeamResource = Spring.SetTeamResource
local spSetUnitRulesParam = Spring.SetUnitRulesParam
local spSetUnitNeutral = Spring.SetUnitNeutral

local MAP_X = Game.mapSizeX
local MAP_Z = Game.mapSizeZ
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
-- Armor is a permanent enraged phase after the boss drops to 30% HP.
-- Damage: Techno Lands final default 3.9, doubled for TA final boss pressure = 7.8
local FINAL_BOSS_HP_MULT = 12
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
local shieldActive = false
local devMode = false

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

local function getResourceIncome(teamID, resourceName)
	local _, _, _, income = spGetTeamResources(teamID, resourceName)
	return income or 0
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

	local maxEnergyIncome = 0
	local maxMetalIncome = 0
	local incomeByTeam = {}
	for i = 1, #teams do
		local teamID = teams[i]
		local energyIncome = getResourceIncome(teamID, "energy")
		local metalIncome = getResourceIncome(teamID, "metal")
		incomeByTeam[teamID] = {
			energy = energyIncome,
			metal = metalIncome,
		}
		if energyIncome > maxEnergyIncome then
			maxEnergyIncome = energyIncome
		end
		if metalIncome > maxMetalIncome then
			maxMetalIncome = metalIncome
		end
	end

	local bestTeamID
	local bestScore = -1
	local bestRaw = -1
	for i = 1, #teams do
		local teamID = teams[i]
		local income = incomeByTeam[teamID]
		local energyScore = 0
		local metalScore = 0
		if maxEnergyIncome > 0 then
			energyScore = income.energy / maxEnergyIncome
		end
		if maxMetalIncome > 0 then
			metalScore = income.metal / maxMetalIncome
		end
		local score = (0.66 * energyScore) + (0.34 * metalScore)
		local raw = (0.66 * income.energy) + (0.34 * income.metal)
		if score > bestScore
			or (score == bestScore and raw > bestRaw)
			or (score == bestScore and raw == bestRaw and (not bestTeamID or teamID < bestTeamID))
		then
			bestTeamID = teamID
			bestScore = score
			bestRaw = raw
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

local function updateHudParams()
	setBossRuleParam("spawned", bossSpawned and 1 or 0)
	setBossRuleParam("alive", bossAlive and 1 or 0)
	setBossRuleParam("unit_id", bossUnitID or -1)
	setBossRuleParam("target_team", targetTeamID or -1)
	setBossRuleParam("state", bossState)
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
	--spGiveOrderToUnit(bossUnitID, CMD.FIGHT, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {})
	--spGiveOrderToUnit(bossUnitID, CMD.MOVE_STATE, { 2 }, { "shift" })
	--spGiveOrderToUnit(bossUnitID, CMD.FIRE_STATE, { 2 }, { "shift" })
	nextOrderRefreshFrame = frame + ORDER_REFRESH_FRAMES
	updateHudParams()
end

local function orderForcedMove(frame)
	if not bossUnitID or not targetX or not targetZ then
		return
	end
	bossState = STATE_FORCED_MOVE
	forcedMoveUntilFrame = frame + FORCED_MOVE_FRAMES
	--spGiveOrderToUnit(bossUnitID, CMD.MOVE, { targetX, targetY or spGetGroundHeight(targetX, targetZ), targetZ }, {}, forcedMoveUntilFrame)
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
	nextResourceTopupFrame = frame + RESOURCE_TOPUP_FRAMES
	if spSetUnitNeutral then
		spSetUnitNeutral(unitID, false)
	end
	spSetUnitRulesParam(unitID, "final_boss", 1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_target_team", targetTeamID or -1, { public = true })
	spSetUnitRulesParam(unitID, "final_boss_shield_active", 0, { public = true })
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
	if not spGetUnitDefID(bossUnitID) then
		bossAlive = false
		bossState = STATE_DEAD
		updateHudParams()
		return
	end
	updateBossShield(frame)

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
		updateHudParams()
	end
end

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
	local target = bossUnits[unitID]
	if target and unitTeam == bossTeamID and weaponID and WeaponDefs then
		local weaponDef = WeaponDefs[weaponID]
		if weaponDef and weaponDef.type == "DGun" then
			return 0, 1
		end
	end

	local attacker = attackerID and bossUnits[attackerID]
	if attacker and attackerTeam == bossTeamID and unitTeam ~= bossTeamID then
		local damageMult = attacker.damageMult or 1
		if damageMult > 1 then
			damage = damage * damageMult
		end
	end
	return damage, 1
end

function gadget:TeamDied(teamID)
	if teamID == targetTeamID then
		nextRetargetFrame = 0
	end
end
