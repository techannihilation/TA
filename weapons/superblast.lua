-- WEAPONDEF -- SUPERBLAST --
--------------------------------------------------------------------------------

local weaponName = "superblast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 450,
	ballistic = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:FACTORY_EXPLOSION]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 580,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	shakeduration = 1.2,
	shakemagnitude = 4,
	soundhit = [[explodemedium]],
	soundstart = [[explodemedium]],
	turret = 1,
	weaponvelocity = 150,
	damage = {
		default = 3300,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
