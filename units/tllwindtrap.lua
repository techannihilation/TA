-- UNITDEF -- TLLWINDTRAP --
--------------------------------------------------------------------------------

local unitName = "tllwindtrap"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 208,
  buildCostMetal     = 27,
  builder            = false,
  buildTime          = 1721,
  category           = [[TLL ENERGY LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .90,
  description        = [[Produces Energy]],
  designation        = [[TL-WT]],
  digger             = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Piège à vent]],
  germandescription  = [[Gewinnt Energie]],
  germanname         = [[Windgenerator]],
  iconType           = [[building]],
  italiandescription = [[Produce energia]],
  italianname        = [[Generatore a Vento]],
  maxDamage          = 224,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Wind Trap]],
  noAutoFire         = false,
  objectName         = [[Tllwindtrap]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Produce energía]],
  spanishname        = [[Generador Eólico]],
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[tllwindtrap]],
  unitnumber         = 851,
  version            = 3.1,
  windGenerator      = 32,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    deactivate         = [[tllwindstop]],
    underattack        = [[tllwarning]],
    working            = [[tllwind2]],
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    select = {
      [[tllwindsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 145,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 53,
    metal              = 18,
    object             = [[tllwindtrap_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 49,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 7,
    object             = [[4x4f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
