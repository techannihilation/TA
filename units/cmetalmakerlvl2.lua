-- UNITDEF -- CMETALMAKERLVL2 --
--------------------------------------------------------------------------------

local unitName = "cmetalmakerlvl2"

--------------------------------------------------------------------------------
--GADGETED
local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 1509111,
  buildCostMetal     = 31883,
  builder            = false,
  buildTime          = 240000,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  corpse             = [[dead]],
  damageModifier     = 0.25,
  description        = [[Converts upto 20480 Energy to Metal]],
  designation        = [[MMC]],
  energyStorage      = 0,
  explodeAs          = [[nuclear_missile1]],
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  maxDamage          = 6200,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[T3 Metal Maker]],
  objectName         = [[CMetalMakerLvl2]],
  onoffable          = true,
  radarDistance      = 0,
  script             = [[cormmkr.cob]],
  selfDestructAs     = [[nuclear_missile1]],
  side               = [[CORE]],
  sightDistance      = 210,
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
    damage             = unitDef.maxDamage*0.6,
    description        = [[T3 Metalmaker Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CMetalMakerLvl2_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[T3 metalmaker Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
