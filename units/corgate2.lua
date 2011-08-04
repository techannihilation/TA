-- UNITDEF -- CORGATE2 --
--------------------------------------------------------------------------------

local unitName = "corgate2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 8000,
  buildCostMetal     = 1800,
  builder            = false,
  buildPic           = [[CORGATE.DDS]],
  buildTime          = 77166,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[DEAD]],
  description        = [[Small plasma deflector]],
  energyStorage      = 1500,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 1000,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Small Shield]],
  noAutoFire         = false,
  norestrict         = 1,
  objectName         = [[CORGATE2]],
  onoffable          = true,
  script             = [[corgate.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[MINE_NUKE]],
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[corgate2]],
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
      def                = [[REPULSOR2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  REPULSOR2 = {
    isShield           = true,
    name               = [[PlasmaRepulsor]],
    range              = 340,
    shieldAlpha        = 0.3,
    shieldBadColor     = [[1 0.2 0.2]],
    shieldEnergyUse    = 300,
    shieldForce        = 8,
    shieldGoodColor    = [[0.2 1 0.2]],
    shieldInterceptType = 1,
    shieldMaxSpeed     = 200,
    shieldPower        = 2900,
    shieldPowerRegen   = 29,
    shieldPowerRegenEnergy = 240.5,
    shieldRadius       = 340,
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
    description        = [[Small Shield Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORGATE2_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Small Shield Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
