-- UNITDEF -- ARMAVP --
--------------------------------------------------------------------------------

local unitName = "armavp"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 71440,
  buildCostMetal     = 3598,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 8,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = [[armavp_aoplane.dds]],
  buildPic           = [[ARMAVP.DDS]],
  buildTime          = 36440,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[DEAD1]],
  description        = [[Produces T2 Vehicles]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 6,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4296,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Vehicle Plant]],
  noAutoFire         = false,
  objectName         = [[ARMAVP]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 283.4,
  smoothAnim         = true,
  sortbias           = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[armavp]],
  useBuildingGroundDecal = true,
  workerTime         = 400,
  yardMap            = [[occcccoocccccoocccccoocccccoocccccooccccco]],
  buildoptions = {
    [[armacv]],
    [[consul]],
    [[armcroc]],
    [[armlatnk]],
    [[armbull]],
    [[armbull2]],
    [[tawf014]],
    [[armst]],
    [[armmart]],
    [[armmerl]],
    [[armmanni]],
    [[armyork]],
    [[armseer]],
    [[armjam]],
    [[armorca]],
    [[tankanotor]],
    [[vaporiser]],
    [[armscpion]],
    [[armcd]],
  },
  sounds = {
    build              = [[pvehwork]],
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
      [[pvehactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD1 = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Vehicle Plant Wreckage]],
    energy             = 14000,
    featureDead        = [[HEAP1]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMAVP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP1 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Vehicle Plant Heap]],
    energy             = 700,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6X6D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
