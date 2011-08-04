-- UNITDEF -- CORGATE1 --
--------------------------------------------------------------------------------

local unitName = "corgate1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 127666,
  buildCostMetal     = 12736,
  builder            = false,
  buildPic           = [[CORGATE.DDS]],
  buildTime          = 377166,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[DEAD]],
  description        = [[Long Range Plasma Deflector]],
  energyStorage      = 1500,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 9200,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Super Shield]],
  noAutoFire         = false,
  norestrict         = 1,
  objectName         = [[CORGATE1]],
  onoffable          = true,
  script             = [[corgate.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[MINE_NUKE]],
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[corgate1]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      def                = [[REPULSOR1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  REPULSOR1 = {
    isShield           = true,
    name               = [[PlasmaRepulsor]],
    range              = 1000,
    shieldAlpha        = 0.3,
    shieldBadColor     = [[1 0.2 0.2]],
    shieldEnergyUse    = 6000,
    shieldForce        = 7,
    shieldGoodColor    = [[0.2 1 0.2]],
    shieldInterceptType = 1,
    shieldMaxSpeed     = 3500,
    shieldPower        = 77500,
    shieldPowerRegen   = 350,
    shieldPowerRegenEnergy = 5600.5,
    shieldRadius       = 1000,
    shieldRepulser     = true,
    smartShield        = true,
    visibleShield      = true,
    visibleShieldRepulse = true,
    weaponType         = [[Shield]],
    damage = {
      default            = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Super Shield Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORGATE1_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Super Shield Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4X4E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
