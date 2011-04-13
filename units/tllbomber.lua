-- UNITDEF -- TLLBOMBER --
--------------------------------------------------------------------------------

local unitName = "tllbomber"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  attackrunlength    = 120,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 0.7,
  buildCostEnergy    = 2661,
  buildCostMetal     = 171,
  builder            = false,
  buildTime          = 6575,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL LEVEL1 WEAPON BOMB NOTSUB]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 200,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Bomber]],
  designation        = [[TL-BMB]],
  energyMake         = 0.5,
  energyUse          = 3.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Bombardier]],
  germandescription  = [[Bomber]],
  maneuverleashlength = 1280,
  maxDamage          = 605,
  maxSlope           = 10,
  maxVelocity        = 6.3,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  name               = [[Pterodactyl]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLBOMBER]],
  ovradjust          = 1,
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 356,
  unitname           = [[tllbomber]],
  unitnumber         = 918,
  version            = 3.1,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[tllvtolstop3]],
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
      [[tllvtolgo3]],
    },
    select = {
      [[vtolarac]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[TLLBOMB]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLBOMB = {
    accuracy           = 500,
    areaOfEffect       = 150,
    avoidFeature       = false,
    burst              = 6,
    burstrate          = 0.25,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    dropped            = true,
    edgeEffectiveness  = 0.25,
    explosionGenerator = [[custom:T1ARMBOMB]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.5,
    impulseFactor      = 0.5,
    manualBombSettings = true,
    model              = [[bomb]],
    name               = [[Bombs]],
    noSelfDamage       = true,
    range              = 1280,
    reloadtime         = 4,
    renderType         = 6,
    soundHit           = [[xplomed2]],
    soundStart         = [[bombrel]],
    sprayAngle         = 300,
    weaponType         = [[AircraftBomb]],
    damage = {
      antibomber         = 60,
      default            = 165,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
