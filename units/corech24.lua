-- UNITDEF -- CORECH24 --
--------------------------------------------------------------------------------

local unitName = "corech24"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildCostEnergy    = 3000000,
  buildCostMetal     = 150000,
  builder            = false,
  buildTime          = 50000,
  category           = [[ARM SPECIAL NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  description        = [[Open T4 Tech]],
  designation        = [[LAB-01]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[COMMANDER_BLAST]],
  floater            = true,
  footprintX         = 5,
  footprintZ         = 7,
  frenchdescription  = [[Labo de recherche experimentale]],
  frenchname         = [[Labo de recherche experimentale]],
  germandescription  = [[Experimentelles Forschungslabor]],
  germanname         = [[Experimentelles Forschungslabor]],
  maxDamage          = 70000,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[T4 Tech]],
  noAutoFire         = false,
  objectName         = [[LABORECH]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[COMMANDER_BLAST]],
  side               = [[ARM]],
  sightDistance      = 0,
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[corech24]],
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
