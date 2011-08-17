-- UNITDEF -- MAGILLA --
--------------------------------------------------------------------------------

local unitName = "magilla"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 12311,
  buildCostMetal     = 885,
  builder            = false,
  buildTime          = 17920,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy assault K-bot]],
  designation        = [[ARM-KI2]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Kbot d'assaut lourd]],
  frenchname         = [[Magilla]],
  germandescription  = [[Schwerer Angriffs - Kbot]],
  germanname         = [[Magilla]],
  maneuverleashlength = 640,
  maxDamage          = 5200,
  maxSlope           = 17,
  maxVelocity        = 1.2,
  maxWaterDepth      = 25,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Magilla]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[MAGILLA]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 700,
  unitname           = [[magilla]],
  unitnumber         = 963,
  upright            = true,
  version            = 1.2,
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[MAG_CANNON]],
      onlyTargetCategory = [[Notair]],
    },
     [2]  = {
      def                = [[MAG_ROCKET]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  MAG_CANNON = {
    areaOfEffect       = 8,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 117,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[MAG_Pulse]],
    name               = [[Magilla's Gun]],
    range              = 370,
    reloadtime         = .96,
    renderType         = 1,
    soundHit           = [[Maghit]],
    soundStart         = [[Magfire]],
    sprayAngle         = 300,
    startsmoke         = 0,
    tolerance          = 6000,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponTimer        = 1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 520,
    damage = {
      default            = 290,
    },
  },
  MAG_ROCKET = {
    areaOfEffect       = 100,
    edgeEffectiveness  = 0.65,
    explosionart       = [[explode2]],
    explosiongaf       = [[fx]],
    fireStarter        = 46,
    flightTime         = 5,
    guidance           = true,
    id                 = 228,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[MAG_Rocket]],
    name               = [[Magilla Rockets]],
    noautorange        = 0,
    range              = 450,
    reloadtime         = 2.4,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[rocklit1]],
    startsmoke         = 1,
    startVelocity      = 400,
    tolerance          = 1000,
    tracks             = true,
    turnRate           = 44384,
    vlaunch            = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 350,
    weaponTimer        = 2,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 550,
    damage = {
      default            = 350,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Magilla Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[magilla_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Magilla Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
