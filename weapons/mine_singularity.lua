-- WEAPONDEF -- MINE_SINGULARITY --
--------------------------------------------------------------------------------

local weaponName = "mine_singularity"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 200,
	ballistic = 1,
	craterboost = 10,
	cratermult = 5,
	edgeeffectiveness = 0.69999998807907,
	explosiongenerator = [[custom:singularitybomb]],
	impulseboost = 0,
	name = [[SingularityMine]],
	range = 480,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	soundhit = [[xplolrg3]],
	soundstart = [[largegun]],
	weaponvelocity = 250,
	damage = {
		commanders = 5000,
		default = 15000,
		minelayers = 100,
		mines = 5,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
