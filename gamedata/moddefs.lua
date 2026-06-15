local unitDefs = (DEFS and DEFS.unitDefs) or UnitDefs
if not unitDefs then
	if Spring.Echo then
		Spring.Echo("Final Boss moddefs skipped: missing unitDefs table")
	end
	return
end

local BOSS_UNIT = "core_core_boss"
local REFERENCE_UNIT = "talon_independence"
local DEFAULT_SPAWN_MINUTES = 60
local REFERENCE_SPAWN_MINUTES = 60
local WIN_COUNT_AT_30_MINUTES = 1.5
local LOSE_COUNT_MULT = 4 / 3
local BOSS_DUEL_DPS_USAGE = 0.25
local FINAL_BOSS_HP_MULT = 11
local FINAL_BOSS_SHIELD_HEALTH_FRACTION = 0.30

local modOptions = (Spring.GetModOptions and Spring.GetModOptions()) or {}
local spawnMinutes = tonumber(modOptions.mo_final_boss_spawn_minutes) or DEFAULT_SPAWN_MINUTES
local winIndependenceCount = WIN_COUNT_AT_30_MINUTES * (2 ^ ((spawnMinutes - 30) / 10))
local loseIndependenceCount = winIndependenceCount * LOSE_COUNT_MULT
local combatIndependenceCount = (winIndependenceCount + loseIndependenceCount) * 0.5
local referenceCombatCount = (WIN_COUNT_AT_30_MINUTES * (2 ^ ((REFERENCE_SPAWN_MINUTES - 30) / 10))) * ((1 + LOSE_COUNT_MULT) * 0.5)
local powerScale = combatIndependenceCount / referenceCombatCount

local function normalizeWeaponName(name)
	if type(name) ~= "string" then
		return nil
	end
	return string.lower(name)
end

local function getWeaponDefaultDamage(weaponDef)
	return weaponDef and weaponDef.damage and tonumber(weaponDef.damage.default) or 0
end

local function getWeaponReloadTime(weaponDef)
	local reloadTime = weaponDef and tonumber(weaponDef.reloadtime) or 1
	if reloadTime <= 0 then
		return 1
	end
	return reloadTime
end

local function calculateUnitDps(unitDef)
	if not unitDef or not unitDef.weapondefs or not unitDef.weapons then
		return 0
	end

	local dps = 0
	for _, weaponSlot in pairs(unitDef.weapons) do
		local weaponName = normalizeWeaponName(weaponSlot and weaponSlot.def)
		local weaponDef = weaponName and unitDef.weapondefs[weaponName]
		if weaponDef then
			dps = dps + (getWeaponDefaultDamage(weaponDef) / getWeaponReloadTime(weaponDef))
		end
	end
	return dps
end

local function scaleDamageTable(damageTable, scale)
	if not damageTable then
		return
	end
	for armorType, damage in pairs(damageTable) do
		if type(damage) == "number" then
			damageTable[armorType] = damage * scale
		end
	end
end

local function scaleUnitWeaponDamage(unitDef, scale)
	if not unitDef or not unitDef.weapondefs then
		return
	end
	for _, weaponDef in pairs(unitDef.weapondefs) do
		scaleDamageTable(weaponDef.damage, scale)
	end
end

local function getBossEffectiveHealthMult()
	local normalHealth = 1 - FINAL_BOSS_SHIELD_HEALTH_FRACTION
	local armoredHealth = FINAL_BOSS_SHIELD_HEALTH_FRACTION * FINAL_BOSS_HP_MULT
	return normalHealth + armoredHealth
end

local function applyFinalBossBalance()
	local bossDef = unitDefs[BOSS_UNIT]
	local referenceDef = unitDefs[REFERENCE_UNIT]
	if not bossDef or not referenceDef then
		if Spring.Echo then
			Spring.Echo("Final Boss moddefs skipped: missing unit", BOSS_UNIT, bossDef ~= nil, REFERENCE_UNIT, referenceDef ~= nil)
		end
		return
	end

	bossDef.customparams = bossDef.customparams or {}
	if bossDef.customparams.final_boss_moddefs_applied then
		return
	end

	local referenceHealth = tonumber(referenceDef.maxdamage) or 0
	local referenceDps = calculateUnitDps(referenceDef)
	local bossBaseDps = calculateUnitDps(bossDef)
	local bossDuelBaseDps = bossBaseDps * BOSS_DUEL_DPS_USAGE
	if referenceHealth <= 0 or referenceDps <= 0 or bossDuelBaseDps <= 0 then
		if Spring.Echo then
			Spring.Echo("Final Boss moddefs skipped: invalid stats", "referenceHealth", referenceHealth, "referenceDps", referenceDps, "bossBaseDps", bossBaseDps, "bossDuelBaseDps", bossDuelBaseDps)
		end
		return
	end

	local targetEffectiveHealth = referenceHealth * combatIndependenceCount
	local targetRawHealth = targetEffectiveHealth / getBossEffectiveHealthMult()
	local targetDps = referenceDps * combatIndependenceCount
	local damageScale = targetDps / bossDuelBaseDps
	local rawHealthScale = targetRawHealth / referenceHealth

	bossDef.maxdamage = math.floor(targetRawHealth + 0.5)
	bossDef.idleautoheal = (referenceDef.idleautoheal or bossDef.idleautoheal or 0) * rawHealthScale
	scaleUnitWeaponDamage(bossDef, damageScale)

	bossDef.customparams.final_boss_moddefs_applied = 1
	bossDef.customparams.final_boss_win_independence_count = winIndependenceCount
	bossDef.customparams.final_boss_lose_independence_count = loseIndependenceCount
	bossDef.customparams.final_boss_combat_independence_count = combatIndependenceCount
	bossDef.customparams.final_boss_target_independence_count = winIndependenceCount
	bossDef.customparams.final_boss_power_scale = powerScale
	bossDef.customparams.final_boss_target_effective_health = targetEffectiveHealth
	bossDef.customparams.final_boss_target_raw_health = bossDef.maxdamage
	bossDef.customparams.final_boss_target_dps = targetDps
	bossDef.customparams.final_boss_damage_scale = damageScale
	bossDef.customparams.final_boss_reference_dps = referenceDps
	bossDef.customparams.final_boss_base_dps = bossBaseDps
	bossDef.customparams.final_boss_duel_dps_usage = BOSS_DUEL_DPS_USAGE
	bossDef.customparams.final_boss_duel_base_dps = bossDuelBaseDps

	if Spring.Echo then
		Spring.Echo("Final Boss moddefs", "spawnMinutes", spawnMinutes, "rawHealth", bossDef.maxdamage, "targetDps", targetDps, "damageScale", damageScale)
	end
end

applyFinalBossBalance()
