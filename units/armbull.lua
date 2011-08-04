-- UNITDEF -- ARMBULL --
--------------------------------------------------------------------------------

local unitName = "armbull"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0396,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.055,
  buildCostEnergy    = 14593,
  buildCostMetal     = 844,
  builder            = false,
  buildPic           = [[ARMBULL.DDS]],
  buildTime          = 17228,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Assault Tank]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 5400,
  maxSlope           = 12,
  maxVelocity        = 2.037,
  maxWaterDepth      = 15,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Bulldog]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMBULL]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 494,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 8,
  trackStrength      = 10,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 40,
  turnRate           = 378,
  unitname           = [[armbull]],
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      [[custom:MEDIUMFLARE]],
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_BULL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BULL = {
    areaOfEffect       = 140,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH72]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[PlasmaCannon]],
    noSelfDamage       = true,
    range              = 460,
    reloadtime         = 1.12,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannon3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 300,
    damage = {
      default            = 240,
      gunships           = 30,
      hgunships          = 30,
      l1bombers          = 30,
      l1fighters         = 30,
      l1subs             = 5,
      l2bombers          = 30,
      l2fighters         = 30,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 30,
      vtol               = 30,
      vtrans             = 30,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Bulldog Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMBULL_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Bulldog Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
