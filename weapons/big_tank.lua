-- WEAPONDEF -- BIG_TANK --
--------------------------------------------------------------------------------

local weaponName = "big_tank"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 64,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:Death_Explosion_Medium_Tank]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[BigTank]],
	range = 480,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	soundhit = [[xplolrg3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 25,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
