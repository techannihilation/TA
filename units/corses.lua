-- UNITDEF -- CORSES --
--------------------------------------------------------------------------------

local unitName = "corses"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = false,
  bmcode             = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 14940,
  buildCostMetal     = 1000,
  builder            = false,
  buildTime          = 38250,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL3 NOTLAND          ALL]],
  cloakCost          = 250,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  description        = [[Increases Energy Storage By 15K]],
  designation        = [[AE-ESF]],
  energyStorage      = 50000,
  energyUse          = -250,
  explodeAs          = [[ESTOR_BUILDING]],
  footprintX         = 6,
  footprintZ         = 6,
  maxDamage          = 3424,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  minCloakDistance   = 100,
  name               = [[Experimental Energy Storage]],
  noAutoFire         = false,
  objectName         = [[CORSES]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_BLASTSML]],
  side               = [[CORE]],
  sightDistance      = 192,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[corses]],
  unitnumber         = 27,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo oooooo oooooo ]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[storngy2]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
