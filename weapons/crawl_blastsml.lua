-- WEAPONDEF -- CRAWL_BLASTSML --
--------------------------------------------------------------------------------

local weaponName = "crawl_blastsml"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 250,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.3,
	explosiongenerator = [[custom:FLASHNUKE280]],
	impulseboost = 0,
	impulsefactor = 0,
	name = [[WimpyCrawlingBomb]],
	range = 400,
	reloadtime = 3,
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 1000,
		crawlingbombs = 25,
		default = 2000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
