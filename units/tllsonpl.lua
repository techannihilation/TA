-- UNITDEF -- TLLSONPL --
--------------------------------------------------------------------------------

local unitName = "tllsonpl"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.08,
  altfromsealevel    = 1,
  amphibious         = 1,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 4.2,
  buildCostEnergy    = 7941,
  buildCostMetal     = 151,
  builder            = false,
  buildTime          = 11646,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  canSubmerge        = true,
  category           = [[TLL VTOL LEVEL2 NOWEAPON NOTSUB ]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 210,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Sonar Aircraft]],
  designation        = [[TL-SONP]],
  downloadable       = 1,
  energyMake         = 12,
  energyStorage      = 0,
  energyUse          = 12,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Sonar Aéroporté]],
  germandescription  = [[Sonarflugzeug]],
  italiandescription = [[Sonar aerotrasportato]],
  maneuverleashlength = 1280,
  maxDamage          = 484,
  maxSlope           = 10,
  maxVelocity        = 9.65,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Swallow]],
  noAutoFire         = false,
  objectName         = [[tllsonpl]],
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  sonarDistance      = 1550,
  spanishdescription = [[Sonar Aerotransportado]],
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 455,
  unitname           = [[tllsonpl]],
  unitnumber         = 928,
  version            = 3.1,
  workerTime         = 0,
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
      [[seasonr2]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
