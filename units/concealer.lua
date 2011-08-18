-- UNITDEF -- CONCEALER --
--------------------------------------------------------------------------------

local unitName = "concealer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.06,
  buildCostEnergy    = 1869,
  buildCostMetal     = 190,
  builder            = false,
  buildTime          = 6156,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Radar-Jamming Hovercraft]],
  designation        = [[ARM-HOVERJAMMER]],
  downloadable       = 1,
  energyMake         = 25,
  energyStorage      = 0,
  energyUse          = 100,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft brouille-radar]],
  frenchname         = [[Concealer]],
  germandescription  = [[Radarstör Hovercraft]],
  germanname         = [[Concealer]],
  italiandescription = [[Radar-Jamming Hovercraft]],
  italianname        = [[Concealer]],
  maneuverleashlength = 640,
  maxDamage          = 600,
  maxSlope           = 16,
  maxVelocity        = 2.7,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Concealer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CONCEALER]],
  onoffable          = true,
  radarDistanceJam   = 480,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 290,
  spanishdescription = [[Radar-Jamming Hovercraft]],
  spanishname        = [[Concealer]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 260,
  unitname           = [[concealer]],
  unitnumber         = 406,
  version            = 1.0,
  workerTime         = 0,
  wpri_badtargetcategory = [[VTOL]],
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
      [[kbarmmov]],
    },
    select = {
      [[radjam1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Concealer Wreckage]],
    featureDead        = [[heap]],
    featurereclaimate  = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 60,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CONCEALER_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Concealer Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
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
