-- UNITDEF -- TLLACID --
--------------------------------------------------------------------------------

local unitName = "tllacid"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.4,
  buildCostEnergy    = 40000,
  buildCostMetal     = 6000,
  builder            = false,
  buildTime          = 89500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Long Range Vertical Missile Vehicle]],
  energyMake         = 1,
  energyStorage      = 50,
  energyUse          = 20,
  explodeAs          = [[MEDIUM_UNIT]],
  firestandorders    = 1,
  firestate          = 0,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 850,
  maxSlope           = 16,
  maxVelocity        = 0.8,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Acidic Rain]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tllacid]],
  selfDestructAs     = [[MEDIUM_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 390,
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 380,
  unitname           = [[tllacid]],
  unitnumber         = 30132,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
			badTargetCategory     = [[MOBILE]],
     			onlyTargetCategory    = [[NOTVTOL]],
      			def 	              = [[ACIDRAIN_ROCKET]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ACIDRAIN_ROCKET = {
                areaOfEffect = 480,
		commandfire = true,
		craterBoost = 1,
		craterMult = 1,
		edgeEffectiveness = 0.6,
		energypershot = 30000,
		--explosionGenerator = [[custom:arghnuke_fx2]],
		fireStarter = 0,
		flightTime = 400,
		guidance = true,
		impulseBoost = 0.023,
		impulseFactor = 0.023,
		lineOfSight = true,
		metalpershot = 750,
		model = [[corshiprckt1]],
		name = [[Chemical Weapon]],
		noautorange = 1,
		noSelfDamage = true,
		propeller = 1,
		range = 3000,
		reloadtime = 2,
		renderType = 1,
		selfprop = true,
		shakeduration = 1.5,
		shakemagnitude = 32,
		smokedelay = 0.1,
		smokeTrail = true,
		soundHit = [[xplomed4]],
		soundStart = [[misicbm1]],
		startsmoke = 1,
		stockpile = true,
		stockpiletime = 90,
		tolerance = 4000,
		turnRate = 32768,
		twoPhase = true,
		vlaunch = true,
		weaponAcceleration = 80,
		weaponTimer = 10,
		weaponType = [[StarburstLauncher]],
		weaponVelocity = 700,
		damage = {
			commanders = 250,
			default = 2000,
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
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 23,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[tllacid_dead]],
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
