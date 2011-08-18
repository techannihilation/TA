-- UNITDEF -- ASHIPYARDLVL3 --
--------------------------------------------------------------------------------

local unitName = "ashipyardlvl3"

--------------------------------------------------------------------------------

local unitDef = {
	buildCostEnergy = 99000,
	buildCostMetal = 21200,
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
	description = [[builds AeroShips]],
	designation = [[GZ-FA3C]],
	energyStorage = 500,
	energyUse = 0,
	explodeAs = [[SHIPBLAST]],
	floater = true,
	footprintX = 16,
	footprintZ = 30,
	maxDamage = 70000,
	maxSlope = 10,
	maxWaterDepth = 255,
	metalStorage = 500,
	name = [[Shipyard]],
	noChaseCategory = [[ALL]],
	objectName = [[AShipyardLvl3]],
	radarDistance = 0,
	selfDestructAs = [[SHIPBLAST]],
	side = [[ARM]],
	sightDistance = 220,
	unitname = [[ashipyardlvl3]],
	workerTime = 240,
	yardMap = [[OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO]],
	buildoptions = {
		[1] = [[abroadside]],
	},
	featureDefs = nil,
	sounds = {
		build = [[hoverok1]],
		canceldestruct = [[cancel2]],
		underattack = [[warning1]],
		unitcomplete = [[untdone]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		select = {
			[1] = [[hoversl1]],
		},
	},
}

--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[arm_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[Aero Wreckage]],
		featurereclamate = [[smudge01]],
		footprintX = 8,
		footprintZ = 12,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[AShipyardLvl3_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
