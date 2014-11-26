-- WEAPONDEF -- IMPULSE_MINE --
--------------------------------------------------------------------------------

local weaponName = "impulse_mine"

--------------------------------------------------------------------------------

local weaponDef = {
	areaofeffect = 200,
	ballistic = 1,
	commandfire = 1,
	craterboost = 0,
	cratermult = 0,
	edgeeffectiveness = 0.75,
	explosionGenerator = [[custom:FLASH64]],
	firestarter = 90,
	impulseboost = 4,
	impulsefactor = 6,
	model = [[bomb]],
	name = [[Shockwave]],
	range = 600,
	reloadtime = 0.30000001192093,
	rendertype = 4,
	soundHitDry = [[xplosml3]],
	soundStart = [[canlite3]],
	tolerance = 7000,
	turret = 1,
	damage = {
		default = 50,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
