-- UNITDEF -- AFUSIONPLANT --
--------------------------------------------------------------------------------

local unitName = "afusionplant"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 90096,
  buildCostEnergy    = 955000,
  buildCostMetal     = 33835,
  builder            = false,
  buildTime          = 1583000,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[138 99 72]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Box]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces 20000 energy]],
  energyMake         = 20000,
  energyStorage      = 20000,
  energyUse          = 0,
  explodeAs          = [[SUPERBLAST_BUILDING]],
  floater            = true,
  footprintX         = 11,
  footprintZ         = 8,
  iconType           = [[building]],
  maxDamage          = 26500.0,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Mega Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[AFusionPlant]],
  radarDistance      = 0,
  seismicSignature   = 0,
  selfDestructAs     = [[SUPERBLAST_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 300,
  smoothAnim         = true,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  turnRate           = 0,
  unitname           = [[afusionplant]],
  unitnumber         = 33,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
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
      [[fusion1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = 1600480,
    description        = [[Mega fusion wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 40,
    hitdensity         = 100,
    metal              = 20008,
    object             = [[AFusionPlant_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 840480,
    description        = [[Mega Fusion Debris]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 7488,
    object             = [[AFusionPlant_heap]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
