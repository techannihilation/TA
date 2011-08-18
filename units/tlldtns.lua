-- UNITDEF -- TLLDTNS --
--------------------------------------------------------------------------------

local unitName = "tlldtns"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 650,
  buildCostMetal     = 25,
  builder            = false,
  buildTime          = 930,
  category           = [[TLL LEVEL2 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[TLLFloatingTeeth]],
  description        = [[Floating perimeter defense]],
  designation        = [[TL-DTNS]],
  downloadable       = 1,
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Dent de dragon flottante]],
  frenchname         = [[Dent de dragon navale]],
  germandescription  = [[Schwimmende Barrikade]],
  germanname         = [[Marine-Barrikade]],
  isFeature          = true,
  italiandescription = [[Denti del Drago galleggiante]],
  italianname        = [[Denti del Drago-SN]],
  maxDamage          = 3700,
  maxSlope           = 32,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  minWaterDepth      = 1,
  name               = [[Dragon's Teeth - NS]],
  noAutoFire         = false,
  objectName         = [[TLLDTNS]],
  radarDistance      = 0,
  side               = [[TLL]],
  sightDistance      = 100,
  spanishdescription = [[Dragon's Teeth flotante]],
  spanishname        = [[Dragon's Teeth]],
  threed             = 1,
  unitname           = [[tlldtns]],
  unitnumber         = 938,
  version            = 1,
  waterline          = 11,
  workerTime         = 0,
  yardMap            = [[ww ww]],
  zbuffer            = 1,
}


--------------------------------------------------------------------------------

local featureDefs = {
  TLLFloatingTeeth = {
    autoreclaimable    = 0,
    blocking           = true,
    category           = [[dragonteeth]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Dragon's Teeth - NS]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 100,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    nodrawundergray    = true,
    object             = [[tlldtns]],
    reclaimable        = true,
    world              = [[allworld]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
