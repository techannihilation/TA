-- WEAPONDEF -- SUPERBLAST_BUILDING_CORE --
--------------------------------------------------------------------------------

local weaponName = "superblast_building_core"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 2880,
	ballistic = 1,
	craterboost = 1.5,
	cratermult = 1,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:CORE_FUSION_EXPLO_2880]],
	impulseboost = 1,
	impulsefactor = 1,
	name = [[Matter/AntimatterExplosion]],
	range = 3800,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	shakeduration = 1.2,
	shakemagnitude = 4,
	soundhit = [[explosionbig]],
	soundstart = [[explosionbig]],
	turret = 1,
	weaponvelocity = 150,
	damage = {
		default = 33000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
