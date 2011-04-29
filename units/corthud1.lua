-- UNITDEF -- CORTHUD1 --
--------------------------------------------------------------------------------

local unitName = "corthud1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.113,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.225,
  buildCostEnergy    = 1061,
  buildCostMetal     = 162,
  builder            = false,
  buildPic           = [[CORTHUD.DDS]],
  buildTime          = 1971,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE KBOT MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[CORTHUD_DEAD]],
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
  maxDamage          = 1300,
  maxSlope           = 14,
  maxVelocity        = 2.01,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[upg Thud]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORTHUD1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 380,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turnRate           = 1099,
  unitname           = [[corthud1]],
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
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
  CORTHUD_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 540,
    description        = [[Thud Wreckage]],
    energy             = 0,
    featureDead        = [[CORTHUD_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 104,
    object             = [[CORTHUD_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORTHUD_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 270,
    description        = [[Thud Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 41,
    object             = [[2X2D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
