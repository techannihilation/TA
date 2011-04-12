-- UNITDEF -- CORHELO --
--------------------------------------------------------------------------------

local unitName = "corhelo"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.45,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 3,
  buildCostEnergy    = 3697,
  buildCostMetal     = 155,
  builder            = false,
  buildTime          = 2510,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 60,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Scout helicopter]],
  designation        = [[AH-02]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 3,
  hoverAttack        = true,
  maneuverleashlength = 600,
  maxDamage          = 230,
  maxSlope           = 10,
  maxVelocity        = 12,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Harrier]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[corhelo]],
  onlytargetcategory1 = [[NOTAIR]],
  onlytargetcategory2 = [[NOTAIR]],
  radarDistance      = 1900,
  scale              = 1,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 455,
  unitname           = [[corhelo]],
  unitnumber         = 1986,
  upright            = true,
  version            = 2,
  workerTime         = 0,
  zbuffer            = 1,
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
