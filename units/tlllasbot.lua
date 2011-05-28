-- UNITDEF -- TLLLASBOT --
--------------------------------------------------------------------------------

local unitName = "tlllasbot"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 2914,
  buildCostMetal     = 392,
  builder            = false,
  buildTime          = 8250,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL KBOT LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Laser Kbot]],
  designation        = [[TL-LB]],
  downloadable       = 1,
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maneuverleashlength = 640,
  maxDamage          = 1370,
  maxSlope           = 14,
  maxVelocity        = 1.2,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Iguana]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLLASBOT]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 405,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 816,
  unitname           = [[tlllasbot]],
  unitnumber         = 925,
  upright            = true,
  version            = 3.1,
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
      def                = [[TLL_LASERH1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_LASERH1 = {
    areaOfEffect       = 10,
    beamTime           = 1,
    beamWeapon         = true,
    color              = 114,
    color2             = 217,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 44,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 90,
    id                 = 41,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[High Energy Laser]],
    noSelfDamage       = true,
    range              = 330,
    reloadtime         = 1,
    renderType         = 0,
    soundHit           = [[lasrhit1]],
    soundStart         = [[Lasrmas2]],
    tolerance          = 800,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 1000,
    damage = {
      commanders         = 244,
      default            = 170,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 800,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 100,
    metal              = 252,
    object             = [[tlllasbot_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 540,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
    metal              = 97,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
