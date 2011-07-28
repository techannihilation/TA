-- UNITDEF -- APOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "apocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 4900,
  buildCostMetal     = 400,
  builder            = false,
  buildTime          = 7100.0,
  category           = [[ARM LEVEL3 SPECIAL NOWEAPON NOTAIR NOTSUB ALL]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[48 29 22]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Box]],
  corpse             = [[dead]],
  description        = [[produces 100 energy]],
  designation        = [[APE-FPF]],
  energyMake         = 100,
  energyStorage      = 150,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 2,
  maxDamage          = 1650.0,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Pocket Fusion]],
  objectName         = [[APocketFusion]],
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  side               = [[ARM]],
  sightDistance      = 150,
  unitname           = [[apocketfusion]],
  workerTime         = 0,
  yardMap            = [[OOOOOOOOOOOOOOOOOOOO]],
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
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Pocket Fusion Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[APocketFusion_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
