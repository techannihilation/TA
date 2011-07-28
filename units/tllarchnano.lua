-- UNITDEF -- TLLARCHNANO --
--------------------------------------------------------------------------------

local unitName = "tllarchnano"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.36,
  bmcode             = 1,
  brakeRate          = 0.07,
  buildCostEnergy    = 2636,
  buildCostMetal     = 581,
  buildDistance      = 150,
  builder            = true,
  buildTime          = 13917,
  cainrepair         = 1,
  canCapture         = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[TLL TANK LEVEL3 CONSTR NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Ampibious Repair K-bot]],
  designation        = [[]],
  energyMake         = 11,
  energyUse          = 3,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[KBot de reparation amphibie]],
  germandescription  = [[Amphibischer Reparatur KBot]],
  maneuverleashlength = 320,
  maxDamage          = 1705,
  maxSlope           = 255,
  maxVelocity        = 3,
  maxWaterDepth      = 255,
  metalMake          = .4,
  mobilestandorders  = 1,
  movementClass      = [[AKBOT2]],
  name               = [[Archnano]],
  noAutoFire         = false,
  objectName         = [[TLLARCHNANO]],
  ovradjust          = 1,
  radarDistance      = 100,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 305,
  smoothAnim         = true,
  sonarDistance      = 100,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 1020,
  unitname           = [[tllarchnano]],
  unitnumber         = 877,
  version            = 3.1,
  workerTime         = 280,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[spider]],
    },
    cant = {
      [[tllspidcant]],
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
      [[spider]],
    },
    select = {
      [[tllspidsel]],
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
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TLLARCHNANO_dead]],
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
    height             = 2,
    hitdensity         = 105,
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
