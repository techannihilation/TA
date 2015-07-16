-- WEAPONDEF -- BIG_UNIT_VTOL --
--------------------------------------------------------------------------------

local weaponName = "big_unit_vtol"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 120,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:Death_Explosion_Medium_Unit]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[Big vtol]],
	range = 480,
	reloadtime = 3.5999999046326,
	soundhit = [[xplolrg3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 60,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
