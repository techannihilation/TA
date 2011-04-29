-- UNITDEF -- ARMFLASH1 --
--------------------------------------------------------------------------------

local unitName = "armflash1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  badTargetCategory  = [[ANTIEMG]],
  bmcode             = 1,
  brakeRate          = 0.065,
  buildCostEnergy    = 914,
  buildCostMetal     = 199,
  builder            = false,
  buildPic           = [[ARMFLASH.DDS]],
  buildTime          = 1963,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[ARMFLASH_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Very Fast Assault Tank]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 1170,
  maxSlope           = 10,
  maxVelocity        = 3.1,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[upg Flash]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMFLASH1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 299,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  trackOffset        = 5,
  trackStrength      = 4,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 22,
  turnRate           = 592,
  unitname           = [[armflash1]],
  workerTime         = 0,
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
      badTargetCategory  = [[ANTIEMG]],
      def                = [[EMGX]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  EMGX = {
    areaOfEffect       = 8,
    burst              = 3,
    burstrate          = 0.1,
    craterBoost        = 0,
    craterMult         = 0,
    endsmoke           = 0,
    explosionGenerator = [[custom:EMG_HIT]],
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    intensity          = 0.7,
    lineOfSight        = true,
    name               = [[flash]],
    noSelfDamage       = true,
    range              = 180,
    reloadtime         = 0.31,
    renderType         = 4,
    rgbColor           = [[1 0.95 0.4]],
    size               = 1.75,
    soundStart         = [[flashemg]],
    sprayAngle         = 1180,
    startsmoke         = 0,
    tolerance          = 5000,
    turret             = true,
    weaponTimer        = 0.1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 500,
    damage = {
      default            = 11,
      gunships           = 3,
      hgunships          = 3,
      l1bombers          = 3,
      l1fighters         = 3,
      l1subs             = 1,
      l2bombers          = 3,
      l2fighters         = 3,
      l2subs             = 1,
      l3subs             = 1,
      vradar             = 3,
      vtol               = 3,
      vtrans             = 3,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMFLASH_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 366,
    description        = [[Flash Wreckage]],
    energy             = 0,
    featureDead        = [[ARMFLASH_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 128,
    object             = [[ARMFLASH_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMFLASH_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 183,
    description        = [[Flash Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 50,
    object             = [[2X2C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
