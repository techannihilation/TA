-- UNITDEF -- AAFUS --
--------------------------------------------------------------------------------

local unitName = "aafus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = false,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 74115,
  buildCostMetal     = 10709,
  builder            = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = [[aafus_aoplane.dds]],
  buildPic           = [[AAFUS.DDS]],
  buildTime          = 197529,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[118 78 76]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Box]],
  corpse             = [[DEAD]],
  damageModifier     = 0.95,
  description        = [[Enhanced Energy Output / Storage]],
  energyMake         = 3000,
  energyStorage      = 25000,
  energyUse          = 0,
  explodeAs          = [[NUCLEAR_MISSILE]],
  footprintX         = 7,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 9600,
  maxSlope           = 13,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[AAFUS]],
  onoffable          = false,
  seismicSignature   = 0,
  selfDestructAs     = [[CRBLMSSL]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  TEDClass           = [[ENERGY]],
  turnRate           = 0,
  unitname           = [[aafus]],
  useBuildingGroundDecal = true,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooooooooooooo]],
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
      [[fusion1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 16290,
    description        = [[Advanced Fusion Reactor Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 40,
    hitdensity         = 100,
    metal              = 6700,
    object             = [[AAFUS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 8145,
    description        = [[Advanced Fusion Reactor Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 2555,
    object             = [[4X4A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
