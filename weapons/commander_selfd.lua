-- WEAPONDEF -- COMMANDER_SELFD --
--------------------------------------------------------------------------------

local weaponName = "commander_selfd"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 1410,
	ballistic = 1,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:FLASHNUKE1280]],
	impulseboost = 3,
	impulsefactor = 3,
	name = [[Matter/AntimatterExplosion]],
	range = 880,
	reloadtime = 3.6,
	rendertype = 4,
	shakeduration = 5,
	shakemagnitude = 600,
	soundhit = [[newboom]],
	soundstart = [[largegun]],
	turret = 1,
	weaponvelocity = 250,
	damage = {
		commanders = 2800,
		default = 90000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
