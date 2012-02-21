-- UNITDEF -- COREAP --
--------------------------------------------------------------------------------

local unitName = "coreap"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 32175,
  buildCostMetal     = 4290,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 11,
  buildingGroundDecalSizeY = 11,
  buildingGroundDecalType = [[asphalt512c.dds]],
  buildPic           = [[COREAP.DDS]],
  buildTime          = 96525,
  canBeAssisted      = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[LEVEL3 NOTAIR ALL]],
  corpse             = [[DEAD]],
  description        = [[Produces Level 3 Aircraft]],
  energyStorage      = 300,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 10,
  footprintZ         = 10,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 12000,
  maxSlope           = 15,
  maxWaterDepth      = 0,
  metalStorage       = 300,
  mobilestandorders  = 1,
  name               = [[Extreme Aircraft Plant]],
  noAutoFire         = false,
  objectName         = [[COREAP]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 305.5,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  TEDClass           = [[PLANT]],
  turnRate           = 0,
  unitname           = [[coreap]],
  useBuildingGroundDecal = true,
  workerTime         = 100,
  yardMap            = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
  buildoptions = {
    [[coreca]],
    [[corkatana]],
    [[corerb]],
    [[corsbomb]],
    [[blackdawn]],
    [[corcrw]],
    [[corairmail]],
    [[corbtrans]],
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
  DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 2707,
    description        = [[Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    footprintX         = 10,
    footprintZ         = 10,
    height             = 4,
    hitdensity         = 100,
    metal              = 2645,
    object             = [[COREAP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 4800,
    description        = [[Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 9,
    footprintZ         = 9,
    height             = 4,
    hitdensity         = 100,
    metal              = 1058,
    object             = [[7X7B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
