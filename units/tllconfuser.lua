         -- UNITDEF -- TLLCONFUSER --
--------------------------------------------------------------------------------

local unitName = "tllconfuser"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.2,
  buildCostEnergy    = 527,
  buildCostMetal     = 177,
  builder            = false,
  buildTime          = 5775,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL NOWEAPON LEVEL2 NOTAIR NOTSUB MOBILE ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .75,
  defaultmissiontype = [[Standby]],
  description        = [[Radar Jammer Kbot]],
  designation        = [[]],
  energyMake         = 10,
  energyUse          = 80,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Brouilleur de radar]],
  germandescription  = [[Radarst�rer]],
  maneuverleashlength = 320,
  maxDamage          = 611,
  maxSlope           = 32,
  maxVelocity        = 1.02,
  maxWaterDepth      = 112,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Confuser]],
  noAutoFire         = false,
  objectName         = [[TLLCONFUSER]],
  onoffable          = true,
  radarDistanceJam   = 1000,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 200,
  smoothAnim         = true,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 825,
  unitname           = [[tllconfuser]],
  unitnumber         = 863,
  version            = 3.1,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[varmstop]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[varmmove]],
    },
    select = {
      [[tlljam3]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllconfuser_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
