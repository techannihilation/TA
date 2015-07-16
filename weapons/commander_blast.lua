-- WEAPONDEF -- COMMANDER_BLAST --
--------------------------------------------------------------------------------

local weaponName = "commander_blast"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 720,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:com_explo]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 380,
	reloadtime = 3.5999999046326,
	rendertype = 4,
	shakeduration = 5,
	shakemagnitude = 600,
	soundhit = [[newboom]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 50000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
