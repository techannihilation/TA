-- WEAPONDEF -- NANOBOOM2T --
--------------------------------------------------------------------------------

local weaponName = "nanoboom2T"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 128,
	ballistic = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.75,
	explosiongenerator = [[custom:newnanoboomtll]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[MEX]],
	range = 128,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	soundhit = [[xplosml3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 70,
	damage = {
		default = 10,
		nanos = 600,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
