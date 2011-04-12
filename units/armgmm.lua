-- UNITDEF -- ARMGMM --
--------------------------------------------------------------------------------

local unitName = "armgmm"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 36230,
  buildCostMetal     = 1858,
  builder            = false,
  buildPic           = [[ARMGMM.DDS]],
  buildTime          = 41347,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  description        = [[Safe Geothermal Powerplant]],
  digger             = 1,
  energyMake         = 1600,
  energyStorage      = 1500,
  explodeAs          = [[BIG_BUILDINGEX]],
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 19800,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  name               = [[Prude]],
  noAutoFire         = false,
  objectName         = [[ARMGMM]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  TEDClass           = [[METAL]],
  turnRate           = 0,
  unitname           = [[armgmm]],
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooGoo ooooo ooooo]],
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
      [[geothrm1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
