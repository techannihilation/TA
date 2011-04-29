-- UNITDEF -- CORMIST1 --
--------------------------------------------------------------------------------

local unitName = "cormist1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0352,
  badTargetCategory  = [[ALL]],
  bmcode             = 1,
  brakeRate          = 0.0165,
  buildCostEnergy    = 2177,
  buildCostMetal     = 246,
  builder            = false,
  buildPic           = [[CORMIST.DDS]],
  buildTime          = 3065,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[CORMIST_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[upgraded Missile Truck]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 1420,
  maxSlope           = 16,
  maxVelocity        = 1.584,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[upg Slasher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORMIST1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 620,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  trackOffset        = -6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 30,
  turnRate           = 498,
  unitname           = [[cormist1]],
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      [[custom:rocketflare]],
    },
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[CORTRUCK_MISSILE1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORTRUCK_MISSILE1 = {
    areaOfEffect       = 48,
    burst              = 2,
    burstrate          = 0.5,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Missiles]],
    noSelfDamage       = true,
    range              = 700,
    reloadtime         = 3,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed2]],
    soundStart         = [[rockhvy2]],
    startsmoke         = 1,
    startVelocity      = 450,
    texture2           = [[coresmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    trajectoryHeight   = 0.75,
    turnRate           = 63000,
    turret             = true,
    weaponAcceleration = 109,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 545,
    damage = {
      commanders         = 72,
      default            = 42,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORMIST_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 672,
    description        = [[Slasher Wreckage]],
    energy             = 0,
    featureDead        = [[CORMIST_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 158,
    object             = [[CORMIST_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORMIST_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 336,
    description        = [[Slasher Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 61,
    object             = [[3X3F]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
