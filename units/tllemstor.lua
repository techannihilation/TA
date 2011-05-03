-- UNITDEF -- TLLEMSTOR --
--------------------------------------------------------------------------------

local unitName = "tllemstor"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 21230,
  buildCostMetal     = 1514,
  builder            = false,
  buildTime          = 17710,
  category           = [[TLL ENERGY LEVEL3 NOWEAPON  NOTAIR NOTSUB STORAGE]],
  cloakCost          = 680,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Increases Energy & Metal Storage [80000/15000]],
  designation        = [[TL-EMS]],
  energyStorage      = 80000,
  energyUse          = -15,
  explodeAs          = [[COMMANDER_BLAST1]],
  footprintX         = 8,
  footprintZ         = 8,
  frenchdescription  = [[Augmente le stockage d'énergie et de métal]],
  frenchname         = [[Super Dépôt d'énergie & de métal]],
  iconType           = [[building]],
  maxDamage          = 16200,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 15000,
  name               = [[Hardazous Super Storage]],
  noAutoFire         = false,
  objectName         = [[TLLEMSTOR]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[COMMANDER_BLAST]],
  side               = [[TLL]],
  sightDistance      = 210,
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[tllemstor]],
  unitnumber         = 939,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo]],
  zbuffer            = 1,
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
      [[storngy1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 3200,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 8,
    height             = 12,
    hitdensity         = 100,
    metal              = 968,
    object             = [[tllemstor_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1540,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 8,
    hitdensity         = 4,
    metal              = 373,
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
