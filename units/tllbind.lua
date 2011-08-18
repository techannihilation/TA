-- UNITDEF -- TLLBIND --
--------------------------------------------------------------------------------

local unitName = "tllbind"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.09,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.183105469,
  buildCostEnergy    = 12400,
  buildCostMetal     = 2585,
  builder            = false,
  buildTime          = 47896,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy laser kbot]],
  designation        = [[]],
  energyMake         = 1.1,
  energyUse          = 1.2,
  explodeAs          = [[CORPYRO_BLAST]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maneuverleashlength = 640,
  maxDamage          = 12715,
  maxSlope           = 17,
  maxVelocity        = 0.92,
  maxWaterDepth      = 25,
  mobilestandorders  = 1,
  movementClass      = [[AKBOT2]],
  name               = [[Binder]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLBind]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 580,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 250,
  unitname           = [[tllbind]],
  unitnumber         = 8301,
  upright            = true,
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLBINDER_WEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLBINDER_WEAPON = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 75,
    explosionGenerator = [[custom:LARGE_GREEN_LASER_BURN]],
    fireStarter        = 90,
    impactonly         = 1,
    impulseBoost       = 0.113,
    impulseFactor      = 0.113,
    laserFlareSize     = 9,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 605,
    reloadtime         = 0.66,
    renderType         = 0,
    rgbColor           = [[0 1 0]],
    soundHit           = [[lasrhit1]],
    soundStart         = [[lasrhvy3]],
    targetMoveError    = 0.25,
    thickness          = 2.6,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 800,
    damage = {
      default            = 350,
      gunships           = 75,
      hgunships          = 75,
      l1bombers          = 75,
      l1fighters         = 75,
      l1subs             = 5,
      l2bombers          = 75,
      l2fighters         = 75,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 75,
      vtol               = 75,
      vtrans             = 75,
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllbind_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
