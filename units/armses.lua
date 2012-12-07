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
  category           = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
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
  name               = [[Advanced Energy Storage]],
  noAutoFire         = false,
  objectName         = [[ARMSES]],
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_BLASTSML]],
  side               = [[ARM]],
  sightDistance      = 192,
  threed             = 1,
  unitname           = [[armses]],
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
      [[storngy1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
