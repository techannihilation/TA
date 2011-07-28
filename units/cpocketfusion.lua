-- UNITDEF -- CPOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "cpocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 4850,
  buildCostMetal     = 526,
  builder            = false,
  buildTime          = 9900,
  category           = [[ARM LEVEL3 SPECIAL NOWEAPON NOTAIR NOTSUB ALL]],
  corpse             = [[dead]],
  description        = [[Produces energy]],
  designation        = [[APE-FPF]],
  energyMake         = 128,
  energyStorage      = 128,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  footprintX         = 2,
  footprintZ         = 2,
  maxDamage          = 1950,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Pocket Fusion]],
  objectName         = [[CPocketFusion]],
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  side               = [[CORE]],
  sightDistance      = 150,
  unitname           = [[cpocketfusion]],
  workerTime         = 0,
  yardMap            = [[OOOOOOOOOOOOOOO]],
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
      [[fusion2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Pocket Fusion Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CPocketFusion_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
