-- UNITDEF -- TLLAP --
--------------------------------------------------------------------------------

local unitName = "tllap"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = false,
  bmcode             = 0,
  buildCostEnergy    = 1450,
  buildCostMetal     = 880,
  builder            = true,
  buildTime          = 7450,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL PLANT LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.7,
  description        = [[Produces Aircraft]],
  designation        = [[TLL-AP]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 7,
  frenchdescription  = [[Niveau Tech 1]],
  frenchname         = [[Usine aéronautique]],
  germandescription  = [[Tech Level 1]],
  germanname         = [[Flugzeugfabrik]],
  italiandescription = [[Produce velivoli]],
  italianname        = [[Fabbrica Aerei]],
  iconType           = [[building]],
  maxDamage          = 1920,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Aircraft Plant]],
  noAutoFire         = false,
  objectName         = [[TLLAP]],
  ovradjust          = 1,
  radarDistance      = 550,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 200,
  spanishdescription = [[Produce aviones]],
  spanishname        = [[Planta Constr. Aeronaves ]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllap]],
  unitnumber         = 915,
  version            = 3.1,
  workerTime         = 210,
  yardMap            = [[cccooco	cccccco occccco	occccco	occccco occccco	ocoooco]],
  zbuffer            = 1,
  buildoptions = {
    [[tllca]],
    [[tllprob]],
    [[tllfight]],
    [[tllbomber]],
    [[tlltplane]],
    [[tllcop1]],
  },
  sounds = {
    build              = [[pairwork]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[untdone]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[pairactv]],
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
    footprintX         = 7,
    footprintZ         = 7,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllap_dead]],
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
    footprintX         = 7,
    footprintZ         = 7,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
