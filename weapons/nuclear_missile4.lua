-- WEAPONDEF -- NUCLEAR_MISSILE4 --
--------------------------------------------------------------------------------

local weaponName = "nuclear_missile4"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 1200,
	avoidfriendly = 0,
	collidefriendly = 0,
	commandfire = 1,
	craterboost = 6,
	cratermult = 3,
	edgeeffectiveness = 0.30000001192093,
	explosiongenerator = [[custom:FLASHNUKE1280]],
	impulseboost = 0.5,
	impulsefactor = 0.5,
	model = [[ballmiss]],
	name = [[NuclearMissile]],
	smoketrail = 1,
	soundhit = [[xplomed4]],
	soundstart = [[misicbm1]],
	damage = {
		commanders = 2500,
		crawlingbombs = 200,
		default = 20000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
