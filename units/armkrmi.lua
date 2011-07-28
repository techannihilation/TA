-- UNITDEF -- ARMKRMI --
--------------------------------------------------------------------------------

local unitName = "armkrmi"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.19,
  buildCostEnergy    = 42560,
  buildCostMetal     = 1967,
  builder            = false,
  buildTime          = 67214,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Assault Experimental Kbot]],
  designation        = [[ARM-KRMI]],
  downloadable       = 1,
  energyMake         = 1.1,
  energyStorage      = 0,
  energyUse          = 1.1,
  explodeAs          = [[ATOMIC_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Kbot Expérimental]],
  frenchname         = [[Krypto]],
  germandescription  = [[Experimenteller K-bot]],
  germanname         = [[Krypto]],
  healtime           = 27,
  italiandescription = [[Kbot sperimentale]],
  italianname        = [[Krypto]],
  maneuverleashlength = 640,
  maxDamage          = 7024,
  maxSlope           = 17,
  maxVelocity        = 3,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[vkbot4]],
  name               = [[Krally]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMKRMI]],
  radarDistance      = 1500,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 255,
  spanishdescription = [[Kbot experimental]],
  spanishname        = [[Krypto]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 960,
  unitname           = [[armkrmi]],
  unitnumber         = 9521,
  upright            = true,
  version            = 1.0,
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
      def                = [[ARMKRMI_ROCKET]],
    },
    [2]  = {
      def                = [[ARMKRMI_LIGHT]],
      onlyTargetCategory = [[Notair]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMKRMI_LIGHT = {
    areaOfEffect       = 8,
    beamWeapon         = true,
    color              = 144,
    color2             = 255,
    duration           = 10,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 50,
    id                 = 163,
    lineOfSight        = true,
    name               = [[Lightning Gun]],
    range              = 350,
    reloadtime         = 1.2,
    renderType         = 7,
    soundHit           = [[lashit]],
    soundStart         = [[lghthvy1]],
    soundTrigger       = true,
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 400,
    damage = {
      default            = 400,
    },
  },
  ARMKRMI_ROCKET = {
    areaOfEffect       = 96,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    fireStarter        = 100,
    flightTime         = 10,
    guidance           = true,
    id                 = 165,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[krmirck]],
    name               = [[Rocket]],
    noautorange        = 1,
    range              = 1000,
    reloadtime         = 16,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    tolerance          = 4000,
    turnRate           = 24384,
    twoPhase           = true,
    vlaunch            = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 440,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 400,
    damage = {
      default            = 2000,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Krypto Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armkrmi_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Krypto Heap]],
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
