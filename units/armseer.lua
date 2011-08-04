-- UNITDEF -- ARMSEER --
--------------------------------------------------------------------------------

local unitName = "armseer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0418,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.0165,
  buildCostEnergy    = 1941,
  buildCostMetal     = 115,
  builder            = false,
  buildPic           = [[ARMSEER.DDS]],
  buildTime          = 6186,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Radar Vehicle]],
  energyMake         = 8,
  energyStorage      = 0,
  energyUse          = 20,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 880,
  maxSlope           = 16,
  maxVelocity        = 2.024,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Seer]],
  noAutoFire         = false,
  objectName         = [[ARMSEER]],
  onoffable          = true,
  radarDistance      = 2300,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 900,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 5,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 25,
  turnRate           = 605,
  unitname           = [[armseer]],
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
      [[varmmove]],
    },
    select = {
      [[avradsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Seer Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMSEER_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Seer Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
