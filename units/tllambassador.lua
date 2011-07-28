-- UNITDEF -- TLLAMBASSADOR --
--------------------------------------------------------------------------------

local unitName = "tllambassador"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.009,
  bmcode             = 1,
  brakeRate          = 0.0182,
  buildAngle         = 16384,
  buildCostEnergy    = 4950,
  buildCostMetal     = 945,
  builder            = false,
  buildTime          = 15438,
  canGuard           = true,
  canload            = 1,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Armored Transport Ship]],
  designation        = [[]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 0,
  floater            = true,
  footprintX         = 6,
  footprintZ         = 6,
  frenchdescription  = [[Cargo]],
  germandescription  = [[Transportschiff]],
  italiandescription = [[Nave da trasporto]],
  maneuverleashlength = 640,
  maxDamage          = 15200,
  maxVelocity        = 1.85,
  minWaterDepth      = 12,
  mobilestandorders  = 0,
  movementClass      = [[DBOAT6]],
  name               = [[Ambassador]],
  noAutoFire         = false,
  objectName         = [[TLLAMBASSADOR]],
  scale              = 0.5,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 250,
  spanishdescription = [[Transporte anfibio]],
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  transportCapacity  = 20,
  transportSize      = 3,
  turnRate           = 110,
  unitname           = [[tllambassador]],
  unitnumber         = 943,
  version            = 3.1,
  waterline          = 6,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
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
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllambassador_dead]],
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
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
