-- UNITDEF -- TLLSHARK --
--------------------------------------------------------------------------------

local unitName = "tllshark"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.02,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.10,
  buildCostEnergy    = 5643,
  buildCostMetal     = 90,
  builder            = false,
  buildTime          = 8455,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL MOBILE WEAPON NOTLAND NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[18 18 28]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[Standby]],
  description        = [[Kamikaze Sub]],
  designation        = [[TL-KS]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[CRAWL_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Sous-marin Kamikaze]],
  frenchname         = [[Requin]],
  kamikaze           = true,
  kamikazeDistance   = 50,
  maneuverleashlength = 640,
  maxDamage          = 250,
  maxVelocity        = 3.85,
  metalStorage       = 0,
  minWaterDepth      = 20,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT2]],
  name               = [[Shark]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLSHARK]],
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  selfDestructCountdown = 2,
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  threed             = 1,
  turnRate           = 400,
  unitname           = [[tllshark]],
  unitnumber         = 906,
  version            = 3.1,
  waterline          = 30,
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
      [[torpok1]],
    },
    select = {
      [[torpsel1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
