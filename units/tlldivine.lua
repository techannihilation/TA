-- UNITDEF -- TLLDIVINE --
--------------------------------------------------------------------------------

local unitName = "tlldivine"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.042,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.012,
  buildCostEnergy    = 355,
  buildCostMetal     = 292,
  builder            = false,
  buildTime          = 3853,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL NOWEAPON LEVEL2 NOTAIR NOTSUB MOBILE ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Radar]],
  designation        = [[]],
  energyUse          = 70,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Radar mobile]],
  germandescription  = [[Mobiles Radar]],
  italiandescription = [[Radar mobile]],
  maneuverleashlength = 320,
  maxDamage          = 835,
  maxSlope           = 16,
  maxVelocity        = 1.55,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Divine]],
  noAutoFire         = false,
  objectName         = [[TLLDIVINE]],
  onoffable          = true,
  radarDistance      = 2200,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 320,
  spanishdescription = [[Radar móvil]],
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 380,
  unitname           = [[tlldivine]],
  unitnumber         = 839,
  version            = 3.1,
  zbuffer            = 1,
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
      [[varmsel]],
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
    object             = [[tlldivine_dead]],
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
