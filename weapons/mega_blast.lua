-- WEAPONDEF -- MEGA_BLAST --
--------------------------------------------------------------------------------

local weaponName = "mega_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 1920,
	ballistic = 1,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:EXPLOSIONHUGE]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 1800,
	reloadtime = 3.6,
	rendertype = 4,
	shakeduration = 2.2,
	shakemagnitude = 5,
	soundhit = [[explosionbig]],
	soundstart = [[explosionbig]],
	turret = 1,
	weaponvelocity = 150,
	damage = {
		commanders = 1500,
		default = 60000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
