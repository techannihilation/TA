-- UNITDEF -- CORRAID1 --
--------------------------------------------------------------------------------

local unitName = "corraid1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0243,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.0254,
  buildCostEnergy    = 2799,
  buildCostMetal     = 365,
  builder            = false,
  buildPic           = [[CORRAID.DDS]],
  buildTime          = 3312,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[CORRAID_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Assault Tank]],
  energyMake         = 0.6,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 2864,
  maxSlope           = 10,
  maxVelocity        = 2.48,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Rugged Raider]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORRAID1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 335,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 30,
  turnRate           = 429.8,
  unitname           = [[corraid1]],
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_LIGHTCANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LIGHTCANNON = {
    areaOfEffect       = 68,
    avoidFeature       = false,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:LIGHT_PLASMA]],
    fireStarter        = 100,
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[LightCannon]],
    noSelfDamage       = true,
    range              = 370,
    reloadtime         = 1.4,
    renderType         = 4,
    soundHit           = [[xplosml3]],
    soundStart         = [[canlite3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 230,
    damage = {
      default            = 140,
      gunships           = 18,
      hgunships          = 18,
      l1bombers          = 18,
      l1fighters         = 18,
      l1subs             = 5,
      l2bombers          = 18,
      l2fighters         = 18,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 18,
      vtol               = 18,
      vtrans             = 18,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORRAID_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Rugged Raider Wreckage]],
    energy             = 0,
    featureDead        = [[CORRAID_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORRAID_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORRAID_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Raider Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
