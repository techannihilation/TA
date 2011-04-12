-- UNITDEF -- CORBLOCK3 --
--------------------------------------------------------------------------------

local unitName = "corblock3"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  brakeRate          = 0,
  buildCostEnergy    = 2650,
  buildCostMetal     = 1170,
  builder            = false,
  buildingGroundDecalDecaySpeed = 0.0010000000474975,
  buildingGroundDecalSizeX = 4,
  buildingGroundDecalSizeY = 4,
  buildingGroundDecalType = [[corblock1.dds]],
  buildPic           = [[block3.png]],
  buildTime          = 8000,
  canAttack          = false,
  category           = [[TERRAFORM]],
  description        = [[Makes plataform for tidal]],
  footprintX         = 10,
  footprintZ         = 10,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  isFeature          = false,
  levelGround        = false,
  mass               = 0,
  maxDamage          = 2500,
  maxSlope           = 255,
  maxVelocity        = 0,
  minCloakDistance   = 150,
  name               = [[Core Lake]],
  objectName         = [[1x1A special1]],
  seismicSignature   = 4,
  selfDestructCountdown = 1,
  side               = [[CORE]],
  sightDistance      = 0,
  turnRate           = 0,
  unitname           = [[corblock3]],
  upright            = false,
  useBuildingGroundDecal = false,
  workerTime         = 0,
  yardMap            = 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
  customparams = {
    dontcount          = 1,
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
