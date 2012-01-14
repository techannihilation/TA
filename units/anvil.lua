-- UNITDEF -- ANVIL --
--------------------------------------------------------------------------------

local unitName = "anvil"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.4,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.4,
  buildCostEnergy    = 64000,
  buildCostMetal     = 15640,
  builder            = false,
  buildTime          = 803500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL HUGE WEAPON]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Ultimate unit paralyser]],
  designation        = [[none]],
  energyMake         = 1,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 15500,
  maxSlope           = 25,
  maxVelocity        = 0.8,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Anvil]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[anvil]],
  radarDistance      = 0,
  scale              = 1.2,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 370,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 300,
  unitname           = [[anvil]],
  unitnumber         = 30121,
  version            = 3.0,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      onlyTargetCategory = [[NOTVTOL]],
      def                = [[AnchorEmpBeam]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
	AnchorEmpBeam = {
		accuracy = 1,
		areaOfEffect = 60,
		beamlaser = 1,
		beamTime = 0.5,
		burnblow = true,
		coreThickness = 0.2,
		craterBoost = 0,
		craterMult = 0,
		endsmoke = 0,
		explosionGenerator = [[custom:anvil]],
		--fallOffRate = 0.8,
		energypershot = 12500,
		minIntensity = 0.2,
		fireStarter = 20,
		id = 168,
		impulseFactor = 0.2,
		largeBeamLaser = true,
		laserFlareSize = 6,
		lineOfSight = true,
		name = [[Heavy Emp Beam]],
		noExplode = true,
		range = 1100,
		reloadtime = 0.5,
		renderType = 0,
		rgbColor = [[0.9 0.75 0]],
		rgbColor2 = [[0 0 0.1]],
		soundHit = [[burn02]],
		soundStart = [[build2]],
		soundTrigger = true,
		startsmoke = 0,
		targetmoveerrorr = 0.1,
		texture1 = [[Type4Beam]], --beam
		--texture2 = [[EMG]], --beamend
		texture3 = [[beamrifle]], --muzzle
		--texture4 = [[EMG]], --flare
		thickness = 7,
		tolerance = 100000,
		turret = true,
		paralyzer = true,
		paralyzeTime = 1,
		weaponType = [[BeamLaser]],
		weaponVelocity = 1500,
		damage = {
			commanders = 6000,
			default = 25000,
			experimental_land = 100000,
			experimental_ships = 100000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Anvil Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 23,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[anvil_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 0.3600 * unitDef.maxDamage,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 0.6400 * unitDef.buildCostMetal,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
