-- UNITDEF -- APOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "apocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 3600,
  buildCostMetal     = 425,
  builder            = false,
  buildTime          = 4850.0,
  category           = [[ARM LEVEL3 SPECIAL NOWEAPON NOTAIR NOTSUB ALL]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[48 29 22]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Box]],
  corpse             = [[dead]],
  description        = [[produces 100 energy]],
  designation        = [[APE-FPF]],
  energyMake         = 100,
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 3,
  footprintZ         = 2,
  maxDamage          = 2000.0,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Pocket Fusion]],
  objectName         = [[APocketFusion]],
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  side               = [[ARM]],
  sightDistance      = 150,
  TEDClass           = [[ENERGY]],
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
    damage             = 3404,
    description        = [[Pocket Fusion Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 273,
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
