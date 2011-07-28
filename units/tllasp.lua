-- UNITDEF -- TLLASP --
--------------------------------------------------------------------------------

local unitName = "tllasp"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 8953,
  buildCostMetal     = 451,
  buildDistance      = 8,
  builder            = true,
  buildTime          = 24760,
  category           = [[TLL LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Automatically repairs aircraft]],
  designation        = [[]],
  energyMake         = 10,
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Répare automatiquement les avions]],
  frenchname         = [[Piste de réparations]],
  germandescription  = [[Repariert Lufteinheiten automatisch]],
  germanname         = [[Luftfahrt-Reparaturset]],
  isAirBase          = true,
  maxDamage          = 718,
  maxSlope           = 10,
  maxWaterDepth      = 1,
  name               = [[Air Repair Pad]],
  noAutoFire         = false,
  objectName         = [[TLLASP]],
  onoffable          = true,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[TLL]],
  sightDistance      = 193,
  threed             = 1,
  unitname           = [[tllasp]],
  unitnumber         = 805,
  version            = 1,
  workerTime         = 9000,
  yardMap            = [[oooo oooo oooo oooo]],
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
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllasp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
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
