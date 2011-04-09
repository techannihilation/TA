-- UNITDEF -- TLLPROB --
--------------------------------------------------------------------------------

local unitName = "tllprob"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.4,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 10,
  buildCostEnergy    = 821,
  buildCostMetal     = 78,
  builder            = false,
  buildTime          = 2302,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL CTRL_V LEVEL1 NOWEAPON NOTSUB ]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 180,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Air Scout]],
  designation        = [[TL-PB]],
  energyMake         = 0.1,
  energyStorage      = 0,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Avion de reconnaissance]],
  germandescription  = [[Luftaufklärer]],
  italiandescription = [[Unità di ricognizione aerea]],
  maneuverleashlength = 1280,
  maxDamage          = 96,
  maxSlope           = 10,
  maxVelocity        = 11.5,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Mosquito]],
  noAutoFire         = false,
  objectName         = [[tllprob]],
  ovradjust          = 1,
  radarDistance      = 920,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Avión de reconocimiento]],
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 800,
  unitname           = [[tllprob]],
  unitnumber         = 916,
  version            = 3.1,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[tllvtolstop]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[tllvtolgo]],
    },
    select = {
      [[vtolarac]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
