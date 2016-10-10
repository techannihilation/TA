-- WEAPONDEF -- BIG_UNIT --
--------------------------------------------------------------------------------

local weaponName = "big_unit"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 120,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:death_explosion_medium_unit]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[BigKbot]],
	range = 480,
	reloadtime = 3.5999999046326,
	soundhit = [[xplolrg3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 350,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
