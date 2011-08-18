-- UNITDEF -- TLLUWJAM --
--------------------------------------------------------------------------------

local unitName = "tlluwjam"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 803,
  buildCostMetal     = 121,
  builder            = false,
  buildTime          = 4912,
  category           = [[TLL SPECIAL NOWEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Sonar Jammer]],
  designation        = [[TL-uwj]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 15,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Brouilleur de Sonar]],
  frenchname         = [[Brouilleur]],
  germandescription  = [[Sonarstörer]],
  germanname         = [[Jammer]],
  iconType           = [[building]],
  maxDamage          = 250,
  maxSlope           = 10,
  metalStorage       = 0,
  minWaterDepth      = 30,
  name               = [[UW Sonar Jammer]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLuwjam]],
  onoffable          = true,
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 175,
  sonarDistanceJam   = 1300,
  threed             = 1,
  unitname           = [[tlluwjam]],
  unitnumber         = 869,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 103,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlluwjam_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3e]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
