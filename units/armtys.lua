-- UNITDEF -- ARMTYS --
--------------------------------------------------------------------------------

local unitName = "armtys"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.43756,
  badTargetCategory  = [[VTOL]],
  bankscale          = .6,
  bmcode             = 1,
  brakeRate          = 1.5465,
  buildCostEnergy    = 6731,
  buildCostMetal     = 298,
  builder            = false,
  buildTime          = 8342,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 80,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Land attack helicopter]],
  designation        = [[HELI-TYSON]],
  downloadable       = 1,
  energyMake         = 6,
  energyStorage      = 0,
  energyUse          = 12,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hélicoptère d'attaque terrestre lance-missiles]],
  frenchname         = [[Tyson]],
  germandescription  = [[Raketen Angriffshubschrauber]],
  germanname         = [[Tyson]],
  hoverAttack        = true,
  maneuverleashlength = 200,
  maxDamage          = 1230,
  maxSlope           = 100,
  maxVelocity        = 6.3243,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Tyson]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[armTYS]],
  onlytargetcategory2 = [[NOTAIR]],
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 325,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 850,
  unitname           = [[armtys]],
  unitnumber         = 4017,
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
      [[vtolarmv]],
    },
    select = {
      [[vtolarac]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[GMISSILES]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GMISSILES = {
    areaOfEffect       = 48,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 235,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Guided Missiles]],
    range              = 310,
    reloadtime         = 1,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[Rocklit3]],
    startsmoke         = 1,
    startVelocity      = 420,
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 163840,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 246,
    weaponTimer        = 3,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 800,
    damage = {
      default            = 50,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
