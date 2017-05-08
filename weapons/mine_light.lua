-- WEAPONDEF -- MINE_LIGHT --
--------------------------------------------------------------------------------

local weaponName = "mine_light"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 100,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:FLASHSMALLBUILDING]],
	impulseboost = 0,
	impulsefactor = 0,
	name = [[LightMine]],
	range = 480,
	reloadtime = 3,
	soundhit = [[xplosml1]],
	soundstart = [[largegun]],
	weaponvelocity = 250,
	damage = {
		default = 300,
		minelayers = 10,
		mines = 1,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
