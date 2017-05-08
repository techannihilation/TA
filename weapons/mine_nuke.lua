-- WEAPONDEF -- MINE_NUKE --
--------------------------------------------------------------------------------

local weaponName = "mine_nuke"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 700,
	craterboost = 5,
	cratermult = 2.5,
	edgeeffectiveness = 0.2,
	explosiongenerator = [[custom:FLASHNUKE768]],
	impulseboost = 0.25,
	impulsefactor = 0.25,
	name = [[NuclearMine]],
	range = 1000,
	reloadtime = 3.6,
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	waterweapon = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 1500,
		default = 6000,
		mines = 50,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
