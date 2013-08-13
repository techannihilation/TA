-- UNITDEF -- TLLSONAR --
--------------------------------------------------------------------------------

local unitName = "tllsonar"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 8192,
	buildCostEnergy = 423,
	buildCostMetal = 22,
	isbuilder = false,
	buildTime = 931,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	corpse = [[dead]],
	description = [[Locates Water Units]],
	designation = [[TL-SON]],
	energyMake = 8,
	energyStorage = 0,
	energyUse = 9,
	explodeAs = [[SMALL_BUILDINGEX]],
	footprintX = 2,
	footprintZ = 2,
	maxDamage = 54,
	maxHeightDif = 10,
	metalStorage = 0,
	minWaterDepth = 8,
	name = [[Sonar Station]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[TLLSONAR]],
	onoffable = true,
	ovradjust = 1,
	selfDestructAs = [[SMALL_BUILDING]],
	side = [[TLL]],
	sightDistance = 175,
	sonarDistance = 1320,
	unitname = [[tllsonar]],
	unitnumber = 853,
	waterline = 11,
	workerTime = 0,
	yardMap = [[wwww]],
	featureDefs = nil,
	sounds = {
		activate = [[sonar1]],
		canceldestruct = [[cancel2]],
		deactivate = [[sonarde1]],
		underattack = [[warning1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[sonar1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[tll_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 2,
		footprintZ = 2,
		height = 12,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[tllsonar_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[all]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
