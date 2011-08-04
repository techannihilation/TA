-- UNITDEF -- ARMHDPW --
--------------------------------------------------------------------------------

local unitName = "armhdpw"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  bmcode             = 1,
  brakeRate          = 0.19,
  buildCostEnergy    = 20446,
  buildCostMetal     = 1920,
  builder            = false,
  buildTime          = 14800,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[The hunter hell.]],
  designation        = [[TAEF/ARM-HDPW]],
  downloadable       = 1,
  energyMake         = 5.5,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[PeeWee tout-terrains]],
  frenchname         = [[Hell DIVER]],
  germandescription  = [[Verb.geländegängiger PW]],
  germanname         = [[Hell DIVER]],
  italiandescription = [[Adv. All Terrain P.W.]],
  italianname        = [[Hell DIVER]],
  maneuverleashlength = 640,
  maxDamage          = 3750,
  maxSlope           = 187,
  maxVelocity        = 1.75,
  maxWaterDepth      = 35,
  metalStorage       = 0,
  minCloakDistance   = 37,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Hell DIVER]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  norestrict         = 1,
  objectName         = [[ARMHDPW]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 250,
  sonarDistance      = 300,
  spanishdescription = [[Adv. All Terrain P.W.]],
  spanishname        = [[Hell DIVER]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1050,
  unitname           = [[armhdpw]],
  unitnumber         = 14017,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[ARM_EMCC3]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[NOWEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ["ADV-EMG3"] = {
    areaOfEffect       = 12,
    beamWeapon         = true,
    burst              = 2,
    burstrate          = .2,
    energypershot      = 0,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 90,
    id                 = 219,
    lineOfSight        = true,
    model              = [[aemg]],
    name               = [[Advanced EMG]],
    range              = 660,
    reloadtime         = 0.4,
    renderType         = 1,
    soundHit           = [[XPLOMed2]],
    soundStart         = [[armkiller1]],
    soundTrigger       = true,
    sprayAngle         = 2048,
    tolerance          = 2500,
    turret             = true,
    weaponTimer        = 2,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 500,
    damage = {
      default            = 75,
    },
  },
  ARM_EMCC3 = {
    areaOfEffect       = 8,
    burst              = 4,
    burstrate          = .05,
    color              = 1,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 229,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Electro-Magnetic Compression Cannon]],
    range              = 715,
    reloadtime         = .15,
    renderType         = 4,
    soundHit           = [[lasrhit1]],
    soundStart         = [[armsml2]],
    soundTrigger       = true,
    sprayAngle         = 1024,
    startsmoke         = 1,
    tolerance          = 5000,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponTimer        = 1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 475,
    damage = {
      default            = 23,
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
    description        = [[Hell DIVER Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armhdpw_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Hell DIVER Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
