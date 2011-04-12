-- UNITDEF -- TU95-A --
--------------------------------------------------------------------------------

local unitName = "tu95-a"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.19,
  ai_limit           = [[limit Tu95-A 6]],
  ai_weight          = [[weight Tu95-A 4]],
  altfromsealevel    = 1,
  attackrunlength    = 302,
  badTargetCategory  = [[Underwater]],
  bankscale          = 1.3,
  bmcode             = 1,
  brakeRate          = 3,
  buildCostEnergy    = 80342,
  buildCostMetal     = 6810,
  builder            = false,
  buildTime          = 135337,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL ]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 320,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Long Ammo Heavy Bomber]],
  designation        = [[MST Tu-95 Bear-A]],
  downloadable       = 1,
  energyMake         = 30,
  energyStorage      = 0,
  energyUse          = 20,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Bombardier lourd]],
  frenchname         = [[Tu-95 Bear-A]],
  germandescription  = [[Schwerer Bomber]],
  germanname         = [[Tu-95 Bear-A]],
  italiandescription = [[Heavy Bomber]],
  italianname        = [[Tu-95 Bear-A]],
  maneuverleashlength = 2200,
  maxDamage          = 24620,
  maxSlope           = 10,
  maxVelocity        = 7.1,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Tu95 Bear-A]],
  noAutoFire         = false,
  noChaseCategory    = [[Underwater]],
  objectName         = [[Tu95-A]],
  ovradjust          = 1,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 400,
  spanishdescription = [[Heavy Bomber]],
  spanishname        = [[Tu-95 Bear-A]],
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 215,
  unitname           = [[tu95-a]],
  unitnumber         = 8009,
  upright            = true,
  version            = 2,
  workerTime         = 0,
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
      [[vtolcrmv]],
    },
    select = {
      [[vtolcrac]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[FAB-500]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ["FAB-500"] = {
    areaOfEffect       = 182,
    balistic           = 1,
    burst              = 110,
    burstrate          = 0.03,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    dropped            = true,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    gravityaffected    = [[true]],
    guidance           = false,
    id                 = 132,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    manualBombSettings = true,
    model              = [[FAB-500]],
    name               = [[FAB-500]],
    range              = 1280,
    reloadtime         = 20.14,
    renderType         = 6,
    soundHit           = [[xplomed2]],
    soundStart         = [[bombrel]],
    sprayAngle         = 4096,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    waterWeapon        = false,
    weaponType         = [[AircraftBomb]],
    damage = {
      default            = 190,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
