local BASE_SPAWN_MINUTES = 30
local DEFAULT_SPAWN_MINUTES = 30
local FINAL_BOSS_UNITS = {
	core_core_boss = {
		hpScale = 1,
		damageScale = 1,
	},
	gok_darkdeus_boss = {
		hpScale = 2,
		damageScale = 1.5,
	},
}

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
if not unitDefs then
	log("Final Boss bossDefs: missing UnitDefs")
	return false
end

local spawnMinutes = getSpawnMinutes()
local timeScale = 1
if spawnMinutes > BASE_SPAWN_MINUTES then
	timeScale = 2 ^ ((spawnMinutes - BASE_SPAWN_MINUTES) / 10)
end

local foundAny = false
for unitName, scales in pairs(FINAL_BOSS_UNITS) do
	local bossDef = unitDefs[unitName]
	if not bossDef then
		log("Final Boss bossDefs: missing UnitDef " .. unitName)
	else
		foundAny = true
		bossDef.customparams = bossDef.customparams or {}
		if not bossDef.customparams.final_boss_bossdefs_applied then
			local hpScale = timeScale * (scales.hpScale or 1)
			local damageScale = timeScale * (scales.damageScale or 1)

			if hpScale ~= 1 then
				bossDef.maxdamage = math.floor((bossDef.maxdamage or 0) * hpScale + 0.5)
				bossDef.idleautoheal = (bossDef.idleautoheal or 0) * hpScale
			end

			if damageScale ~= 1 and type(bossDef.weapondefs) == "table" then
				for _, weaponDef in pairs(bossDef.weapondefs) do
					scaleDamageTable(weaponDef.damage, damageScale)
				end
			end

			bossDef.customparams.final_boss_bossdefs_applied = "1"
			bossDef.customparams.final_boss_spawn_minutes = tostring(spawnMinutes)
			bossDef.customparams.final_boss_time_scale = tostring(timeScale)
			bossDef.customparams.final_boss_hp_scale = tostring(hpScale)
			bossDef.customparams.final_boss_damage_scale = tostring(damageScale)

			log(string.format(
				"Final Boss bossDefs: unit=%s spawnMinutes=%.2f timeScale=%.4f hpScale=%.4f maxdamage=%s damageScale=%.4f",
				unitName,
				spawnMinutes,
				timeScale,
				hpScale,
				tostring(bossDef.maxdamage),
				damageScale
			))
		end
	end
end

if foundAny then
	_G.FinalBossBossDefsApplied = true
end

return foundAny
