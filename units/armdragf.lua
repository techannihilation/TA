-- UNITDEF -- ARMDRAGF --
--------------------------------------------------------------------------------

local unitName = "armdragf"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 0.8,
  buildCostEnergy    = 1806,
  buildCostMetal     = 97,
  builder            = false,
  buildTime          = 9301,
  canFly             = true,
  canGuard           = true,
  canload            = 1,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  canSubmerge        = true,
  category           = [[ALL NOTLAND MOBILE NOTSUB VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 120,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Medium Amphibious Air Transport]],
  designation        = [[ARM-AAT]],
  energyMake         = 0.5,
  energyStorage      = 100,
  energyUse          = 0.5,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 0,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Adv. Air Transport]],
  frenchname         = [[Dragonfly]],
  germandescription  = [[Adv. Air Transport]],
  germanname         = [[Dragonfly]],
  isAirBase          = true,
  italiandescription = [[Adv. Air Transport]],
  italianname        = [[Dragonfly]],
  maneuverleashlength = 1280,
  maxDamage          = 700,
  maxSlope           = 10,
  maxVelocity        = 11.8,
  maxWaterDepth      = 255,
  metalStorage       = 100,
  mobilestandorders  = 0,
  name               = [[Drillerfly]],
  noAutoFire         = false,
  objectName         = [[ARMDRAGF]],
  ovradjust          = 1,
  radarDistance      = 0,
  scale              = 0.8,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 250,
  spanishdescription = [[Adv. Air Transport]],
  spanishname        = [[Dragonfly]],
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  transmaxunits      = 1,
  transportCapacity  = 1,
  transportSize      = 5,
  turnRate           = 138,
  unitname           = [[armdragf]],
  unitnumber         = 601,
  upright            = true,
  version            = 3.1,
  workerTime         = 0,
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
      [[vtolarmv]],
    },
    select = {
      [[vtolarac]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
