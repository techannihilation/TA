-- UNITDEF -- ARMRECH27 --
--------------------------------------------------------------------------------

local unitName = "armrech27"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildCostEnergy    = 1000000,
  buildCostMetal     = 20000,
  builder            = false,
  buildTime          = 50000,
  category           = [[ARM SPECIAL NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  description        = [[Advanced Experimental Research Center]],
  designation        = [[LAB-01]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[COMMANDER_BLAST]],
  footprintX         = 5,
  footprintZ         = 7,
  frenchdescription  = [[Labo de recherche experimentale]],
  frenchname         = [[Labo de recherche experimentale]],
  germandescription  = [[Experimentelles Forschungslabor]],
  germanname         = [[Experimentelles Forschungslabor]],
  maxDamage          = 200000,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Experimental Research Center]],
  noAutoFire         = false,
  objectName         = [[LABORECH]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[COMMANDER_BLAST]],
  side               = [[ARM]],
  sightDistance      = 0,
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[armrech27]],
  unitnumber         = 7210,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooo ooooooo ooooooo ooooooo ooooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[radar1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[radarde1]],
    underattack        = [[warning1]],
    working            = [[radar1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[radar1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
