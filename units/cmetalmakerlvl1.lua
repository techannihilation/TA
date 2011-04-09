-- UNITDEF -- CMETALMAKERLVL1 --
--------------------------------------------------------------------------------

local unitName = "cmetalmakerlvl1"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 3739,
  buildCostMetal     = 134,
  builder            = false,
  buildTime          = 1745,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  description        = [[Upgraded Metal Maker]],
  designation        = [[MM-15]],
  energyStorage      = 0,
  energyUse          = 170,
  explodeAs          = [[ARMESTOR_BUILDING]],
  floater            = true,
  footprintX         = 4,
  footprintZ         = 3,
  makesMetal         = 3,
  maxDamage          = 324,
  maxSlope           = 10,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  name               = [[T1.5 Metal Maker]],
  objectName         = [[CMetalMakerLvl1]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[ARMESTOR_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 210,
  TEDClass           = [[METAL]],
  unitname           = [[cmetalmakerlvl1]],
  workerTime         = 0,
  yardMap            = [[OOOOOOOOOOOO]],
  sounds = {
    activate           = [[metlon2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff2]],
    underattack        = [[warning1]],
    working            = [[metlrun2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon2]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
