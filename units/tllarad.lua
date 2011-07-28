-- UNITDEF -- TLLARAD --
--------------------------------------------------------------------------------

local unitName = "tllarad"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1950,
  buildCostMetal     = 431,
  builder            = false,
  buildTime          = 5050,
  category           = [[TLL SPECIAL LEVEL2 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .8,
  description        = [[Long Range Radar Tower]],
  designation        = [[T-RAD2]],
  energyStorage      = 0,
  energyUse          = 60,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Radar de longue portée]],
  frenchname         = [[Tour radar évoluée]],
  germandescription  = [[Langstrecken-Radarturm]],
  germanname         = [[Verbesserter Radarturm]],
  iconType           = [[building]],
  italiandescription = [[Torre Radar a lungo raggio]],
  italianname        = [[Torre Radar Avanzata]],
  maxDamage          = 432,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Radar Tower]],
  noAutoFire         = false,
  objectName         = [[tllARAD]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 3080,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Torreta de radar de largo alcance]],
  spanishname        = [[Torra de Radar Avanzada]],
  threed             = 1,
  unitname           = [[tllarad]],
  unitnumber         = 843,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[radadvn1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[radadde1]],
    underattack        = [[warning1]],
    working            = [[radar2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[radadvn1]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllarad_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
