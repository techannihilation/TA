-- WEAPONDEF -- SMALL_UNIT_VTOL --
--------------------------------------------------------------------------------

local weaponName = "small_unit_vtol"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 60,
	ballistic = 1,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:Death_Explosion_Small_Unit]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[Small vtol]],
	range = 480,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	soundhit = [[xplomed2]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 30,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
