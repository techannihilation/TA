-- UNITDEF -- TAWF014 --
--------------------------------------------------------------------------------

local unitName = "tawf014"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.017,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.015,
  buildCostEnergy    = 24945,
  buildCostMetal     = 1167,
  builder            = false,
  buildTime          = 25956,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Very Heavy Missile Tank]],
  designation        = [[TAWF-26]],
  energyMake         = 1.0,
  energyStorage      = 20,
  energyUse          = 1.0,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Very Heavy Missile Tank]],
  frenchname         = [[Terroriser]],
  germandescription  = [[Very Heavy Missile Tank]],
  germanname         = [[Terroriser]],
  maneuverleashlength = 640,
  maxDamage          = 3050,
  maxSlope           = 18,
  maxVelocity        = 1.6,
  maxWaterDepth      = 19,
  metalStorage       = 3,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Terroriser]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TAWF014]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 300,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 450,
  unitname           = [[tawf014]],
  unitnumber         = 66,
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
      [[varmmove]],
    },
    select = {
      [[varmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[TAWF014_weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 270,
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TAWF014_weapon = {
    areaOfEffect       = 97,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionart       = [[smallboom]],
    explosiongaf       = [[towers]],
    fireStarter        = 20,
    guidance           = true,
    id                 = 228,
    impulseBoost       = 0.0,
    impulseFactor      = 0.0,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[TAWF114a]],
    name               = [[Banisher]],
    range              = 840,
    reloadtime         = 7.5,
    renderType         = 1,
    selfprop           = true,
    shakeduration      = 1,
    shakemagnitude     = 10,
    smokedelay         = .0091,
    smokeTrail         = true,
    soundHit           = [[TAWF114b]],
    soundStart         = [[TAWF114a]],
    startsmoke         = 1,
    startVelocity      = 250,
    tolerance          = 9000,
    tracks             = true,
    trajectoryHeight   = 1.45,
    turnRate           = 33000,
    turret             = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 70,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 310,
    damage = {
      default            = 1250,
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
    description        = [[Terroriser Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 29,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TAWF014_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Terroriser Heap]],
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
