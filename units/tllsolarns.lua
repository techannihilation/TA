-- UNITDEF -- TLLSOLARNS --
--------------------------------------------------------------------------------

local unitName = "tllsolarns"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1350,
  buildCostMetal     = 180,
  builder            = false,
  buildTime          = 3750,
  category           = [[TLL  LEVEL2 NOWEAPON  NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.5,
  description        = [[Produce Energy]],
  designation        = [[SOL-NS]],
  energyMake         = 40,
  energyStorage      = 40,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Capteur solaire NAVY]],
  germandescription  = [[Gewinnt Energie]],
  germanname         = [[Solarkollektor]],
  iconType           = [[building]],
  maxDamage          = 485,
  metalStorage       = 0,
  minWaterDepth      = 20,
  name               = [[Solar Collector NS]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllsolarNS]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 250,
  threed             = 1,
  tidal              = 1,
  unitname           = [[tllsolarns]],
  unitnumber         = 868,
  version            = 3.1,
  waterline          = 8,
  workerTime         = 0,
  yardMap            = [[wwww wwww wwww wwww]],
  zbuffer            = 1,
  sounds = {
    activate           = [[solar2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[solar2]],
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
      [[solar2]],
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 103,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsolarNS_dead]],
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
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
