-- WEAPONDEF -- MEGA_BLAST1 --
--------------------------------------------------------------------------------

local weaponName = "mega_blast1"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 2750,
	ballistic = 1,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:EXPLOSIONHUGE]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 2980,
	reloadtime = 3.6,
	rendertype = 4,
	shakeduration = 2.2,
	shakemagnitude = 5,
	soundhit = [[explosionbig]],
	soundstart = [[explosionbig]],
	turret = 1,
	weaponvelocity = 150,
	damage = {
		default = 235280,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
