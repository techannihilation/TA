-- UNITDEF -- ARMHP --
--------------------------------------------------------------------------------

local unitName = "armhp"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 3957,
  buildCostMetal     = 955,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = [[asphalt512.dds]],
  buildPic           = [[ARMHP.DDS]],
  buildTime          = 13890,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND PLANT NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  collisionvolumescales = [[120 32 106]],
  collisionvolumetype = [[Box]],
  corpse             = [[DEAD]],
  description        = [[Builds Hovercraft]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 7,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 3005,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Hovercraft Platform]],
  noAutoFire         = false,
  objectName         = [[ARMHP]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 286,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[armhp]],
  useBuildingGroundDecal = true,
  workerTime         = 200,
  yardMap            = [[occccccooccccccooccccccooccccccooccccccooccccccoocccccco]],
  buildoptions = {
    [[armch]],
    [[armsh]],
    [[armanac]],
    [[armah]],
    [[armmh]],
    [[armthovr]],
  },
  sounds = {
    build              = [[hoverok1]],
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
      [[hoversl1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Hovercraft Platform Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMHP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Hovercraft Platform Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7X7A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
