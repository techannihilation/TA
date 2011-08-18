-- UNITDEF -- WATCHER --
--------------------------------------------------------------------------------

local unitName = "watcher"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.05,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.08,
  buildCostEnergy    = 629,
  buildCostMetal     = 90,
  builder            = false,
  buildTime          = 6443,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Batlefield Radar and Sonar Hovercraft]],
  designation        = [[CORE-HOVERRADAR]],
  downloadable       = 1,
  energyMake         = 15,
  energyStorage      = 0,
  energyUse          = 50,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft radar]],
  frenchname         = [[Watcher]],
  germandescription  = [[Radar Hovercraft]],
  germanname         = [[Watcher]],
  italiandescription = [[Radar Hovercraft]],
  italianname        = [[Watcher]],
  maneuverleashlength = 640,
  maxDamage          = 510,
  maxSlope           = 16,
  maxVelocity        = 2.6,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Watcher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[WATCHER]],
  onoffable          = true,
  radarDistance      = 1600,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 250,
  sonarDistance      = 1240,
  spanishdescription = [[Radar Hovercraft]],
  spanishname        = [[Watcher]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 240,
  unitname           = [[watcher]],
  unitnumber         = 401,
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
      [[hovmdok2]],
    },
    select = {
      [[hovmdsl2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Watcher Wreckage]],
    featureDead        = [[heap]],
    featurereclaimate  = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 60,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[watcher_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Watcher Heap]],
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
