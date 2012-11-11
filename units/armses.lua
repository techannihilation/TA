-- UNITDEF -- ARMSES --
--------------------------------------------------------------------------------

local unitName = "armses"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = false,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 14580,
  buildCostMetal     = 960,
  builder            = false,
  buildTime          = 38130,
  category           = [[ARM NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL3 NOTLAND       ALL]],
  cloakCost          = 250,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  description        = [[Increases Energy Storage By 15K]],
  designation        = [[AE-ESF]],
  energyStorage      = 15000,
  energyUse          = -250,
  explodeAs          = [[ESTOR_BUILDING]],
  footprintX         = 6,
  footprintZ         = 6,
  maxDamage          = 3200,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  minCloakDistance   = 100,
  name               = [[Advanced Energy Storage]],
  noAutoFire         = false,
  objectName         = [[ARMSES]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_BLASTSML]],
  side               = [[ARM]],
  sightDistance      = 192,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[armses]],
  unitnumber         = 27,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
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
      [[storngy1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
