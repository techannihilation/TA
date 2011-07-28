-- UNITDEF -- TAWF010 --
--------------------------------------------------------------------------------

local unitName = "tawf010"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 42468,
  buildCostMetal     = 2122,
  builder            = false,
  buildTime          = 45675,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Heavy Rocket Defense Weapon]],
  designation        = [[TAWF-18]],
  energyStorage      = 200,
  energyUse          = 30,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Arme à tachyons très lourde]],
  frenchname         = [[Enforcer]],
  germandescription  = [[Überschwerer Tachionenwaffe]],
  germanname         = [[Enforcer]],
  maxDamage          = 12540,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Enforcer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TAWF010]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 400,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tawf010]],
  unitnumber         = 39,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooo ooo ooo]],
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
      [[anni]],
    },
    select = {
      [[anni]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TAWF010_weapon]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[TAWF010b_weapon]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [3]  = {
      def                = [[TAWF010b_weapon]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TAWF010_weapon = {
    areaOfEffect       = 48,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode2]],
    explosiongaf       = [[fx]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[010weap]],
    name               = [[Tachyon Cannon]],
    noSelfDamage       = true,
    range              = 900,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = false,
    soundHit           = [[HIT010]],
    soundStart         = [[FIRE010]],
    startVelocity      = 450,
    tolerance          = 9000,
    tracks             = true,
    turnRate           = 30000,
    turret             = true,
    waterexplosionart  = [[h2oBoom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 101,
    weaponTimer        = 5,
    weaponType         = [[Cannon]],
    weaponVelocity     = 450,
    damage = {
      default            = 330,
    },
  },
  TAWF010b_weapon = {
    areaOfEffect       = 101,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[Nuke1]],
    explosiongaf       = [[fx]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 238,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[rpack]],
    name               = [[Mammoth Rocket Pack]],
    noSelfDamage       = true,
    range              = 1200,
    reloadtime         = 9,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 1.01,
    smokeTrail         = false,
    soundHit           = [[kill]],
    soundStart         = [[shoot]],
    startVelocity      = 650,
    tolerance          = 9000,
    tracks             = true,
    turnRate           = 3000,
    turret             = true,
    waterexplosionart  = [[h2oBoom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 112,
    weaponTimer        = 5,
    weaponType         = [[Cannon]],
    weaponVelocity     = 650,
    damage = {
      default            = 2100,
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
    description        = [[Enforcer Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 60,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TAWF010_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Enforcer Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 6,
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
