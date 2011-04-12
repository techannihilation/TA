-- UNITDEF -- TLLCRAWLB --
--------------------------------------------------------------------------------

local unitName = "tllcrawlb"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.3,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.12,
  buildCostEnergy    = 1741,
  buildCostMetal     = 372,
  builder            = false,
  buildTime          = 7993,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL KBOT WEAPON LEVEL2 NOTAIR NOTSUB KAMIKAZE]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Crawling Bomb]],
  designation        = [[TL-CWB]],
  energyMake         = 0.1,
  energyStorage      = 0,
  energyUse          = 0.1,
  explodeAs          = [[CRAWL_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  frenchdescription  = [[Bombe rampante]],
  germandescription  = [[Kriech-Bombe]],
  italiandescription = [[Bomba a grappolo]],
  kamikaze           = true,
  kamikazeDistance   = 42,
  maneuverleashlength = 640,
  maxDamage          = 1155,
  maxSlope           = 32,
  maxVelocity        = 2.859,
  maxWaterDepth      = 115,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[kbot1]],
  name               = [[Armadillo]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLCRAWLB]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  selfDestructCountdown = 1,
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 110,
  spanishdescription = [[Bomba de asalto]],
  standingfireorder  = 0,
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 512,
  unitname           = [[tllcrawlb]],
  unitnumber         = 927,
  version            = 3.1,
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
      [[servsml6]],
    },
    select = {
      [[servsml6]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
