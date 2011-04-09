-- UNITDEF -- TLLFIGHT --
--------------------------------------------------------------------------------

local unitName = "tllfight"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.45,
  badTargetCategory  = [[NOTAIR]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 4,
  buildCostEnergy    = 1683,
  buildCostMetal     = 154,
  buildTime          = 9585,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL LEVEL1 WEAPON NOTSUB]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 140,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Fighter]],
  designation        = [[TL-fg]],
  energyMake         = 1,
  energyUse          = 1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  frenchdescription  = [[Chasseur]],
  germandescription  = [[Jäger]],
  iconType           = [[air]],
  idleAutoHeal       = 5,
  italiandescription = [[Caccia]],
  maneuverleashlength = 1280,
  maxDamage          = 433,
  maxSlope           = 10,
  maxVelocity        = 9.5,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  moverate1          = 8,
  name               = [[Sparrow]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTAIR]],
  objectName         = [[tllfight]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Caza]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 480,
  unitname           = [[tllfight]],
  unitnumber         = 917,
  upright            = true,
  version            = 3.1,
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
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[TLLVTOL_MISSILE]],
    },
    [2]  = {
      def                = [[TLLVTOL_MISSILE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLVTOL_MISSILE = {
    areaOfEffect       = 48,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 134,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[tllvtolmissile]],
    name               = [[Guided Missiles]],
    noSelfDamage       = true,
    range              = 530,
    reloadtime         = 1,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[Rocklit3]],
    startVelocity      = 420,
    texture2           = [[armsmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 16384,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 146,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 480,
    damage = {
      commanders         = 1,
      default            = 0.001,
      gunships           = 90,
      hgunships          = 80,
      l1bombers          = 240,
      l1fighters         = 87,
      l1subs             = 5,
      l2bombers          = 160,
      l2fighters         = 20,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 50,
      vtol               = 50,
      vtrans             = 70,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
