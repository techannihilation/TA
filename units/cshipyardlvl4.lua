-- UNITDEF -- CSHIPYARDLVL4 --
--------------------------------------------------------------------------------

local unitName = "cshipyardlvl4"

--------------------------------------------------------------------------------

local unitDef = {
	buildCostEnergy = 94000,
	buildCostMetal = 20000,
	builder = true,
	buildTime = 500000.5,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT]],
	collisionvolumeoffsets = [[0 0 -5]],
	collisionvolumescales = [[272 168 536]],
	collisionvolumetest = 0,
	collisionvolumetype = [[Ell]],
	corpse = [[dead]],
	description = [[Build AeroShips]],
	energyStorage = 1000,
	energyUse = 0,
	explodeAs = [[SUPERBLAST]],
	floater = true,
	footprintX = 16,
	footprintZ = 30,
	iconType = [[building]],
	maxDamage = 60000,
	maxSlope = 10,
	maxWaterDepth = 255,
	metalStorage = 600,
	name = [[Shipyard]],
	noChaseCategory = [[ALL]],
	objectName = [[CShipyardLvl4]],
	radarDistance = 0,
	selfDestructAs = [[SUPERBLAST]],
	side = [[CORE]],
	sightDistance = 220,
	unitname = [[cshipyardlvl4]],
	workerTime = 240,
	yardMap = [[OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO]],
	buildoptions = {
		[1] = [[cdevastator]],
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
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[Aero Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 13,
		footprintZ = 30,
		height = 30,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[CShipyardLvl4_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
