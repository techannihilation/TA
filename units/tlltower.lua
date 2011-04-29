-- UNITDEF -- TLLTOWER --
--------------------------------------------------------------------------------

local unitName = "tlltower"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 950,
  buildCostMetal     = 41,
  builder            = false,
  buildTime          = 5372,
  category           = [[TLL LEVEL1 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Watch Tower]],
  designation        = [[TL-TWT]],
  energyMake         = -5,
  energyUse          = 8,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Tour de guet]],
  maxDamage          = 283,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Hasseloff]],
  noAutoFire         = false,
  objectName         = [[TLLtower]],
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 1000,
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[tlltower]],
  unitnumber         = 1809,
  version            = 1,
  yardMap            = [[oooo]],
  zbuffer            = 1,
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 360,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 27,
    object             = [[tlltower_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 300,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 11,
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
