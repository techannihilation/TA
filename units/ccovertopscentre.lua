-- UNITDEF -- CCOVERTOPSCENTRE --
--------------------------------------------------------------------------------

local unitName = "ccovertopscentre"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	buildCostEnergy = 1300000,
	buildCostMetal = 76000,
	builder = true,
	buildTime = 65250,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	corpse = [[dead]],
	description = [[build T4 Con]],
	designation = [[COC-1]],
	energyStorage = 250,
	energyUse = 180,
	explodeAs = [[SHIPBLAST]],
	floater = true,
	footprintX = 13,
	footprintZ = 12,
	maxDamage = 40000,
	maxSlope = 10,
	maxWaterDepth = 255,
	metalStorage = 250,
	name = [[OPS Centre T4]],
	noChaseCategory = [[ALL]],
	objectName = [[CCovertOpsCentre]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[CORE]],
	sightDistance = 220,
	stealth = true,
	unitname = [[ccovertopscentre]],
	workerTime = 160,
	yardMap = [[OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO]],
	buildoptions = {
		[1] = [[cbuilderlvl3]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok21]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[intro]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[corplant1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = false,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = [[OPS CORE Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 12,
		footprintZ = 12,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CCovertOpsCentre_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
