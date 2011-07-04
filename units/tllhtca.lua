-- UNITDEF -- TLLHTCA --
--------------------------------------------------------------------------------

local unitName = "tllhtca"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.035,
  amphibious         = 1,
  bankscale          = 1.5,
  bmcode             = 1,
  brakeRate          = 1.5,
  buildCostEnergy    = 45000,
  buildCostMetal     = 1000,
  buildDistance      = 75,
  builder            = true,
  buildTime          = 42000,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[TLL VTOL LEVEL2  NOWEAPON NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 75,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[High Tech Construction Aircraft]],
  designation        = [[TLL-CA2]],
  energyMake         = 50,
  energyStorage      = 500,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Niveau Tech 2]],
  frenchname         = [[Avion de constr. évolué]],
  germandescription  = [[Tech Level 2]],
  germanname         = [[Verb. Konstr.-Flugzeug]],
  healtime           = 10,
  maneuverleashlength = 1280,
  maxDamage          = 2500,
  maxSlope           = 10,
  maxVelocity        = 7.5,
  maxWaterDepth      = 255,
  metalMake          = 2.5,
  metalStorage       = 500,
  mobilestandorders  = 1,
  name               = [[High Tech Air Builder]],
  noAutoFire         = false,
  objectName         = [[TLLHTCA]],
  ovradjust          = 1,
  scale              = 0.8,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 500,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[CNSTR]],
  threed             = 1,
  turnRate           = 250,
  unitname           = [[tllhtca]],
  unitnumber         = 9111,
  version            = 3.1,
  workerTime         = 500,
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    repair             = [[repair1]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
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
