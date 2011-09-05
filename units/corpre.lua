-- UNITDEF -- CORPRE --
--------------------------------------------------------------------------------

local unitName = "corpre"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 2000,
	buildCostEnergy = 1231120,
	buildCostMetal = 17760,
	builder = false,
	buildTime = 220000,
	canAttack = true,
	canstop = 1,
	category = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[dead]],
	defaultmissiontype = [[GUARD_NOMOVE]],
	description = [[Very Heavy Anti-Air Flak Gun]],
	designation = [[oMgtehfLakZZzZ]],
	downloadable = 1,
	energyMake = -1000,
	energyStorage = 0,
	explodeAs = [[LARGE_BUILDINGEX]],
	firestandorders = 1,
	footprintX = 5,
	footprintZ = 5,
	frenchdescription = [[Canon antiaérien]],
	frenchname = [[Precipitator]],
	germandescription = [[Flak]],
	germanname = [[Precipitator]],
	healtime = -1,
	italiandescription = [[Cannone per bersagli aerei]],
	italianname = [[Precipitator]],
	maxDamage = 8500,
	maxSlope = 20,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Precipitator]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[CORPRE]],
	radarDistance = 1000,
	selfDestructAs = [[MEDIUM_BUILDING]],
	shootme = 1,
	side = [[CORE]],
	sightDistance = 800,
	spanishdescription = [[Arma de fuego antiaéreo]],
	spanishname = [[Precipitator]],
	standingfireorder = 2,
	threed = 1,
	unitname = [[corpre]],
	unitnumber = 161,
	version = 1,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	zbuffer = 1,
	featureDefs = nil,
	sounds = {
		canceldestruct = [[cancel2]],
		cloak = [[kloak1]],
		uncloak = [[kloak1un]],
		underattack = [[warning1]],
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
			[1] = [[twrturn3]],
		},
		select = {
			[1] = [[twrturn3]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[MEDIUMVTOL SMALLVTOL TINYVTOL]],
			def = [[CapitalShipMinigun]],
			onlyTargetCategory = [[VTOL SUPERSHIP]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CapitalShipMinigun = {
		accuracy = 750,
		areaOfEffect = 75,
		beamWeapon = true,
		burnblow = 1,
		burst = 2,
		burstrate = 0.1,
		coreThickness = 1,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.04,
		edgeEffectiveness = 0.4,
		energypershot = 5000,
		explosionart = [[Explode5]],
		explosiongaf = [[FX]],
		guidance = true,
		id = 142,
		lineOfSight = true,
		name = [[Anti-airplane ion mingun]],
		noSelfDamage = true,
		range = 1350,
		reloadtime = 0.2,
		renderType = 0,
		rgbColor = [[1 1 1]],
		rgbColor2 = [[0.5 0.5 0.5]],
		selfprop = true,
		soundHit = [[flakhit]],
		soundStart = [[MG1]],
		soundStartVolume = 15,
		soundTrigger = true,
		startsmoke = 0,
		TargetMoveError = 0,
		texture1 = [[NarrowBoltNoisy]],
		texture2 = [[NULL]],
		texture3 = [[NULL]],
		thickness = 3.5,
		toAirWeapon = true,
		tolerance = 0,
		tracks = true,
		turnRate = 15000,
		turret = true,
		PredictBoost = 1,
		weaponType = [[LaserCannon]],
		weaponVelocity = 2500,
		damage = {
			bombers = 3600,
			default = 5,
			fighters = 3600,
			flak_resistant = 1200,
			unclassed_air = 3600,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	dead = {
		blocking = true,
		category = [[core_corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		featureDead = [[heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 25,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corpre_dead]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
	heap = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		featurereclamate = [[smudge01]],
		footprintX = 5,
		footprintZ = 5,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[5x5a]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
