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
  category           = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
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
  name               = [[Experimental Energy Storage]],
  noAutoFire         = false,
  objectName         = [[CORSES]],
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_BLASTSML]],
  side               = [[CORE]],
  sightDistance      = 192,
  threed             = 1,
  unitname           = [[corses]],
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
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
