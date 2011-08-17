-- UNITDEF -- TLLAAP --
--------------------------------------------------------------------------------

local unitName = "tllaap"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 8700,
  buildCostMetal     = 2840,
  builder            = true,
  buildTime          = 25762,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT  NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .85,
  description        = [[Produces T2 Aircraft]],
  designation        = [[TL-AAP]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 7,
  iconType           = [[building]],
  frenchdescription  = [[Usine aéro avancée]],
  germandescription  = [[Verb.Flugzeugfabrik]],
  maxDamage          = 3250,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Aircraft Plant]],
  noAutoFire         = false,
  objectName         = [[TLLAAP]],
  ovradjust          = 1,
  radarDistance      = 1200,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 240,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllaap]],
  unitnumber         = 883,
  version            = 3.1,
  workerTime         = 420,
  yardMap            = [[oooooo occcco occcco occcco occcco occcco oooooo]],
  zbuffer            = 1,
  buildoptions = {
    [[tllaca]],
    [[tllcopter]],
    [[tllabomber]],
    [[tlltorpp]],
    [[tlladvfight]],
    [[tllrsplane]],
    [[tllrobber]],
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
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllaap_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
