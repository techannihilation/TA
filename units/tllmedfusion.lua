-- UNITDEF -- TLLMEDFUSION --
--------------------------------------------------------------------------------

local unitName = "tllmedfusion"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 7200,
  buildCostMetal     = 3450,
  builder            = false,
  buildTime          = 70000,
  category           = [[LEVEL2 NOWEAPON NOTAIR NOTSUB]],
  corpse             = [[dead]],
  description        = [[Produces Energy/ Storage]],
  energyMake         = 800,
  energyStorage      = 2000,
  explodeAs          = [[FUSIONX_BLAST]],
  floater            = true,
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 2000,
  maxDamage          = 4680,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Fusion Reactor]],
  objectName         = [[TLLMEDFUSION]],
  radarDistance      = 0,
  selfDestructAs     = [[FUSIONX_BLAST]],
  side               = [[TLL]],
  sightDistance      = 263,
  smoothAnim         = true,
  unitname           = [[tllmedfusion]],
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
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
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Small Fusion Wreckage]],
    featureDead        = [[heap]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllmedfusion_dead]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Small Fusion Debris]],
    footprintX         = 5,
    footprintZ         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4c]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
