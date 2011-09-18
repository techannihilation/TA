-- UNITDEF -- TLLADT --
--------------------------------------------------------------------------------

local unitName = "tlladt"

--------------------------------------------------------------------------------

local unitDef = {
	bmcode = 0,
	buildAngle = 0,
	buildCostEnergy = 695,
	buildCostMetal = 29,
	builder = false,
	buildTime = 995,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	corpse = [[TLLfortification]],
	description = [[Perimeter Defense]],
	designation = [[TL-ADT]],
	downloadable = 1,
	energyMake = 0,
	energyStorage = 0,
	energyUse = 0,
	footprintX = 2,
	footprintZ = 2,
	frenchdescription = [[Périmètre de défense]],
	frenchname = [[Mur de fortification]],
	germandescription = [[Befestigungsmauern]],
	germanname = [[Befestigung]],
	isFeature = true,
	italiandescription = [[Mura fortificate]],
	italianname = [[Fortificazioni]],
	maxDamage = 100,
	maxSlope = 8,
	maxWaterDepth = 0,
	metalStorage = 0,
	name = [[Fortification Wall]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	objectName = [[TLLADT]],
	radarDistance = 0,
	side = [[TLL]],
	sightDistance = 100,
	spanishdescription = [[Defensa de perímetro]],
	spanishname = [[Defensa]],
	threed = 1,
	unitname = [[tlladt]],
	unitnumber = 937,
	version = 1,
	workerTime = 0,
	yardMap = [[ff ff]],
	zbuffer = 1,
	featureDefs = nil,
}

--------------------------------------------------------------------------------

local featureDefs = {
	RockTeeth = {
		animating = 0,
		animtrans = 0,
		blocking = false,
		category = [[rocks]],
		damage = 500,
		description = [[Rubble]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 19,
		object = [[2X2A]],
		reclaimable = true,
		shadtrans = 1,
		world = [[greenworld]],
	},
	TLLfortification = {
		autoreclaimable = 0,
		blocking = true,
		category = [[dragonteeth]],
		collisionvolumeoffsets = [[0 0 0]],
		collisionvolumescales = [[31 68 31]],
		collisionvolumetest = 1,
		collisionvolumetype = [[Box]],
		damage = 1680,
		description = [[Fortification Wall]],
		featureDead = [[RockTeeth]],
		footprintX = 2,
		footprintZ = 2,
		height = 55,
		hitdensity = 97,
		metal = 8,
		object = [[TLLADT]],
		reclaimable = true,
		seqnamereclamate = [[tree1reclamate]],
		world = [[allworld]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
