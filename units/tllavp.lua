-- UNITDEF -- TLLAVP --
--------------------------------------------------------------------------------

local unitName = "tllavp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 3550,
  buildCostMetal     = 2148,
  builder            = true,
  buildTime          = 16120,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 NOWEAPON NOTAIR NOTSUB PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Vehicles]],
  designation        = [[]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 7,
  iconType           = [[building]],
  frenchdescription  = [[Niveau Tech 2]],
  frenchname         = [[Usine de véhicules évoluée]],
  germandescription  = [[Tech Level 2]],
  germanname         = [[Verb. Fahrzeugfabrik]],
  italiandescription = [[Produce veicoli]],
  italianname        = [[Fabbrica Veicoli Spec.]],
  maxDamage          = 4575,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Vehicle Plant]],
  noAutoFire         = false,
  objectName         = [[TLLAVP]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 218,
  spanishdescription = [[Produce vehículos]],
  spanishname        = [[Planta Av. Constr. Vehículos]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  threed             = 1,
  unitname           = [[tllavp]],
  unitnumber         = 832,
  version            = 3.1,
  workerTime         = 420,
  yardMap            = [[oooooooo oooooooo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo]],
  zbuffer            = 1,
  buildoptions = {
    [[tllacv]],
    [[tllthumper]],
    [[tllcoyote]],
    [[tllconvincer]],
    [[tllloki]],
    [[tllroaster]],
    [[tllpuncher]],
    [[tlldivine]],
    [[tllobscurer]],
  },
  sounds = {
    build              = [[pvehwork]],
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
      [[pvehactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllavp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featureDead        = [[heap2]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6B]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap2 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.216,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.512,
    object             = [[4x4B]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
