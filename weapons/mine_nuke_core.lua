-- WEAPONDEF -- MINE_NUKE_CORE --
--------------------------------------------------------------------------------

local weaponName = "mine_nuke_core"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 768,
	craterboost = 5,
	cratermult = 2.5,
	edgeeffectiveness = 0.20000000298023,
	explosiongenerator = [[custom:CORE_FUSION_EXPLO_768]],
	impulseboost = 0.25,
	impulsefactor = 0.25,
	name = [[NuclearMine]],
	range = 1000,
	reloadtime = 3.5999999046326,
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	waterweapon = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 1500,
		default = 3500,
		mines = 20,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
