-- UNITDEF -- TLLSONAR --
--------------------------------------------------------------------------------

local unitName = "tllsonar"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 423,
  buildCostMetal     = 22,
  builder            = false,
  buildTime          = 931,
  category           = [[TLL SPECIAL LEVEL2 NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Locates Water Units]],
  designation        = [[TL-SON]],
  energyMake         = 8,
  energyStorage      = 0,
  energyUse          = 9,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Détecte les unités navales]],
  frenchname         = [[Station sonar]],
  germandescription  = [[Ortet schwimmende Einheiten]],
  germanname         = [[Sonarstation]],
  italiandescription = [[Individua le unità anfibie]],
  italianname        = [[Stazione Sonar]],
  maxDamage          = 54,
  maxSlope           = 10,
  metalStorage       = 0,
  minWaterDepth      = 8,
  name               = [[Sonar Station]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLSONAR]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 175,
  sonarDistance      = 1320,
  spanishdescription = [[Detecta submarinos]],
  spanishname        = [[Estación de Sonar]],
  threed             = 1,
  unitname           = [[tllsonar]],
  unitnumber         = 853,
  version            = 3.1,
  waterline          = 11,
  workerTime         = 0,
  yardMap            = [[wwww]],
  zbuffer            = 1,
  sounds = {
    activate           = [[sonar1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[sonarde1]],
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
      [[sonar1]],
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
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsonar_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
