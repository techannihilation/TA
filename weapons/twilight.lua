-- WEAPONDEF -- TWILIGHT --
--------------------------------------------------------------------------------

local weaponName = "twilight"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 300,
	commandfire = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.75,
	explosiongenerator = [[custom:EMPFLASH400]],
	firestarter = 90,
	impulseboost = 0,
	impulsefactor = 0,
	model = [[bomb]],
	name = [[EMPboom]],
	paralyzer = 1,
	paralyzetime = 20,
	range = 600,
	reloadtime = 0.30000001192093,
	soundhit = [[EMGPULS1]],
	soundstart = [[bombrel]],
	tolerance = 7000,
	turret = 1,
	damage = {
		commanders = 1000,
		default = 4000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
