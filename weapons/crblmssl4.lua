-- WEAPONDEF -- CRBLMSSL4 --
--------------------------------------------------------------------------------

local weaponName = "crblmssl4"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 2000,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.25,
	explosiongenerator = [[custom:FLASHNUKE1920]],
	impulseboost = 0.5,
	impulsefactor = 0.5,
	name = [[Matter/AntimatterExplosion]],
	soundhit = [[xplomed4]],
	soundstart = [[misicbm1]],
	turret = 1,
	damage = {
		commanders = 5000,
		default = 100000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
