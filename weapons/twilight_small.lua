-- WEAPONDEF -- TWILIGHT_SMALL --
--------------------------------------------------------------------------------

local weaponName = "twilight_small"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 150,
	commandfire = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.75,
	explosiongenerator = [[custom:EMPFLASH240]],
	firestarter = 90,
	impulseboost = 0,
	impulsefactor = 0,
	model = [[bomb]],
	name = [[EMPboom]],
	paralyzer = 1,
	paralyzetime = 10,
	range = 600,
	reloadtime = 0.30000001192093,
	soundhit = [[EMGPULS1]],
	soundstart = [[bombrel]],
	tolerance = 7000,
	turret = 1,
	damage = {
		commanders = 30,
		default = 4000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
