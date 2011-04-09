-- UNITDEF -- CORHEVSENAN --
--------------------------------------------------------------------------------

local unitName = "corhevsenan"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  brakeRate          = 1.5,
  buildCostEnergy    = 6578,
  buildCostMetal     = 299,
  buildDistance      = 600,
  builder            = true,
  buildPic           = [[corhevsenan.dds]],
  buildTime          = 11242,
  canGuard           = true,
  canMove            = false,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB ALL]],
  defaultmissiontype = [[Standby]],
  description        = [[Repairs and builds on big radius]],
  energyStorage      = 0,
  energyUse          = 30,
  explodeAs          = [[NANOBOOM2]],
  floater            = true,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 380,
  mass               = 999999999999,
  maxDamage          = 600,
  maxSlope           = 10,
  maxVelocity        = 0.0,
  metalStorage       = 0,
  minWaterDepth      = 5,
  name               = [[Floating Nano Turret]],
  noAutoFire         = false,
  objectName         = [[corhevsenan.s3o]],
  reclaimSpeed       = 600,
  repairSpeed        = 500,
  seismicSignature   = 1,
  selfDestructAs     = [[TINY_BUILDINGEX]],
  side               = [[CORE]],
  sightDistance      = 420,
  smoothAnim         = true,
  steeringmode       = 1,
  TEDClass           = [[CNSTR]],
  turnRate           = 1,
  unitname           = [[corhevsenan]],
  upright            = true,
  waterline          = 1,
  workerTime         = 300,
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
