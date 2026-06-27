local sourceDefs = VFS.Include("units/gok_darkdeus.lua")
local sourceDef = sourceDefs and sourceDefs.gok_darkdeus
if not sourceDef then
	error("Boss Dark Deus: missing source UnitDef gok_darkdeus")
end

local function copyTable(value)
	if type(value) ~= "table" then
		return value
	end
	local result = {}
	for key, childValue in pairs(value) do
		result[key] = copyTable(childValue)
	end
	return result
end

local function applyBossWeaponTargeting(unitDef)
	local weapons = unitDef.weapons
	if not weapons then
		return
	end

	for i = 1, #weapons do
		local weapon = weapons[i]
		if weapon and (weapon.def == "DEUS_BEAM" or weapon.def == "DEUS_CANNON") then
			weapon.badtargetcategory = "SMALL MINOR"
		end
	end
end

local bossDef = copyTable(sourceDef)
bossDef.name = "Boss Dark Deus"
bossDef.description = "Final Boss Dark Deus"
bossDef.unitname = "gok_darkdeus_boss"
bossDef.script = "gok_darkdeus.cob"
bossDef.customparams = bossDef.customparams or {}
bossDef.customparams.buildpic = "gok_darkdeus.dds"
bossDef.customparams.faction = "GOK"
bossDef.customparams.final_boss_phase = "2"
applyBossWeaponTargeting(bossDef)

return {
	gok_darkdeus_boss = bossDef,
}
