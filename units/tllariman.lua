-- UNITDEF -- TLLARIMAN --
--------------------------------------------------------------------------------

local unitName = "tllariman"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.025,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.01,
  buildCostEnergy    = 1106,
  buildCostMetal     = 322,
  builder            = false,
  buildTime          = 2701,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Assault Tank]],
  designation        = [[]],
  energyMake         = 0.6,
  energyUse          = 0.7,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Char d'assaut]],
  germandescription  = [[Gefechtspanzer]],
  maneuverleashlength = 640,
  maxDamage          = 1812,
  maxSlope           = 10,
  maxVelocity        = 2.30,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Ariman]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLARIMAN]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 320,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 625,
  unitname           = [[tllariman]],
  unitnumber         = 827,
  version            = 3.1,
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
      badTargetCategory  = [[VTOL]],
      def                = [[ARMCOMLASER]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMCOMLASER = {
    areaOfEffect       = 12,
    avoidFeature       = false,
    beamlaser          = 1,
    beamTime           = 0.1,
    coreThickness      = 0.1,
    craterBoost        = 0,
    craterMult         = 0,
    cylinderTargetting = 1,
    edgeEffectiveness  = 0.99,
    explosionGenerator = [[custom:SMALL_RED_BURN]],
    fireStarter        = 70,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 7,
    lineOfSight        = true,
    name               = [[J7Laser]],
    noSelfDamage       = true,
    range              = 300,
    reloadtime         = 0.4,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrfir1]],
    soundTrigger       = true,
    targetMoveError    = 0.05,
    thickness          = 2,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 900,
    damage = {
      default            = 75,
      l1bombers          = 180,
      l1fighters         = 110,
      l1subs             = 5,
      l2bombers          = 180,
      l2fighters         = 110,
      l2subs             = 5,
      l3subs             = 5,
      vtrans             = 110,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllariman_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2e]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
