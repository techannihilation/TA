-- UNITDEF -- TLLGRIM --
--------------------------------------------------------------------------------

local unitName = "tllgrim"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.21,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 196664,
  buildCostMetal     = 24489,
  builder            = false,
  buildTime          = 222193,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL KBOT WEAPON NOTAIR NOTSUB]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Anti T3/T4 Sniper K-bot]],
  designation        = [[TLL-GR]],
  downloadable       = 1,
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 1.1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 15918,
  maxSlope           = 20,
  maxVelocity        = 0.31,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[VKBOT4]],
  name               = [[Grim Reaper]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLGRIM]],
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 690,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1016,
  unitname           = [[tllgrim]],
  unitnumber         = 65200,
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
      [[mavbok1]],
    },
    select = {
      [[mavbsel1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLGRIM_GUN]],
    },
    [2]  = {
      def                = [[TLLGRIM_MISSILE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLGRIM_GUN = {
    areaOfEffect       = 75,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    energypershot      = 4000,
    id                 = 224,
    impactonly         = 1,
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 0.75,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -15,
    name               = [[Grim Canon]],
    range              = 1200,
    reloadtime         = 8,
    renderType         = 4,
    soundHit           = [[XPLOSML1]],
    soundStart         = [[canzipx]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 2200,
    damage = {
      commanders         = 900,
      default            = 200,
      t3mechs            = 18000,
      t4mechs            = 26000,
    },
  },
  TLLGRIM_MISSILE = {
    areaOfEffect       = 100,
    explosionart       = [[explode2]],
    explosiongaf       = [[fx]],
    fireStarter        = 100,
    flightTime         = 10,
    guidance           = true,
    id                 = 228,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Wolf Missile]],
    noautorange        = 1,
    range              = 500,
    reloadtime         = 3.1,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .0001,
    smokeTrail         = true,
    soundHit           = [[xplomed2]],
    soundStart         = [[MISLITE1]],
    startsmoke         = 1,
    tolerance          = 20000,
    turnRate           = 2438400,
    vlaunch            = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 600,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 800,
    damage = {
      default            = 200,
    },
  },
}
unitDef.weaponDefs = weaponDefs

--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Grim Reaper Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllgrim_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
