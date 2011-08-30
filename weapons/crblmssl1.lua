-- WEAPONDEF -- CRBLMSSL1 --
--------------------------------------------------------------------------------

local weaponName = "crblmssl1"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 2120,
	ballistic = 0,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	energypershot = 307500,
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
	weaponvelocity = 2200,
	damage = {
		commanders = 2500,
		default = 15500,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
