-- WEAPONDEF -- ARM_BERTHACANNONEMP1 --
--------------------------------------------------------------------------------

local weaponName = "arm_berthacannonemp1"

--------------------------------------------------------------------------------

local weaponDef = {
	accuracy = 300,
	aimrate = 500,
	alphaDecay = 0.01,
	areaOfEffect = 510,
	ballistic = true,
	cegTag = [[vulcanfx1]],
	color = 3,
	craterBoost = 0,
	craterMult = 0,
	edgeEffectiveness = 50,
	energypershot = 16300,
	explosionGenerator = [[custom:EMPFLASH240]],
	fireStarter = 50,
	gravityaffected = [[true]],
	groundbounce = false,
	holdtime = 1,
	id = 72,
	impulseBoost = 0,
	impulseFactor = 0,
	name = [[Bertha Cannon]],
	noGap = true,
	paralyzer = true,
	paralyzeTime = 16,
	range = 6750,
	reloadtime = 15.67,
	renderType = 4,
	rgbColor = [[1 0.8 0.5]],
	separation = 0.01,
	size = 4,
	sizeDecay = -0.01,
	soundHit = [[emgpuls1]],
	soundStart = [[xplonuk4]],
	stages = 20,
	startsmoke = 1,
	tolerance = 7000,
	turret = true,
	waterbounce = false,
	weaponType = [[Cannon]],
	weaponVelocity = 1100,
	damage = {
		commanders = 2000,
		default = 21000,
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[weaponName] = weaponDef})

--------------------------------------------------------------------------------
