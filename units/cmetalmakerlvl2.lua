-- UNITDEF -- CMETALMAKERLVL2 --
--------------------------------------------------------------------------------

local unitName = "cmetalmakerlvl2"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 402393.020,
  buildCostMetal     = 13581.3775,
  builder            = false,
  buildTime          = 156525.000,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  corpse             = [[dead]],
  damageModifier     = 0.25,
  description        = [[Heavy convertion of energy into metal]],
  designation        = [[MMC]],
  energyStorage      = 0,
  energyUse          = 12000,
  explodeAs          = [[nuclear_missile1]],
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  makesMetal         = 300,
  maxDamage          = 6200,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[T3 Metal Maker]],
  objectName         = [[CMetalMakerLvl2]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[nuclear_missile1]],
  side               = [[CORE]],
  sightDistance      = 210,
  TEDClass           = [[METAL]],
  unitname           = [[cmetalmakerlvl2]],
  workerTime         = 0,
  yardMap            = [[OOO OOO OOO]],
  sounds = {
    activate           = [[metlon2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff2]],
    underattack        = [[warning1]],
    working            = [[metlrun2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 18800,
    description        = [[T3 Metalmaker Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 8439,
    object             = [[CMetalMakerLvl2_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 12000,
    description        = [[T3 metalmaker Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 3211,
    object             = [[CMetalMakerLvl2_heap]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
