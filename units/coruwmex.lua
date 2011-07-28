-- UNITDEF -- CORUWMEX --
--------------------------------------------------------------------------------

local unitName = "coruwmex"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 519,
  buildCostMetal     = 56,
  builder            = false,
  buildPic           = [[CORUWMEX.DDS]],
  buildTime          = 1887,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Extracts Metal]],
  energyStorage      = 0,
  energyUse          = 2,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.001,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 185,
  maxSlope           = 20,
  maxVelocity        = 0,
  metalStorage       = 50,
  minWaterDepth      = 15,
  name               = [[Underwater Metal Extractor]],
  noAutoFire         = false,
  objectName         = [[CORUWMEX]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructCountdown = 1,
  side               = [[CORE]],
  sightDistance      = 169,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[coruwmex]],
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  sounds = {
    activate           = [[waterex2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[waterex2]],
    underattack        = [[warning1]],
    working            = [[waterex2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[waterex2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Underwater Metal Extractor Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORUWMEX_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Underwater Metal Extractor Heap]],
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
