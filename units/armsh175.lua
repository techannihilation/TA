-- UNITDEF -- ARMSH175 --
--------------------------------------------------------------------------------

local unitName = "armsh175"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.40,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 3,
  buildCostEnergy    = 4567,
  buildCostMetal     = 191,
  builder            = false,
  buildTime          = 2183,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM VTOL LEVEL2 WEAPON NOTSUB ALL ]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 100,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Scout Helicopter]],
  designation        = [[ARMSH175-1]],
  energyMake         = 8,
  energyStorage      = 0,
  energyUse          = 7,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Scout Helicopter]],
  frenchname         = [[SH-175 Recon]],
  germandescription  = [[Scout Helicopter]],
  germanname         = [[SH-175 Recon]],
  hoverAttack        = true,
  maneuverleashlength = 1024,
  maxDamage          = 235,
  maxSlope           = 10,
  maxVelocity        = 11.7,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  moverate1          = 8,
  name               = [[SH-175 Recon]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSH175]],
  onlytargetcategory1 = [[NOTAIR]],
  radarDistance      = 1850,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 400,
  sonarDistance      = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 1200,
  unitname           = [[armsh175]],
  unitnumber         = 75654,
  version            = 3,
  workerTime         = 0,
  wpri_badtargetcategory = [[VTOL]],
  zbuffer            = 1,
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
