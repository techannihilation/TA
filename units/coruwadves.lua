-- UNITDEF -- CORUWADVES --
--------------------------------------------------------------------------------

local unitName = "coruwadves"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 7822,
  buildCostEnergy    = 10032,
  buildCostMetal     = 690,
  builder            = false,
  buildPic           = [[CORUWADVES.DDS]],
  buildTime          = 20416,
  category           = [[ALL NOTSUB NOWEAPON NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Increases Energy Storage (64000)]],
  designation        = [[CP-CAES]],
  downloadable       = 1,
  energyStorage      = 64000,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 11400,
  maxSlope           = 20,
  maxWaterDepth      = 9999,
  metalStorage       = 0,
  name               = [[Hardened Energy Storage]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[CORUWADVES]],
  seismicSignature   = 0,
  selfDestructAs     = [[MINE_NUKE]],
  side               = [[CORE]],
  sightDistance      = 192,
  smoothAnim         = true,
  threed             = 1,
  unitname           = [[coruwadves]],
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  zbuffer            = 1,
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
      [[storngy2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Energy Storage Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 9,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORUWADVES_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[all]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Energy Storage Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
