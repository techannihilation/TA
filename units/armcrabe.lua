-- UNITDEF -- ARMCRABE --
--------------------------------------------------------------------------------

local unitName = "armcrabe"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.552587891,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.252587891,
  buildCostEnergy    = 98432,
  buildCostMetal     = 9000,
  builder            = false,
  buildPic           = [[ARMCRABE.pcx]],
  buildTime          = 198800,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[KBOT WEAPON ALL NOTSUB NOTAIR]],
  corpse             = [[dead]],
  damageModifier     = 0.5,
  defaultmissiontype = [[Standby]],
  description        = [[All-Terrain K-bot Biomechanics]],
  designation        = [[ARM-CRABE]],
  energyMake         = 0.7,
  energyStorage      = 0,
  energyUse          = 1,
  explodeAs          = [[ARM_BERTHACANNONEMP1]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[K-bot Bio-Mécanique]],
  frenchname         = [[Crabe]],
  germandescription  = [[Biomechanik K-Bot]],
  maneuverleashlength = 640,
  maxDamage          = 45000,
  maxSlope           = 20,
  maxVelocity        = 0.9,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTKBOT4]],
  name               = [[Crabe]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMCRABE]],
  onoffable          = true,
  radarDistance      = 0,
  seismicsigniture   = 2500,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  selfDestructCountdown = 10,
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 950,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 100,
  unitname           = [[armcrabe]],
  unitnumber         = 100003,
  version            = 1,
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
      def                = [[ARMCRABE_GAUSS]],
    },
    [2]  = {
      def                = [[ARMCRABE_MISSILES]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMCRABE_GAUSS = {
    areaOfEffect       = 330,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 252,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -15,
    name               = [[Crabe Cannon]],
    range              = 1200,
    reloadtime         = 3.2,
    renderType         = 4,
    soundHit           = [[XPLOSML1]],
    soundStart         = [[AMATIR]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 385,
    damage = {
      default            = 1450,
    },
  },
  ARMCRABE_MISSILES = {
    areaOfEffect       = 120,
    burst              = 3,
    burstrate          = 0.30,
    explosionart       = [[bigboom]],
    explosiongaf       = [[towers]],
    fireStarter        = 20,
    guidance           = true,
    id                 = 233,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[missileH2]],
    name               = [[Heavy Rocket]],
    range              = 1000,
    reloadtime         = 12.0,
    renderType         = 1,
    selfprop           = true,
    shakeduration      = 1,
    shakemagnitude     = 3,
    smokedelay         = .0091,
    smokeTrail         = true,
    soundHit           = [[tankahit]],
    soundStart         = [[tankafire]],
    startsmoke         = 1,
    startVelocity      = 640,
    tolerance          = 12000,
    tracks             = true,
    turnRate           = 33000,
    turret             = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 460,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 1500,
    damage = {
      default            = 1650,
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
    description        = [[Crabe Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armcrabe_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Crabe Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
