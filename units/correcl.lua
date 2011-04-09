-- UNITDEF -- CORRECL --
--------------------------------------------------------------------------------

local unitName = "correcl"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.038,
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 6568,
  buildCostMetal     = 416,
  buildDistance      = 100,
  builder            = true,
  buildPic           = [[CORRECL.DDS]],
  buildTime          = 9495,
  canAssist          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canResurrect       = true,
  canstop            = 1,
  category           = [[ALL NOWEAPON NOTAIR]],
  collisionvolumeoffsets = [[0 0 -5]],
  collisionvolumescales = [[60 20 80]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  defaultmissiontype = [[Standby]],
  description        = [[Ressurection Sub]],
  energyMake         = 2,
  energyStorage      = 0,
  energyUse          = 2,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[sea]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 621,
  maxVelocity        = 2.47,
  metalStorage       = 0,
  minWaterDepth      = 20,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT4]],
  name               = [[Death Cavalry]],
  noAutoFire         = false,
  objectName         = [[CORRECL]],
  resurrect          = 1,
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  side               = [[CORE]],
  sightDistance      = 156,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  turnRate           = 282,
  unitname           = [[correcl]],
  waterline          = 30,
  workerTime         = 450,
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
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
      [[suarmmov]],
    },
    select = {
      [[suarmsel]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
