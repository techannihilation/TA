-- UNITDEF -- TLLBOAT2 --
--------------------------------------------------------------------------------

local unitName = "tllboat2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.05,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.021,
  buildAngle         = 16384,
  buildCostEnergy    = 10607,
  buildCostMetal     = 921,
  builder            = false,
  buildTime          = 16022,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Laser Destroyer]],
  designation        = [[TL-SHK]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Destroyer laser]],
  germandescription  = [[Laser Schlachtschiff]],
  maneuverleashlength = 640,
  maxDamage          = 2901,
  maxVelocity        = 3.05,
  minWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Shrinker]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLboat2]],
  scale              = 0.5,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 330,
  sonarDistance      = 305,
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  threed             = 1,
  turnRate           = 215,
  unitname           = [[tllboat2]],
  unitnumber         = 165,
  version            = 3.1,
  waterline          = 6,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMTRUCK_MISSILE]],
    },
    [2]  = {
      def                = [[TLL_LASERSHIP]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMTRUCK_MISSILE = {
    areaOfEffect       = 48,
    burst              = 2,
    burstrate          = 0.25,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Missiles]],
    noSelfDamage       = true,
    range              = 600,
    reloadtime         = 3.34,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed2]],
    soundStart         = [[rockhvy2]],
    soundTrigger       = true,
    startsmoke         = 1,
    startVelocity      = 450,
    texture2           = [[armsmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    trajectoryHeight   = 0.50,
    turnRate           = 63000,
    turret             = true,
    weaponAcceleration = 108,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 540,
    damage = {
      commanders         = 50,
      default            = 25,
    },
  },
  TLL_LASERSHIP = {
    areaOfEffect       = 8,
    beamWeapon         = true,
    color              = 232,
    color2             = 234,
    energypershot      = 10,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 30,
    id                 = 220,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Ship Light Laser]],
    range              = 620,
    reloadtime         = .92,
    renderType         = 0,
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrfir3]],
    soundTrigger       = true,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 900,
    damage = {
      default            = 90,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 2652,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 590,
    object             = [[tllboat2_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1845,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 227,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
