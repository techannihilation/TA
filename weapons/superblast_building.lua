-- WEAPONDEF -- SUPERBLAST_BUILDING --
--------------------------------------------------------------------------------

local weaponName = "superblast_building"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 3800,
	ballistic = 1,
	craterboost = 1.5,
	cratermult = 1,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:EXPLOSIONHUGE_BUILDING]],
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
