-- UNITDEF -- TLLHTCP --
--------------------------------------------------------------------------------

local unitName = "tllhtcp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 9550,
  buildCostMetal     = 6148,
  builder            = true,
  buildTime          = 66120,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL3 NOWEAPON NOTAIR NOTSUB PLANT ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .75,
  description        = [[Produces High Tech Units]],
  designation        = [[]],
  energyStorage      = 1000,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 10,
  footprintZ         = 10,
  iconType           = [[building]],
  maxDamage          = 12575,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 1000,
  mobilestandorders  = 1,
  name               = [[High Tech Construction Plant]],
  noAutoFire         = false,
  objectName         = [[TLLHTCP]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 320,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  threed             = 1,
  unitname           = [[tllhtcp]],
  unitnumber         = 934,
  version            = 3.1,
  workerTime         = 980,
  yardMap            = [[oooccccooo oooccccooo oooccccooo cccccccccc cccccccccc cccccccccc oooccccooo oooccccooo oooccccooo oooccccooo ]],
  zbuffer            = 1,
  buildoptions = {
    [[tllhtcb]],
    [[tllhtml]],
    [[tllblind]],
    [[tllgrim]],
    [[tllmlrpc]],

  },
  sounds = {
    activate           = [[gantok2]],
    build              = [[gantok2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[gantok2]],
    repair             = [[lathelrg]],
    underattack        = [[warning1]],
    unitcomplete       = [[gantok1]],
    working            = [[build]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[gantsel1]],
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
    footprintX         = 8,
    footprintZ         = 8,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhtcp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featureDead        = [[tllhtcp_heap2]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 8,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7x7d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap2 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.216,
    description        = [[Metal Shards]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 11,
    footprintZ         = 11,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.512,
    object             = [[4x4d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
