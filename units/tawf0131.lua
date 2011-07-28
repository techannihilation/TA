-- UNITDEF -- TAWF0131 --
--------------------------------------------------------------------------------

local unitName = "tawf0131"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0154,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.0154,
  buildCostEnergy    = 2016,
  buildCostMetal     = 242,
  builder            = false,
  buildPic           = [[TAWF013.DDS]],
  buildTime          = 2998,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[TAWF013_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[upgraded Light Artillery Vehicle]],
  energyMake         = 1,
  energyStorage      = 0,
  energyUse          = 1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  highTrajectory     = 1,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 930,
  maxSlope           = 15,
  maxVelocity        = 2.158,
  maxWaterDepth      = 8,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Precise Shellshocker ]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TAWF0131]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 364,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 30,
  turnRate           = 393.8,
  unitname           = [[tawf0131]],
  workerTime         = 0,
  customparams = {
    canareaattack      = 1,
  },
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
      def                = [[TAWF113_WEAPON1]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 180,
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TAWF113_WEAPON1 = {
    accuracy           = 100,
    areaOfEffect       = 90,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH4]],
    gravityaffected    = [[true]],
    hightrajectory     = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[LightArtillery]],
    noSelfDamage       = true,
    range              = 750,
    reloadtime         = 3,
    renderType         = 4,
    soundHit           = [[TAWF113b]],
    soundStart         = [[TAWF113a]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 370,
    damage = {
      default            = 210,
      gunships           = 13,
      hgunships          = 13,
      l1bombers          = 13,
      l1fighters         = 13,
      l1subs             = 5,
      l2bombers          = 13,
      l2fighters         = 13,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 13,
      vtol               = 13,
      vtrans             = 13,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  TAWF013_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Precise Shellshocker Wreckage]],
    energy             = 0,
    featureDead        = [[TAWF013_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 24,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TAWF013_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  TAWF013_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Precise Shellshocker Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
