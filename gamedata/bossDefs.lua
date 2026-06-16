local FINAL_BOSS_UNIT = "core_core_boss"
local BASE_SPAWN_MINUTES = 30
local DEFAULT_SPAWN_MINUTES = 30

local function getUnitDefs()
	if DEFS and DEFS.unitDefs then
		return DEFS.unitDefs
	end
	if UnitDefs then
		return UnitDefs
	end
	return nil
end

local function getSpawnMinutes()
	local modOptions = (Spring and Spring.GetModOptions and Spring.GetModOptions()) or {}
	return tonumber(modOptions.mo_final_boss_spawn_minutes) or DEFAULT_SPAWN_MINUTES
end

local function log(message)
	if Spring and Spring.Echo then
		Spring.Echo(message)
	end
end

local function scaleDamageTable(damage, scale)
	if type(damage) ~= "table" then
		return
	end
	for armorType, value in pairs(damage) do
		if type(value) == "number" then
			damage[armorType] = value * scale
		end
	end
end

if _G.FinalBossBossDefsApplied then
	return true
end

local unitDefs = getUnitDefs()
local bossDef = unitDefs and unitDefs[FINAL_BOSS_UNIT]
if not bossDef then
	log("Final Boss bossDefs: missing UnitDef " .. FINAL_BOSS_UNIT)
	return false
end

bossDef.customparams = bossDef.customparams or {}
if bossDef.customparams.final_boss_bossdefs_applied then
	_G.FinalBossBossDefsApplied = true
	return true
end

local spawnMinutes = getSpawnMinutes()
local timeScale = 1
if spawnMinutes > BASE_SPAWN_MINUTES then
	timeScale = 2 ^ ((spawnMinutes - BASE_SPAWN_MINUTES) / 10)
end

local damageScale = timeScale
if timeScale ~= 1 then
	bossDef.maxdamage = math.floor((bossDef.maxdamage or 0) * timeScale + 0.5)
	bossDef.idleautoheal = (bossDef.idleautoheal or 0) * timeScale

	if type(bossDef.weapondefs) == "table" then
		for _, weaponDef in pairs(bossDef.weapondefs) do
			scaleDamageTable(weaponDef.damage, damageScale)
		end
	end
end

bossDef.customparams.final_boss_bossdefs_applied = "1"
bossDef.customparams.final_boss_spawn_minutes = tostring(spawnMinutes)
bossDef.customparams.final_boss_time_scale = tostring(timeScale)
bossDef.customparams.final_boss_damage_scale = tostring(damageScale)
_G.FinalBossBossDefsApplied = true

log(string.format(
	"Final Boss bossDefs: spawnMinutes=%.2f timeScale=%.4f maxdamage=%s damageScale=%.4f",
	spawnMinutes,
	timeScale,
	tostring(bossDef.maxdamage),
	damageScale
))

return true
