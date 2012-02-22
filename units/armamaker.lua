-- UNITDEF -- ARMAMAKER --
--------------------------------------------------------------------------------

local unitName = "armamaker"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 2500,
  buildCostMetal     = 65,
  builder            = false,
  buildPic           = [[ARMAMAKER.DDS]],
  buildTime          = 2330,
  category           = [[LEVEL2 NOTAIR ALL]],
  description        = [[Converts Energy to Metal]],
  energyStorage      = 0,
  energyUse          = 200,
  explodeAs          = [[ARMESTOR_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  makesMetal         = 2.5,
  maxDamage          = 250,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Metal Maker]],
  noAutoFire         = false,
  objectName         = [[ARMAMAKER]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructAs     = [[ARMESTOR_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  TEDClass           = [[METAL]],
  turnRate           = 0,
  unitname           = [[armamaker]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
