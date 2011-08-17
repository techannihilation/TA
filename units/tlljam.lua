-- UNITDEF -- TLLJAM --
--------------------------------------------------------------------------------

local unitName = "tlljam"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 4899,
  buildCostEnergy    = 2341,
  buildCostMetal     = 152,
  builder            = false,
  buildTime          = 6555,
  canAttack          = false,
  category           = [[TLL ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Radar Jammer]],
  designation        = [[TL-JAM]],
  energyStorage      = 0,
  energyUse          = 60,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Brouilleur de radar]],
  frenchname         = [[Brouilleur]],
  germandescription  = [[Radarstörer]],
  germanname         = [[Jammer]],
  iconType           = [[building]],
  maxDamage          = 782,
  maxSlope           = 12,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Jammer]],
  noAutoFire         = false,
  objectName         = [[tlljam]],
  onoffable          = true,
  radarDistanceJam   = 562,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[TLL]],
  sightDistance      = 240,
  threed             = 1,
  unitname           = [[tlljam]],
  unitnumber         = 841,
  version            = 3.1,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[kbarmmov]],
    },
    select = {
      [[radjam1]],
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
    footprintX         = 2,
    footprintZ         = 2,
    height             = 12,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlljam_dead]],
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
    footprintX         = 2,
    footprintZ         = 2,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
