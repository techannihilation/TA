-- WEAPONDEF -- FUSIONX_BLAST --
--------------------------------------------------------------------------------

local weaponName = "fusionx_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 480,
	ballistic = 1,
	craterboost = 1.1,
	cratermult = 1.1,
	edgeeffectiveness = 0.5,
	explosiongenerator = [[custom:FLASHNUKEX480]],
	impulseboost = 0.2,
	impulsefactor = 0.2,
	name = [[Matter/AntimatterExplosion]],
	range = 420,
	reloadtime = 13.6,
	rendertype = 4,
	shakeduration = 1.2,
	shakemagnitude = 4,
	soundhit = [[xplonuk3]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 3000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
