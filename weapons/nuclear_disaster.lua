-- WEAPONDEF -- NUCLEAR_DISASTER --
--------------------------------------------------------------------------------

local weaponName = "nuclear_disaster"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 1180,
	ballistic = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:flashnukex480]],
	impulseboost = 0,
	impulsefactor = 0,
	name = [[Matter/AntimatterExplosion]],
	range = 500,
	reloadtime = 13.6,
	rendertype = 1,
	shakeduration = 2,
	shakemagnitude = 36,
	soundhit = [[largegun]],
	soundstart = [[xplonuk3]],
	turret = 1,
	weaponvelocity = 300,
	damage = {
		default = 3500,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
