local Def = {
	abuilderlvl2 = {
		acceleration = 0.0266,
		activateWhenBuilt = true,
		airHoverFactor = 0,
		brakeRate = 1.596,
		buildCostEnergy = 3619,
		buildCostMetal = 668,
		buildDistance = 100,
		buildTime = nil,
		builder = true,
		buildoptions = {
			[1] = [[ametalmakerlvl1]],
			[2] = [[arm_wind_generator]],
			[3] = [[armmex1]],
		},
		canFly = true,
		canGuard = true,
		canMove = true,
		canPatrol = true,
		canReclaim = true,
		canstop = 1,
		category = [[ALL NOTLAND MOBILE NOTSUB ANTIFLAME ANTIGATOR ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
		collide = false,
		corpse = [[dead]],
		cruiseAlt = 130,
		description = [[Makes Upgraded t1 Economy]],
		designation = [[ARN-MCA]],
		dontland = 1,
		energyMake = 20,
		energyStorage = 500,
		energyUse = 10.1,
		explodeAs = [[BIG_UNITEX]],
		featureDefs = {
			dead = {
				blocking = false,
				category = [[arm_corpses]],
				damage = nil,
				description = [[Ditawn Wreckage]],
				featurereclamate = [[smudge01]],
				footprintX = 4,
				footprintZ = 4,
				height = 40,
				hitdensity = 100,
				metal = nil,
				object = [[ABuilderLvl2_dead]],
				reclaimable = true,
				seqnamereclamate = [[tree1reclamate]],
				world = [[All Worlds]],
			},
		},
		footprintX = 4,
		footprintZ = 4,
		iconType = [[air]],
		maxDamage = 235,
		maxSlope = 10,
		maxVelocity = 8.379,
		maxWaterDepth = 0,
		metalMake = 0.5,
		metalStorage = 100,
		name = [[ditawn]],
		objectName = [[ABuilderLvl2]],
		radarDistance = 0,
		selfDestructAs = [[SMALLSHIP]],
		side = [[ARM]],
		sightDistance = 400,
		sounds = {
			arrived = {
				[1] = [[armshipstop]],
			},
			canceldestruct = [[cancel2]],
			cant = {
				[1] = [[cantdo4]],
			},
			count = {
				[1] = [[count6]],
				[2] = [[count5]],
				[3] = [[count4]],
				[4] = [[count3]],
				[5] = [[count2]],
				[6] = [[count1]],
			},
			ok = {
				[1] = [[armshipgo]],
			},
			select = {
				[1] = [[armselect]],
			},
			underattack = [[warning1]],
		},
		turnRate = 380.38,
		unitname = [[abuilderlvl2]],
		workerTime = 100,
	},
}
Def.aach.buildTime = 2.0955 * Def.aach.buildCostEnergy
Def.aach.featureDefs.dead.damage = 0.6000 * Def.aach.maxDamage
Def.aach.featureDefs.dead.metal = 0.8000 * Def.aach.buildCostMetal
Def.aafus.buildTime = 1.8182 * Def.aafus.buildCostEnergy
Def.aahp.buildTime = 2.6001 * Def.aahp.buildCostEnergy
Def.aahp.featureDefs.dead.damage = 0.6000 * Def.aahp.maxDamage
Def.aahp.featureDefs.dead.metal = 0.8000 * Def.aahp.buildCostMetal
Def.aahp.featureDefs.heap.damage = 0.3600 * Def.aahp.maxDamage
Def.aahp.featureDefs.heap.metal = 0.6400 * Def.aahp.buildCostMetal
Def.aahpns.buildTime = 1.2217 * Def.aahpns.buildCostEnergy
Def.aahpns.featureDefs.dead.damage = 0.6000 * Def.aahpns.maxDamage
Def.aahpns.featureDefs.dead.metal = 0.8000 * Def.aahpns.buildCostMetal
Def.aahpns.featureDefs.heap.damage = 0.3600 * Def.aahpns.maxDamage
Def.aahpns.featureDefs.heap.metal = 0.6400 * Def.aahpns.buildCostMetal
Def.abroadside.buildTime = 1.4286 * Def.abroadside.buildCostEnergy
Def.abroadside.featureDefs.dead.damage = 0.6000 * Def.abroadside.maxDamage
Def.abroadside.featureDefs.dead.metal = 0.8000 * Def.abroadside.buildCostMetal
Def.abuilderlvl1.buildTime = 3.9372 * Def.abuilderlvl1.buildCostEnergy
Def.abuilderlvl2.buildTime = 1.1032 * Def.abuilderlvl2.buildCostEnergy
Def.abuilderlvl2.featureDefs.dead.damage = 0.6000 * Def.abuilderlvl2.maxDamage
Def.abuilderlvl2.featureDefs.dead.metal = 0.8000 * Def.abuilderlvl2.buildCostMetal
return lowerkeys(Def)
