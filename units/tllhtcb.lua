-- UNITDEF -- TLLHTCB --
--------------------------------------------------------------------------------

local unitName = "tllhtcb"

--------------------------------------------------------------------------------
--Experimental
local unitDef = {
  acceleration       = 0.018,
  bmcode             = 1,
  brakeRate          = 0.036,
  buildCostEnergy    = 29448,
  buildCostMetal     = 5436,
  buildDistance      = 185,
  builder            = true,
  buildTime          = 67242,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[TLL LEVEL2 NOWEAPON NOTAIR NOTSUB MOBILE CONSTR ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Tech Level 3]],
  designation        = [[]],
  energyMake         = 25,
  energyStorage      = 100,
  energyUse          = 0.1,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Niveau Tech 3]],
  frenchname         = [[Véhicule de constr. évolué]],
  germandescription  = [[Tech Level 3]],
  germanname         = [[Verb. Konstr.-Fahrzeug]],
  maneuverleashlength = 320,
  maxDamage          = 2124,
  maxSlope           = 16,
  maxVelocity        = 1.65,
  maxWaterDepth      = 18,
  metalMake          = 0.55,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[High Tech Construction Vehicle]],
  noAutoFire         = false,
  objectName         = [[TLLHTCB]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 230,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 250,
  unitname           = [[tllhtcb]],
  unitnumber         = 835,
  version            = 3.1,
  workerTime         = 320,
  zbuffer            = 1,
  buildoptions = {
    [[tllmegacoldfus]],
    [[tllgate1]],
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
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhtcb_dead]],
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
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
