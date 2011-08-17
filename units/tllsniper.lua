-- UNITDEF -- TLLSNIPER --
--------------------------------------------------------------------------------

local unitName = "tllsniper"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 1227,
  buildCostMetal     = 1410,
  builder            = false,
  buildTime          = 31007,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL KBOT LEVEL2 WEAPON NOTAIR ]],
  cloakCost          = 600,
  cloakCostMoving    = 1350,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Sniper Kbot]],
  designation        = [[TL-SNI]],
  downloadable       = 1,
  energyMake         = 5,
  energyStorage      = 0,
  energyUse          = 0.9,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Kbot Tireur d'Elite]],
  germandescription  = [[Scharfschützen-Kbot]],
  italiandescription = [[Kbot cecchino]],
  maneuverleashlength = 640,
  maxDamage          = 440,
  maxSlope           = 14,
  maxVelocity        = 1.1,
  maxWaterDepth      = 22,
  metalStorage       = 0,
  minCloakDistance   = 50,
  mobilestandorders  = 1,
  movementClass      = [[kbot2]],
  name               = [[Assassin]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLSNIPER]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 690,
  smoothAnim         = true,
  spanishdescription = [[Kbot francotirador]],
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1216,
  unitname           = [[tllsniper]],
  unitnumber         = 931,
  upright            = true,
  version            = 3.1,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORPROT_WEAPON]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORPROT_WEAPON = {
    areaOfEffect       = 16,
    beamWeapon         = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.0025,
    energypershot      = 1000,
    explosionGenerator = [[custom:FLASH1nd]],
    impactonly         = 1,
    impulseBoost       = 0.234,
    impulseFactor      = 0.234,
    intensity          = 0.75,
    lineOfSight        = true,
    name               = [[Ball]],
    noradar            = 1,
    noSelfDamage       = true,
    range              = 1100,
    reloadtime         = 10.6,
    renderType         = 0,
    rgbColor           = [[1 1 0]],
    soundHit           = [[xplomed21]],
    soundHitVolume     = 4,
    soundStart         = [[Rocklit3]],
    soundStartVolume   = 4,
    thickness          = 0.5,
    turret             = true,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 6000,
    damage = {
      commanders         = 1300,
      default            = 3495,
      t3mechs            = 7100,
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
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsniper_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2e]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
