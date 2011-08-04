-- UNITDEF -- TLLOBSCURER --
--------------------------------------------------------------------------------

local unitName = "tllobscurer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.041,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.024,
  buildCostEnergy    = 972,
  buildCostMetal     = 112,
  builder            = false,
  buildTime          = 6622,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL NOWEAPON LEVEL2 NOTAIR NOTSUB MOBILE ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Radar Jammer]],
  designation        = [[]],
  energyUse          = 140,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Brouilleur de radar mobile]],
  germandescription  = [[Mobiler Radarstörer]],
  maneuverleashlength = 640,
  maxDamage          = 832,
  maxSlope           = 16,
  maxVelocity        = 1.7,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Obscurer]],
  noAutoFire         = false,
  objectName         = [[TLLOBSCURER]],
  onoffable          = true,
  radarDistanceJam   = 1350,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 230,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 512,
  unitname           = [[tllobscurer]],
  unitnumber         = 838,
  version            = 3.1,
  zbuffer            = 1,
  sounds = {
    activate           = [[tlljam2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[radjam1]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 120,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllobscurer_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 80,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
