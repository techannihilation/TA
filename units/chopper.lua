-- UNITDEF -- CHOPPER --
--------------------------------------------------------------------------------

local unitName = "chopper"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.3,
  ai_limit           = [[limit CHOPPER 12]],
  ai_weight          = [[weight CHOPPER 3]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 6,
  buildCostEnergy    = 14249,
  buildCostMetal     = 880,
  builder            = false,
  buildTime          = 15385,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL ]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 70,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Heavy Helicopter Gunship]],
  designation        = [[AFD-J17]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Kampfhubschrauber]],
  frenchname         = [[Chopper]],
  germandescription  = [[Gunship]],
  germanname         = [[Chopper]],
  hoverAttack        = true,
  maneuverleashlength = 1280,
  maxDamage          = 1980,
  maxSlope           = 10,
  maxVelocity        = 5.0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Chopper]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CHOPPER]],
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 700,
  unitname           = [[chopper]],
  unitnumber         = 702,
  version            = 1,
  workerTime         = 0,
  wter_badtargetcategory = [[VTOL]],
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
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[VTOL_ROCKET5]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[VTOL_ROCKET5]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [3]  = {
      def                = [[VTOL_EMG6]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  VTOL_EMG6 = {
    areaOfEffect       = 8,
    burst              = 3,
    burstrate          = 0.1,
    craterBoost        = 0,
    craterMult         = 0,
    endsmoke           = 0,
    explosionGenerator = [[custom:BRAWLIMPACTS]],
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    intensity          = 0.8,
    lineOfSight        = true,
    name               = [[E.M.G.]],
    noSelfDamage       = true,
    pitchtolerance     = 12000,
    range              = 380,
    reloadtime         = 0.475,
    renderType         = 4,
    rgbColor           = [[1 0.95 0.4]],
    size               = 2.5,
    soundStart         = [[brawlemg]],
    sprayAngle         = 1024,
    startsmoke         = 0,
    tolerance          = 6000,
    turret             = false,
    weaponTimer        = 1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 450,
    damage = {
      commanders         = 8,
      default            = 16,
    },
  },
  VTOL_ROCKET5 = {
    areaOfEffect       = 128,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    name               = [[RiotCannon]],
    noSelfDamage       = true,
    pitchtolerance     = 12000,
    range              = 430,
    reloadtime         = 1.3,
    renderType         = 4,
    soundHit           = [[xplosml3]],
    soundStart         = [[canlite3]],
    soundTrigger       = true,
    startsmoke         = 1,
    turret             = false,
    weaponType         = [[Cannon]],
    weaponVelocity     = 600,
    damage = {
      commanders         = 53,
      default            = 39,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
