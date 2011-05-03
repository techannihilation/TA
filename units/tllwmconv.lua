-- UNITDEF -- TLLWMCONV --
--------------------------------------------------------------------------------

local unitName = "tllwmconv"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1597,
  buildCostMetal     = 6,
  builder            = false,
  buildTime          = 2887,
  category           = [[TLL METAL LEVEL1 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Floating Metal Maker]],
  designation        = [[WM-CONV]],
  energyUse          = 80,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Convertisseur d'énergie en métal flottant]],
  frenchname         = [[Métallo flottant]],
  germandescription  = [[Schwimmende Metallherstellung]],
  germanname         = [[Schwimmschmelze]],
  iconType           = [[building]],
  italiandescription = [[Fabbrica metalli]],
  italianname        = [[Generatore di Metallo - SN]],
  makesMetal         = 1.1,
  maxDamage          = 120,
  maxSlope           = 10,
  minWaterDepth      = 10,
  name               = [[Metal Producer]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllWMconv]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 200,
  spanishdescription = [[Produce metal]],
  spanishname        = [[Productor de Metal - SN]],
  TEDClass           = [[METAL]],
  threed             = 1,
  unitname           = [[tllwmconv]],
  unitnumber         = 870,
  version            = 3.1,
  waterline          = 5,
  yardMap            = [[wwwwwwwww]],
  zbuffer            = 1,
  sounds = {
    activate           = [[metlon1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff1]],
    underattack        = [[warning1]],
    working            = [[metlrun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 45,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 102,
    metal              = 4,
    object             = [[tllWMconv_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
