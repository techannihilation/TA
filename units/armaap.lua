-- UNITDEF -- ARMAAP --
--------------------------------------------------------------------------------

local unitName = "armaap"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 64986,
  buildCostMetal     = 4606,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = [[armaap_aoplane.dds]],
  buildPic           = [[ARMAAP.DDS]],
  buildTime          = 40851,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[DEAD1]],
  description        = [[Produces T2 Aircraft]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 6,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 3360,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Aircraft Plant]],
  noAutoFire         = false,
  objectName         = [[ARMAAP]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 312,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[armaap]],
  useBuildingGroundDecal = true,
  workerTime         = 400,
  yardMap            = [[oooooooooooooooooooooooooooooooooooooooooooooooo]],
  buildoptions = {
    [[armaca]],
    [[abuilderlvl1]],
    [[armbrawl]],
    [[armpnix]],
    [[armlance]],
    [[armhawk]],
    [[armawac]],
    [[armdfly]],
    [[blade]],
    [[corgripn]],
    [[armcybr]],
    [[b52g]],
    [[armpers]],
    [[airwolf3g]],
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:YellowLight]],
    },
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
  DEAD1 = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Aircraft Plant Wreckage]],
    energy             = 10000,
    featureDead        = [[HEAP1]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 7,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMAAP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP1 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Aircraft Plant Heap]],
    energy             = 4000,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6X6A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
