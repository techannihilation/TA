-- UNITDEF -- ARMCP --
--------------------------------------------------------------------------------

local unitName = "armcp"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = false,
  ai_limit           = [[limit ARMCP 4]],
  ai_weight          = [[weight ARMCP 2]],
  bmcode             = 0,
  buildCostEnergy    = 12370,
  buildCostMetal     = 1450,
  builder            = true,
  buildTime          = 19240,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Helicopters]],
  designation        = [[HP-17]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 6,
  frenchdescription  = [[Produit des Hélicoptères]],
  frenchname         = [[Helipad]],
  germandescription  = [[Baut Hubschrauber]],
  germanname         = [[Helipad]],
  maxDamage          = 1850,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Helipad (ARM)]],
  noAutoFire         = false,
  objectName         = [[ARMCP]],
  radarDistance      = 500,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 225,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[armcp]],
  unitnumber         = 8,
  version            = 1,
  workerTime         = 100,
  yardMap            = [[ooooooo ooooooo occccco occccco occccco occccco]],
  zbuffer            = 1,
  buildoptions = {
    [[armsh175]],
    [[ferret]],
    [[armah256]],
    [[smasher]],
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
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Helipad (ARM) Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armcp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
