-- UNITDEF -- TLLGATE --
--------------------------------------------------------------------------------

local unitName = "tllgate"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 1700,
  buildCostEnergy    = 29850,
  buildCostMetal     = 3840,
  builder            = false,
  buildTime          = 53485,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[tllgate_dead]],
  description        = [[Plasma Deflectorr]],
  designation        = [[TLL-GG]],
  energyStorage      = 1800,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
  footprintX         = 5,
  footprintZ         = 3,
  maxDamage          = 3800,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Shield Generator]],
  noAutoFire         = false,
  norestrict         = 1,
  objectName         = [[TLLGATE]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[MINE_NUKE]],
  side               = [[TLL]],
  sightDistance      = 240,
  threed             = 1,
  unitname           = [[tllgate]],
  unitnumber         = 3403,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooo ooo ooo ooo ooo]],
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
      [[drone1]],
    },
    select = {
      [[drone1]],
    },
  },
   weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[REPULSOR]],
    },
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
  REPULSOR = {
    isShield           = true,
    name               = [[PlasmaRepulsor]],
    range              = 400,
    shieldAlpha        = 0.35,
    shieldBadColor     = [[1 0.2 0.2]],
    shieldEnergyUse    = 600,
    shieldForce        = 7,
    shieldGoodColor    = [[0.2 1 0.2]],
    shieldInterceptType = 1,
    shieldMaxSpeed     = 3500,
    shieldPower        = 7500,
    shieldPowerRegen   = 150,
    shieldPowerRegenEnergy = 562.5,
    shieldRadius       = 400,
    shieldRepulser     = true,
    smartShield        = true,
    visibleShield      = true,
    visibleShieldHitFrames = 70,
    visibleShieldRepulse = true,
    weaponType         = [[Shield]],
    damage = {
      default            = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs

local featureDefs = {
  tllgate_dead = {
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
    object             = [[tllgate_dead]],
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
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
