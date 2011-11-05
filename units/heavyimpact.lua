-- UNITDEF -- HEAVYIMPACT --
--------------------------------------------------------------------------------

local unitName = "heavyimpact"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  badTargetCategory  = [[NOWEAPON]],
  brakeRate          = 0.1,
  buildCostEnergy    = 42090,
  buildCostMetal     = 2400,
  builder            = false,
  buildPic           = [[heavyimpact.DDS]],
  buildTime          = 9600,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[MOBILE LEVEL3 NOTAIR ALL]],
  corpse             = [[CORTHUDMKII_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Artillery Mech]],
  explodeAs          = [[BIG_UNIT]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[mech]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  mass               = 200000,
  maxDamage          = 15000,
  maxSlope           = 17,
  maxVelocity        = 1.1,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[VKBOT5]],
  name               = [[Thud MK-II]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[heavyimpact]],
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 400,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[KBOT]],
  turnRate           = 400,
  unitname           = [[heavyimpact]],
  upright            = true,
  customparams = {
    canareaattack      = 1,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:goliathflare]],
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
      [[mavbok1]],
    },
    select = {
      [[mavbsel1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORMECHART]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 140,
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORMECHART = {
    accuracy           = 300,
    areaOfEffect       = 256,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.6,
    explosionGenerator = [[custom:ORIONEXPLO]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    interceptedByShieldType = 1,
    minbarrelangle     = -35,
    name               = [[HeavyCannon]],
    noSelfDamage       = true,
    range              = 1450,
    reloadtime         = 1,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy5]],
    startsmoke         = 1,
    targetMoveError    = 0.25,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 600,
    damage = {
      default            = 400,
      gunships           = 100,
      hgunships          = 100,
      subs               = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORTHUDMKII_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 6030,
    description        = [[Wreckage]],
    energy             = 0,
    featureDead        = [[CORTHUDMKII_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = 1560,
    object             = [[CORTHUDMKII_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORTHUDMKII_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 3015,
    description        = [[Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = 624,
    object             = [[5X5B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
