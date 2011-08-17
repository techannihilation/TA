-- UNITDEF -- TLLSUBPEN --
--------------------------------------------------------------------------------

local unitName = "tllsubpen"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 520,
  buildCostMetal     = 842,
  builder            = true,
  buildTime          = 6520,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL PLANT NOWEAPON NOTAIR LEVEL1 NOWEAPON NOTAIR NOTSUB ]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[129 59 132]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Produces Subs]],
  designation        = [[TL-SP]],
  energyStorage      = 150,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 8,
  maxDamage          = 3510,
  metalMake          = 1.2,
  metalStorage       = 150,
  minWaterDepth      = 45,
  mobilestandorders  = 1,
  name               = [[Sub Pen]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLsubpen]],
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 212,
  sonarDistance      = 500,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllsubpen]],
  unitnumber         = 884,
  version            = 3.1,
  waterline          = 55,
  workerTime         = 115,
  yardMap            = [[wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC wwwCCCCC]],
  zbuffer            = 1,
  buildoptions = {
    [[tllcsub]],
    [[tllacsub]],
    [[tllplunger]],
    [[tllmanta]],
    [[tllorc]],
    [[tllwhale]],
    [[tllsquid]],
    [[tllshark]],
    [[tllarchnano]],
    [[tllamphibot]],
    [[tllsalamander]],
    [[tllfirestarter]],
    [[tllaak]],



  },
  sounds = {
    build              = [[pshpwork]],
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
      [[pshpactv]],
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
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsubpen_dead]],
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
    footprintX         = 8,
    footprintZ         = 8,
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
