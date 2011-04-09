-- UNITDEF -- TLLCOPTER --
--------------------------------------------------------------------------------

local unitName = "tllcopter"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.16,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 4,
  buildCostEnergy    = 2492,
  buildCostMetal     = 843,
  builder            = false,
  buildTime          = 15211,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL WEAPON NOTSUB ALL]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 55,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Heavy Gunship]],
  designation        = [[tll-cop]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hélicoptère de combat]],
  germandescription  = [[Kampfhubschrauber]],
  hoverAttack        = true,
  italiandescription = [[Elicottero]],
  maneuverleashlength = 1280,
  maxDamage          = 2155,
  maxSlope           = 10,
  maxVelocity        = 7,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  name               = [[Dark Crow]],
  noAutoFire         = false,
  noChaseCategory    = [[vtol]],
  objectName         = [[tllcopter]],
  ovradjust          = 1,
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Helicóptero de combate]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 720,
  unitname           = [[tllcopter]],
  unitnumber         = 890,
  version            = 3.1,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[tllvtolstop2]],
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
      [[tllvtolgo2]],
    },
    select = {
      [[vtolarac]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[VTOL_EMG]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[VTOL_EMG]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  VTOL_EMG = {
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
      flakboats          = 8,
      flaks              = 8,
      gunships           = 2,
      hgunships          = 2,
      l1bombers          = 2,
      l1fighters         = 2,
      l1subs             = 1,
      l2bombers          = 2,
      l2fighters         = 2,
      l2subs             = 1,
      l3subs             = 1,
      vradar             = 2,
      vtol               = 2,
      vtrans             = 2,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
