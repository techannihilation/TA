-- UNITDEF -- CORALAB --
--------------------------------------------------------------------------------

local unitName = "coralab"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 61232,
  buildCostMetal     = 3581,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = [[asphalt512c.dds]],
  buildPic           = [[CORALAB.DDS]],
  buildTime          = 45519,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[DEAD1]],
  description        = [[Produces T2 Kbots]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 6,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4072,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Kbot Lab]],
  noAutoFire         = false,
  objectName         = [[CORALAB]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 288.6,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[coralab]],
  useBuildingGroundDecal = true,
  workerTime         = 400,
  yardMap            = [[ooooooooooooooocccccoccccccccccccccccccccc]],
  buildoptions = {
    [[corack]],
    [[corfast]],
    [[corpyro]],
    [[coramph]],
    [[corcan]],
    [[corsumo]],
    [[cormort]],
    [[corhrk]],
    [[coraak]],
    [[cordecom]],
    [[corvoyr]],
    [[corspy]],
    [[corspec]],
    [[corprot]],
    [[coredauber]],
    [[coremech]],
    [[corcrab]],
    [[armkrmi]],
    [[krogtaar]],
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:WhiteLight]],
    },
  },
  sounds = {
    build              = [[plabwork]],
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
      [[plabactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD1 = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Kbot Lab Wreckage]],
    energy             = 1100,
    featureDead        = [[HEAP1]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORALAB_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP1 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Kbot Lab Heap]],
    energy             = 600,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
