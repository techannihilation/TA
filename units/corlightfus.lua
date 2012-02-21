-- UNITDEF -- CORLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "corlightfus"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 65535,
  buildCostEnergy    = 10000,
  buildCostMetal     = 900,
  builder            = false,
  buildPic           = [[corlightfus.DDS]],
  buildTime          = 21333,
  category           = [[LEVEL2 NOTAIR ALL]],
  corpse             = [[DEAD]],
  description        = [[Produces Energy]],
  designation        = [[Brzapp-66]],
  downloadable       = 1,
  energyMake         = 500,
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLASTSML]],
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = [[building]],
  maxDamage          = 2500,
  maxSlope           = 10,
  maxWaterDepth      = 1,
  metalStorage       = 0,
  name               = [[Light Fusion Power Plant]],
  noAutoFire         = false,
  objectName         = [[corlightfus]],
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  side               = [[Core]],
  sightDistance      = 367.5,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[corlightfus]],
  unitnumber         = 106,
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:ReactorSequence]],
    },
  },
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
  DEAD = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 794,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = 585,
    object             = [[corlightfus_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 794,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = 234,
    object             = [[6x6d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
