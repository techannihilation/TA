-- UNITDEF -- ARMCS --
--------------------------------------------------------------------------------

local unitName = "armcs"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.05,
  bmcode             = 1,
  brakeRate          = 0.05,
  buildCostEnergy    = 2130,
  buildCostMetal     = 255,
  buildDistance      = 250,
  builder            = true,
  buildPic           = [[ARMCS.DDS]],
  buildTime          = 5121,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB NOWEAPON SHIP NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Tech Level 1]],
  energyMake         = 25,
  energyStorage      = 100,
  energyUse          = 25,
  explodeAs          = [[SMALL_UNITEX]],
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[sea]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 1105,
  maxVelocity        = 2.53,
  metalMake          = 0.25,
  metalStorage       = 100,
  minWaterDepth      = 15,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Construction Ship]],
  noAutoFire         = false,
  objectName         = [[ARMCS]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  side               = [[arm]],
  sightDistance      = 291.2,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 750,
  turnRate           = 448,
  waterline          = 1,
  unitname           = [[armcs]],
  workerTime         = 250,
  buildoptions = {
    [[armtide]],
    [[armgeo]],
    [[armuwmex]],
    [[armfmkr]],
    [[armeyes]],
    [[armuwms]],
    [[armuwes]],
    [[armsy]],
    [[armasy]],
    [[armfhp]],
    [[asubpen]],
    [[armsonar]],
    [[armfrad]],
    [[armfdrag]],
    [[armdl]],
    [[armfrt]],
    [[armfhlt]],
    [[armtl]],
    [[armplat]],
    [[armhevsenan]],
    [[armrech3]],
  },
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    repair             = [[repair1]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Construction Ship Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMCS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Construction Ship Heap]],
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
