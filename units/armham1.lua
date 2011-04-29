-- UNITDEF -- ARMHAM1 --
--------------------------------------------------------------------------------

local unitName = "armham1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.225,
  buildCostEnergy    = 1231,
  buildCostMetal     = 191,
  builder            = false,
  buildPic           = [[ARMHAM.DDS]],
  buildTime          = 2210,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM KBOT MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[ARMHAM_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Light Plasma Kbot]],
  energyMake         = 0.6,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 1210,
  maxSlope           = 14,
  maxVelocity        = 2.14,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[upg Hammer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMHAM1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 380,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turnRate           = 1094,
  unitname           = [[armham1]],
  upright            = true,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_HAM1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_HAM1 = {
    areaOfEffect       = 36,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:LIGHTARMS]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    minbarrelangle     = -35,
    name               = [[PlasmaCannon]],
    noSelfDamage       = true,
    predictBoost       = 0.4,
    range              = 420,
    reloadtime         = 1.55,
    renderType         = 4,
    soundHit           = [[xplomed3]],
    soundStart         = [[cannon1]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 286,
    damage = {
      default            = 144,
      gunships           = 21,
      hgunships          = 21,
      l1bombers          = 21,
      l1fighters         = 21,
      l1subs             = 5,
      l2bombers          = 21,
      l2fighters         = 21,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 21,
      vtol               = 21,
      vtrans             = 21,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMHAM_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 486,
    description        = [[Hammer Wreckage]],
    energy             = 0,
    featureDead        = [[ARMHAM_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 40,
    hitdensity         = 100,
    metal              = 123,
    object             = [[ARMHAM_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMHAM_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 243,
    description        = [[Hammer Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 48,
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
