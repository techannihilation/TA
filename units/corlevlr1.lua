-- UNITDEF -- CORLEVLR1 --
--------------------------------------------------------------------------------

local unitName = "corlevlr1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0364,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.3618,
  buildCostEnergy    = 3187,
  buildCostMetal     = 448,
  builder            = false,
  buildPic           = [[CORLEVLR.DDS]],
  buildTime          = 3009,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ANTIEMG ANTIGATOR ALL]],
  corpse             = [[CORLEVLR_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Riot Tank]],
  energyMake         = 0.3,
  energyStorage      = 0,
  energyUse          = 0.3,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 2005,
  maxSlope           = 17,
  maxVelocity        = 1.4265,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Savage Leveler]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORLEVLR1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 286,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  trackOffset        = 7,
  trackStrength      = 6,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 30,
  turnRate           = 366.2,
  unitname           = [[corlevlr1]],
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
      def                = [[CORLEVLR_WEAPON1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORLEVLR_WEAPON1 = {
    areaOfEffect       = 180,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.75,
    explosionGenerator = [[custom:FLASH64]],
    impulseBoost       = 0.55,
    impulseFactor      = 0.55,
    lineOfSight        = true,
    name               = [[RiotCannon]],
    noSelfDamage       = false,
    range              = 375,
    reloadtime         = 2,
    renderType         = 4,
    soundHit           = [[xplosml3]],
    soundStart         = [[canlite3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 650,
    damage = {
      commanders         = 110,
      default            = 345,
      gunships           = 27,
      hgunships          = 27,
      l1bombers          = 27,
      l1fighters         = 27,
      l1subs             = 5,
      l2bombers          = 27,
      l2fighters         = 27,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 27,
      vtol               = 27,
      vtrans             = 27,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORLEVLR_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Savage Leveler Wreckage]],
    energy             = 0,
    featureDead        = [[CORLEVLR_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORLEVLR_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORLEVLR_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Leveler Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
