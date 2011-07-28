-- UNITDEF -- ARMPASPD --
--------------------------------------------------------------------------------

local unitName = "armpaspd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1487,
  ai_limit           = [[limit ARMPASPD 2]],
  ai_weight          = [[weight ARMPASPD 0]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 7075,
  buildCostMetal     = 796,
  builder            = false,
  buildTime          = 10378,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  cloakCost          = 100,
  cloakCostMoving    = 400,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Paralysis Sniper]],
  designation        = [[ARM-PASPD]],
  energyMake         = 0.7,
  energyStorage      = 0,
  energyUse          = 0.7,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 271,
  maxVelocity        = 1.5,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  minCloakDistance   = 140,
  mobilestandorders  = 1,
  movementClass      = [[TKBOT3]],
  name               = [[Wolf]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMPASPD]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 785,
  spanishdescription = [[Francotirador Paralizante]],
  spanishname        = [[Lobo]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1011,
  unitname           = [[armpaspd]],
  unitnumber         = 6527,
  version            = 1.2,
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
      [[spider2]],
    },
    select = {
      [[spider3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMPASPD]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMPASPD = {
    areaOfEffect       = 32,
    beamWeapon         = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.0025,
    energypershot      = 500,
    explosionGenerator = [[custom:FLASH1nd]],
    fireStarter        = -100,
    id                 = 140,
    impactonly         = 1,
    impulserboost      = 0,
    impulserfactor     = 0,
    intensity          = 0.75,
    lineOfSight        = true,
    name               = [[Sub-Zero Weapon]],
    noradar            = 1,
    noSelfDamage       = true,
    paralyzer          = true,
    paralyzeTime       = 20,
    range              = 900,
    reloadtime         = 10,
    renderType         = 0,
    rgbColor           = [[1 1 0]],
    soundHit           = [[xplolrg2]],
    soundHitVolume     = 12,
    soundStart         = [[sniper2]],
    soundStartVolume   = 12,
    thickness          = 0.5,
    turret             = true,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 6000,
    damage = {
      default            = 2400,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wolf Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armpaspd_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wolf Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
