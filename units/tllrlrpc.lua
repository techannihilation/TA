-- UNITDEF -- TLLRLRPC --
--------------------------------------------------------------------------------

local unitName = "tllrlrpc"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2760,
  buildCostEnergy    = 233949,
  buildCostMetal     = 43584,
  builder            = false,
  buildTime          = 615189,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL LEVEL3 WEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Rapid-Fire Long Range Laser Cannon]],
  designation        = [[TL-RLRC]],
  downloadable       = 1,
  energyMake         = 200,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 0,
  firestate          = 2,
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  maxDamage          = 41980,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Barret]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tllrlrpc]],
  onoffable          = true,
  onlyTargetCategory = [[NOTAIR]],
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 210,
  standingfireorder  = 0,
  threed             = 1,
  unitname           = [[tllrlrpc]],
  unitnumber         = 900,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
  zbuffer            = 1,
  customparams = {
    canareaattack      = 1,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:tllbarret_effect]],
    },
  },
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_Barret]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_Barret = {
    accuracy           = 100,
    areaOfEffect       = 180,
    beamWeapon         = true,
    color              = 128,
    color2             = 130,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.6,
    energypershot      = 12000,
    explosionart       = [[bio1]],
    explosiongaf       = [[CAexp2]],
    explosionGenerator = [[custom:LIGHTNING_FLASH]],
    fireStarter        = 90,
    id                 = 119,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Ultra lightning Weapon2]],
    noSelfDamage       = true,
    range              = 4400,
    reloadtime         = 0.6,
    renderType         = 7,
    soundHit           = [[xplolrg1]],
    soundStart         = [[annigun1]],
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[H2oboom3]],
    waterexplosiongaf  = [[CAexp3]],
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 560,
    damage = {
      commanders         = 600,
      default            = 1600,
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
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllrlrpc_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featureDead        = [[heap2]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 45,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap2 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.216,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.512,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
