-- UNITDEF -- TLLSTUNER --
--------------------------------------------------------------------------------

local unitName = "tllstuner"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 3872,
  buildCostMetal     = 662,
  builder            = false,
  buildTime          = 11528,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.125,
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Stuner Cannon]],
  designation        = [[T-PC-L]],
  downloadable       = 1,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maxDamage          = 2288,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Sleeper]],
  noAutoFire         = false,
  objectName         = [[tllstuner]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 410,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllstuner]],
  unitnumber         = 842,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak2]],
    uncloak            = [[kloak2un]],
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
      [[servmed1]],
    },
    select = {
      [[servmed1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLSTUNER_GUN]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLSTUNER_GUN = {
    areaOfEffect       = 28,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 200,
    explosionart       = [[pulse2]],
    explosiongaf       = [[CAexp2]],
    id                 = 125,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[tllstunerpulse]],
    name               = [[Stuner Cannon]],
    noSelfDamage       = true,
    paralyzer          = true,
    paralyzertime      = 5,
    range              = 850,
    reloadtime         = 2,
    renderType         = 1,
    soundHit           = [[xplomed2]],
    soundStart         = [[tllstuner]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 850,
    damage = {
      default            = 1800,
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
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllstuner_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
