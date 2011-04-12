-- UNITDEF -- AMGEO --
--------------------------------------------------------------------------------

local unitName = "amgeo"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 0,
  buildCostEnergy    = 94852,
  buildCostMetal     = 2520,
  builder            = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX = 11,
  buildingGroundDecalSizeY = 11,
  buildingGroundDecalType = [[amgeo_aoplane.dds]],
  buildPic           = [[AMGEO.DDS]],
  buildTime          = 70152,
  category           = [[ALL NOTSUB NOWEAPON NOTAIR]],
  description        = [[Hazardous Energy Source]],
  energyMake         = 2500,
  energyStorage      = 2500,
  energyUse          = 0,
  explodeAs          = [[NUCLEAR_MISSILE]],
  footprintX         = 5,
  footprintZ         = 8,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 6240,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Moho Geothermal Powerplant]],
  noAutoFire         = false,
  objectName         = [[AMGEO]],
  seismicSignature   = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  TEDClass           = [[ENERGY]],
  turnRate           = 0,
  unitname           = [[amgeo]],
  useBuildingGroundDecal = true,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo oGGGo oGGGo ooooo]],
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
