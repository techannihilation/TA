-- WEAPONDEF -- COMMANDER_BLAST1 --
--------------------------------------------------------------------------------

local weaponName = "commander_blast1"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 720,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:comm_explo_720]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 300,
	reloadtime = 3.5999999046326,
	shakeduration = 5,
	shakemagnitude = 600,
	soundhit = [[newboom]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		default = 25000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
