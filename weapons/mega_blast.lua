-- WEAPONDEF -- MEGA_BLAST --
--------------------------------------------------------------------------------

local weaponName = "mega_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 1800,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:EXPLOSIONHUGE]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	soundhit = [[explosionbig]],
	soundstart = [[explosionbig]],
	turret = 1,
	damage = {
		commanders = 2500,
		crawlingbombs = 200,
		default = 30000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
