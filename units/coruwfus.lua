-- UNITDEF -- CORUWFUS --
--------------------------------------------------------------------------------

local unitName = "coruwfus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 37000,
  buildCostMetal     = 4500,
  builder            = false,
  buildPic           = [[CORUWFUS.DDS]],
  buildTime          = 115200,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Produces Energy / Storage]],
  energyMake         = 1280,
  energyStorage      = 2560,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 5350,
  maxSlope           = 16,
  maxVelocity        = 0,
  metalStorage       = 0,
  minWaterDepth      = 25,
  name               = [[Underwater Fusion Plant]],
  noAutoFire         = false,
  objectName         = [[CORUWFUS]],
  seismicSignature   = 0,
  selfDestructAs     = [[MINE_NUKE]],
  side               = [[CORE]],
  sightDistance      = 143,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[coruwfus]],
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[watfusn2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Underwater Fusion Plant Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORUWFUS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Underwater Fusion Plant Heap]],
    energy             = 0,
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
