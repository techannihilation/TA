-- WEAPONDEF -- LIGHTSHIPBLAST --
--------------------------------------------------------------------------------

local weaponName = "lightshipblast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 200,
	ballistic = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:EXPLOSIONMEDIUM]],
	impulseboost = 0,
	impulsefactor = 0,
	name = [[Matter/AntimatterExplosion]],
	range = 480,
	reloadtime = 13.6,
	rendertype = 4,
	shakeduration = 1.2,
	shakemagnitude = 4,
	soundhit = [[explosionsmall]],
	soundstart = [[explosionsmall]],
	turret = 1,
	weaponvelocity = 200,
	damage = {
		default = 1240,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
