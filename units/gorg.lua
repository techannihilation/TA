-- UNITDEF -- GORG --
--------------------------------------------------------------------------------

local unitName = "gorg"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.048,
  bmcode             = 1,
  brakeRate          = 0.125,
  buildCostEnergy    = 681165,
  buildCostMetal     = 31705,
  builder            = false,
  buildPic           = [[GORG.DDS]],
  buildTime          = 529630,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT WEAPON ALL NOTSUB NOTAIR]],
  corpse             = [[DEAD1]],
  defaultmissiontype = [[Standby]],
  description        = [[(barely) Mobile Heavy Turret]],
  energyMake         = 35,
  explodeAs          = [[NUCLEAR_MISSILE3]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  maneuverleashlength = 640,
  mass               = 2e+06,
  maxDamage          = 540000,
  maxSlope           = 14,
  maxVelocity        = 0.95,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[VKBOT5]],
  name               = [[Juggernaut]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[GORG]],
  seismicSignature   = 0,
  selfDestructAs     = [[CRBLMSSL2]],
  side               = [[CORE]],
  sightDistance      = 720,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turnRate           = 109,
  unitname           = [[gorg]],
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
      [[doom]],
    },
    select = {
      [[doom]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[JUGGERNAUT_FIRE]],
    },
    [2]  = {
      mainDir            = [[1 0 4]],
      maxAngleDif        = 90,
      name               = [[GORG_BOTTOM]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [3]  = {
      mainDir            = [[-1 0 4]],
      maxAngleDif        = 90,
      name               = [[GORG_BOTTOM]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [4]  = {
      mainDir            = [[0 1 0]],
      maxAngleDif        = 270,
      name               = [[GORG_TOP]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  JUGGERNAUT_FIRE = {
    areaOfEffect       = 55,
    avoidFeature       = false,
    color              = 2,
    craterBoost        = 0,
    craterMult         = 0,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    minbarrelangle     = -50,
    name               = [[GaussCannon]],
    noExplode          = true,
    noSelfDamage       = true,
    pitchtolerance     = 12000,
    range              = 710,
    reloadtime         = 1,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[Krogun1]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[EmgCannon]],
    weaponVelocity     = 530,
    damage = {
      anniddm            = 225,
      default            = 580,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD1 = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 327000,
    description        = [[Juggernaut Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP1]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 8,
    hitdensity         = 100,
    metal              = 35959,
    object             = [[GORG_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP1 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 213500,
    description        = [[Juggernaut Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 2,
    hitdensity         = 100,
    metal              = 22793,
    object             = [[4X4A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
