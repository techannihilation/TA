-- WEAPONDEF -- MINE_MEDIUM --
--------------------------------------------------------------------------------

local weaponName = "mine_medium"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 150,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.6,
	explosiongenerator = [[custom:FLASHMEDIUMBUILDING]],
	impulseboost = 0,
	name = [[MediumMine]],
	range = 480,
	reloadtime = 3,
	soundhit = [[xplomed1]],
	soundstart = [[largegun]],
	weaponvelocity = 250,
	damage = {
		default = 800,
		minelayers = 20,
		mines = 1,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
