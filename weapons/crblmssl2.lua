-- WEAPONDEF -- CRBLMSSL2 --
--------------------------------------------------------------------------------

local weaponName = "crblmssl2"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 920,
	ballistic = 0,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:FLASHNUKE1920]],
	impulseboost = 0.5,
	impulsefactor = 0.5,
	name = [[Matter/AntimatterExplosion]],
	range = 72000,
	reloadtime = 120,
	rendertype = 1,
	shakeduration = 3,
	shakemagnitude = 50,
	soundhit = [[xplomed4]],
	soundstart = [[misicbm1]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 2500,
		default = 7000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
