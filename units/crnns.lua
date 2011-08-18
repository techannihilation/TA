-- UNITDEF -- CRNNS --
--------------------------------------------------------------------------------

local unitName = "crnns"

--------------------------------------------------------------------------------

local unitDef = {
	activateWhenBuilt = true,
	bmcode = 0,
	buildAngle = 16000,
	buildCostEnergy = 145000,
	buildCostMetal = 17000,
	builder = false,
	buildTime = 360000,
	category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
	copyright = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
	damageModifier = 0.9,
	description = [[Produces Energy / Storage]],
	designation = [[AE-CKF]],
	downloadable = 1,
	energyMake = 5120,
	energyStorage = 51200,
	explodeAs = [[Nuclear_Missile]],
	footprintX = 10,
	footprintZ = 8,
	frenchdescription = [[Produit de l'énergie]],
	frenchname = [[Réacteur nucléaire NS]],
	germandescription = [[Liefert Energie]],
	germanname = [[Fusionreaktor NS]],
	italiandescription = [[Produce energia]],
	italianname = [[Reattore a Fusione NS]],
	maxDamage = 10400,
	metalStorage = 0,
	minWaterDepth = 15,
	name = [[Advanced Antimater Fusion]],
	noAutoFire = false,
	noChaseCategory = [[ALL]],
	noshadow = 1,
	objectName = [[crnns]],
	onoffable = true,
	radarDistance = 0,
	selfDestructAs = [[NUCLEAR_MISSILE1]],
	side = [[CORE]],
	sightDistance = 210,
	spanishdescription = [[Genera energía]],
	spanishname = [[Reactor de Fusión NS]],
	threed = 1,
	unitname = [[crnns]],
	unitnumber = 233,
	version = 1.2,
	waterline = 10,
	workerTime = 0,
	yardMap = [[wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww]],
	zbuffer = 1,
	sounds = {
		activate = [[mohorun1]],
		canceldestruct = [[cancel2]],
		deactivate = [[mohooff1]],
		underattack = [[warning1]],
		working = [[mohorun1]],
		count = {
			[1] = [[count6]],
			[2] = [[count5]],
			[3] = [[count4]],
			[4] = [[count3]],
			[5] = [[count2]],
			[6] = [[count1]],
		},
		ok = {
			[1] = [[twractv2]],
		},
		select = {
			[1] = [[mohoon1]],
		},
	},
}
--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
