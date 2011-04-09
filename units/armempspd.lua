-- UNITDEF -- ARMEMPSPD --
--------------------------------------------------------------------------------

local unitName = "armempspd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.13,
  buildCostEnergy    = 4005,
  buildCostMetal     = 53,
  builder            = false,
  buildTime          = 5971,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK LEVEL2 WEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[Standby]],
  description        = [[Paralyzes Core Units]],
  designation        = [[ARM-EMPSPDB]],
  energyMake         = 0.1,
  energyStorage      = 0,
  energyUse          = 0.1,
  explodeAs          = [[ARMEMPM_WEAPON]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  kamikaze           = true,
  kamikazeDistance   = 80,
  maneuverleashlength = 640,
  maxDamage          = 177,
  maxSlope           = 32,
  maxVelocity        = 1.2,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[ADT]],
  name               = [[EMP Spider Bomb]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMEMPSPD]],
  radarDistance      = 0,
  selfDestructAs     = [[ARMEMPM_WEAPON]],
  selfDestructCountdown = 0,
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 215,
  spanishdescription = [[Paraliza Unidades del Nucleo]],
  spanishname        = [[Bomba Araña EMP]],
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 1400,
  unitname           = [[armempspd]],
  unitnumber         = 74,
  version            = 1.2,
  workerTime         = 0,
  wpri_badtargetcategory = [[VTOL]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[spider2]],
    },
    select = {
      [[spdemp1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
