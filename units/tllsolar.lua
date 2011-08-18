-- UNITDEF -- TLLSOLAR --
--------------------------------------------------------------------------------

local unitName = "tllsolar"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 2192,
  buildCostEnergy    = 0,
  buildCostMetal     = 188,
  builder            = false,
  buildTime          = 2600,
  category           = [[TLL  LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.33333,
  description        = [[Produces Energy]],
  designation        = [[TE-SC]],
  digger             = 1,
  energyMake          = 30,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Capteur solaire]],
  germandescription  = [[Gewinnt Energie]],
  germanname         = [[Solarkollektor]],
  iconType           = [[building]],
  maxDamage          = 469,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Solar Collector]],
  noAutoFire         = false,
  objectName         = [[TLLSOLAR]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  threed             = 1,
  unitname           = [[tllsolar]],
  unitnumber         = 804,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[solar1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[solar1]],
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
      [[solar1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsolar_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
