-- UNITDEF -- TLLASPNS --
--------------------------------------------------------------------------------

local unitName = "tllaspns"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 9180,
  buildCostMetal     = 489,
  buildDistance      = 8,
  builder            = true,
  buildTime          = 29537,
  category           = [[TLL REPAIRPAD LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Floating repair aircraft]],
  designation        = [[TL-RPNS]],
  energyMake         = 10,
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Répare automatiquement les avions]],
  frenchname         = [[Piste de réparations NAVY]],
  germandescription  = [[Repariert Lufteinheiten automatisch]],
  germanname         = [[Schwimmendes Luftfahrt-Reparaturset]],
  isAirBase          = true,
  maxDamage          = 680,
  maxSlope           = 10,
  minWaterDepth      = 15,
  name               = [[Air Repair Pad NS]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllaspns]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[TLL]],
  sightDistance      = 175,
  sortbias           = 0,
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[tllaspns]],
  unitnumber         = 881,
  version            = 3.1,
  waterline          = 13,
  workerTime         = 11000,
  yardMap            = [[wwww wwww wwww wwww]],
  zbuffer            = 1,
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
    damage             = 510,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 314,
    object             = [[tllaspns_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 168,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 121,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
