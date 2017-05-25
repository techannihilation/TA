-- WEAPONDEF -- MEGA_BLAST1 --
--------------------------------------------------------------------------------

local weaponName = "mega_blast1"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 2250,
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
	weaponvelocity = 150,
	damage = {
		commanders = 7500,
		default = 150000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
