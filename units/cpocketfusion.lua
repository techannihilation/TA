-- UNITDEF -- CPOCKETFUSION --
--------------------------------------------------------------------------------

local unitName = "cpocketfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 4260,
  buildCostMetal     = 470,
  builder            = false,
  buildTime          = 4850,
  category           = [[ARM LEVEL3 SPECIAL NOWEAPON NOTAIR NOTSUB ALL]],
  corpse             = [[dead]],
  description        = [[produces 110 energy]],
  designation        = [[APE-FPF]],
  energyMake         = 110,
  energyStorage      = 110,
  energyUse          = 0,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  maxDamage          = 2400,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Pocket Fusion]],
  objectName         = [[CPocketFusion]],
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  side               = [[CORE]],
  sightDistance      = 150,
  TEDClass           = [[ENERGY]],
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
    damage             = 4404,
    description        = [[Pocket Fusion Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 302,
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
