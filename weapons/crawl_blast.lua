-- WEAPONDEF -- CRAWL_BLAST --
--------------------------------------------------------------------------------

local weaponName = "crawl_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 400,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.40000000596046,
	explosiongenerator = [[custom:FLASHNUKE360]],
	impulseboost = 0.12300000339746,
	impulsefactor = 0.12300000339746,
	name = [[CrawlingBomb]],
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 1250,
		crawlingbombs = 50,
		default = 2500,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
