-- UNITDEF -- TLLSHAM --
--------------------------------------------------------------------------------

local unitName = "tllsham"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 12500,
  buildCostMetal     = 500,
  buildDistance      = 75,
  builder            = true,
  buildTime          = 11416,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canResurrect       = true,
  canstop            = 1,
  category           = [[CORE LEVEL2 NOWEAPON NOTAIR NOTSUB MOBILE CONSTR CTRL_B]],
  cloakCost          = 10,
  cloakCostMoving    = 25,
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
  maxDamage          = 2500,
  maxSlope           = 14,
  maxVelocity        = 1.4,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  minCloakDistance   = 10,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Shaman]],
  noAutoFire         = false,
  objectName         = [[TLLSHAM]],
  resurrect          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 500,
  spanishdescription = [[Kbot Resurrection]],
  spanishname        = [[Necro]],
  standingmoveorder  = 2,
  stealth            = true,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 1000,
  unitname           = [[tllsham]],
  unitnumber         = 256,
  upright            = true,
  version            = 1.2,
  workerTime         = 500,
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
    category           = [[TLL_corpses]],
    damage             = 1200,
    description        = [[Dead Shaman]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 350,
    object             = [[TLLSHAM_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 900,
    description        = [[Extra Dead Shaman]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 150,
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
