-- UNITDEF -- TLLRIOT --
--------------------------------------------------------------------------------

local unitName = "tllriot"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.015,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.009629395,
  buildCostEnergy    = 2350,
  buildCostMetal     = 308,
  builder            = false,
  buildTime          = 5840,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK LEVEL2 WEAPON ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Support Tank]],
  designation        = [[MAD-PAC]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[armtank]],
  maneuverleashlength = 640,
  maxDamage          = 902,
  maxSlope           = 12,
  maxVelocity        = 1.3,
  maxWaterDepth      = 100,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[ATANK3]],
  name               = [[Pacifier]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tllriot]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 260,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 340,
  unitname           = [[tllriot]],
  version            = 1,
  workerTime         = 0,
  zbuffer            = 1,
  customparams = {
    requiretech        = [[tank2]],
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
      name               = [[ArmPac_Gun]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 400,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 266,
    object             = [[tllriot_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 200,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 193,
    object             = [[2x2d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
