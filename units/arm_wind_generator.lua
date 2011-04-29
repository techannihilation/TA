-- UNITDEF -- ARM_WIND_GENERATOR --
--------------------------------------------------------------------------------

local unitName = "arm_wind_generator"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 509,
  buildCostMetal     = 42,
  builder            = false,
  buildPic           = [[arm_wind_generator.DDS]],
  buildTime          = 1603,
  category           = [[ARM NOWEAPON NOTAIR NOTSUB]],
  corpse             = [[dead]],
  description        = [[- Produces Energy]],
  designation        = [[AE-WPG]],
  downloadable       = 1,
  energyMake         = 9,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  maxDamage          = 306,
  maxSlope           = 10,
  maxWaterDepth      = 36,
  metalStorage       = 0,
  name               = [[UPG Wind Generator]],
  noAutoFire         = false,
  objectName         = [[arm_wind_generator.3do]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[Arm]],
  sightDistance      = 367.5,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[arm_wind_generator]],
  unitnumber         = 76,
  version            = 1.2,
  windGenerator      = 185,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      [[windgen1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  core_wind_generator_heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1430,
    description        = [[Upgraded Wind Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 27,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 1430,
    description        = [[Upgraded Wind Wreckage]],
    featureDead        = [[core_wind_generator_heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 11,
    object             = [[core_wind_generator_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
