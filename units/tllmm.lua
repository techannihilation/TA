-- UNITDEF -- TLLMM --
--------------------------------------------------------------------------------

local unitName = "tllmm"

--------------------------------------------------------------------------------
-- GADGETED
local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 160,
  buildCostMetal     = 16,
  builder            = false,
  buildTime          = 2000,
  category           = [[TLL  LEVEL1 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.4,
  description        = [[Converts upto 100 Energy into Metal]],
  designation        = [[]],
  explodeAs          = [[ARMESTOR_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Convertit l'énergie en métal]],
  frenchname         = [[Métallo]],
  germandescription  = [[Wandelt Energie in Metall um]],
  germanname         = [[Metallgenerator]],
  italiandescription = [[Converte energia in metallo]],
  italianname        = [[Generatore di Metallo]],
  maxDamage          = 172,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Metal Maker]],
  noAutoFire         = false,
  objectName         = [[TLLMM]],
  onoffable          = true,
  selfDestructAs     = [[ARMESTOR_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Transforma energía en metal]],
  spanishname        = [[Productor de Metal]],
  threed             = 1,
  unitname           = [[tllmm]],
  unitnumber         = 814,
  version            = 3.1,
  yardMap            = [[ooo ooo ooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[metlon1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff1]],
    underattack        = [[warning1]],
    working            = [[metlrun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllmm_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 2,
    hitdensity         = 58,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3A]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
