-- WEAPONDEF -- THERMITE_MINE --
--------------------------------------------------------------------------------

local weaponName = "thermite_mine"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 100,
	commandfire = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.75,
	explosionGenerator = [[custom:thermite_mine]],
	firestarter = 90,
	impulseboost = 0,
	impulsefactor = 0,
	model = [[bomb]],
	name = [[Thermite Blast]],
	range = 600,
	reloadtime = 0.3,
	soundHitDry = [[xplosml3]],
	soundStart = [[canlite3]],
	tolerance = 7000,
	turret = 1,
	damage = {
		default = 2250,
		minelayers = 25,
		mines = 0.5,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
