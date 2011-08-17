-- UNITDEF -- TLLSHAM --
--------------------------------------------------------------------------------

local unitName = "tllsham"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 1500,
  buildCostMetal     = 120,
  buildDistance      = 90,
  builder            = true,
  buildTime          = 2416,
  canAssist          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canResurrect       = true,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  cloakCost          = 25,
  cloakCostMoving    = 95,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Resurrection Kbot]],
  designation        = [[COR-RES]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Kbot de resurrection]],
  frenchname         = [[LOL!]],
  germandescription  = [[Resurrection Kbot]],
  germanname         = [[LOL!]],
  healtime           = 5,
  italiandescription = [[Kbot Resurrection]],
  italianname        = [[Necro]],
  maneuverleashlength = 640,
  maxDamage          = 250,
  maxSlope           = 14,
  maxVelocity        = 2.2,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  minCloakDistance   = 10,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Shaman]],
  noAutoFire         = false,
  objectName         = [[TLLSHAM]],
  resurrect          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 500,
  smoothAnim         = true,
  spanishdescription = [[Kbot Resurrection]],
  spanishname        = [[Necro]],
  standingmoveorder  = 2,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1000,
  unitname           = [[tllsham]],
  unitnumber         = 256,
  upright            = true,
  version            = 1.2,
  workerTime         = 218,
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
      [[necrok2]],
    },
    select = {
      [[necrsel2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Dead Shaman]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TLLSHAM_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Extra Dead Shaman]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
