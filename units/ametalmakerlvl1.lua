-- UNITDEF -- AMETALMAKERLVL1 --
--------------------------------------------------------------------------------

local unitName = "ametalmakerlvl1"

--------------------------------------------------------------------------------
--GADGETED
local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 4795,
  buildCostMetal     = 143,
  builder            = false,
  buildTime          = 4000,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  description        = [[Converts upto 200 Energy to Metal]],
  designation        = [[AEM-EMM]],
  energyStorage      = 0,
  explodeAs          = [[ARMESTOR_BUILDING]],
  floater            = true,
  footprintX         = 3,
  footprintZ         = 3,
  maxDamage          = 300.2,
  maxSlope           = 10,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  name               = [[T1.5 Metal Maker]],
  objectName         = [[AMetalMakerLvl1]],
  radarDistance      = 0,
  selfDestructAs     = [[ARMESTOR_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 210,
  unitname           = [[ametalmakerlvl1]],
  workerTime         = 0,
  yardMap            = [[OOOOOOOOO]],
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

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
