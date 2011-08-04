-- UNITDEF -- ARMMOHO --
--------------------------------------------------------------------------------

local unitName = "armmoho"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 7214,
  buildCostMetal     = 582,
  builder            = false,
  buildPic           = [[ARMMOHO.DDS]],
  buildTime          = 14938,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Advanced Metal Extractor / Storage]],
  energyStorage      = 0,
  energyUse          = 25,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.0060,
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2500,
  maxSlope           = 20,
  maxVelocity        = 0,
  maxWaterDepth      = 20,
  metalStorage       = 1000,
  name               = [[Moho Mine]],
  noAutoFire         = false,
  objectName         = [[ARMMOHO]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[armmoho]],
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  sounds = {
    activate           = [[mohorun1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[mohooff1]],
    underattack        = [[warning1]],
    working            = [[mohorun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[twractv2]],
    },
    select = {
      [[mohoon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Moho Mine Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMMOHO_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Moho Mine Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
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
