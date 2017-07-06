-- WEAPONDEF -- ESTOR_BUILDING --
--------------------------------------------------------------------------------

local weaponName = "estor_building"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 520,
	craterboost = 0,
	cratermult = 0,
	explosiongenerator = [[custom:FLASHNUKE480]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[Smallbuilding]],
	range = 580,
	reloadtime = 3.5999999046326,
	soundhit = [[xplolrg4]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 625,
		default = 1250,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
