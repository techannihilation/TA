-- UNITDEF -- ARMBLAB --
--------------------------------------------------------------------------------

local unitName = "armblab"

--------------------------------------------------------------------------------

local unitDef = {
  ai_limit           = [[limit ARMBLAB 1]],
  ai_weight          = [[weight ARMBLAB 6]],
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 4756,
  buildCostMetal     = 1270,
  builder            = true,
  buildTime          = 14004,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[DEAD]],
  description        = [[Produces All-Terrain Kbots]],
  designation        = [[sWs-ABL]],
  downloadable       = 1,
  energyStorage      = 80,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Produit des clones]],
  frenchname         = [[Bio Lab]],
  germandescription  = [[Produziert Klone]],
  germanname         = [[Bio Lab]],
  maxDamage          = 2234,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 80,
  mobilestandorders  = 1,
  name               = [[Spider Lab [CORE]],
  noAutoFire         = false,
  objectName         = [[ARMBLAB]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 202,
  standingmoveorder  = 1,
  stealth            = true,
  threed             = 1,
  unitname           = [[armblab]],
  unitnumber         = 2003,
  version            = 3.0,
  workerTime         = 200,
  yardMap            = [[00000 0CCC0 0CCC0 0CCC0 0CCC0]],
  zbuffer            = 1,
  buildoptions = {
    [[armcspid]],
    [[armrezspd]],
    [[armflspd]],
    [[armpaspd]],
    [[armamspd]],
    [[cortermite]],
    [[cormena]],
    [[corroach]],
    [[corsktl]],
  },
  sounds = {
    build              = [[plabwork]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[untdone]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[plabactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Spider lab Wreckage]],
    featureDead        = [[HEAP]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armBlab_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Spider lab Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
