-- UNITDEF -- CORHP --
--------------------------------------------------------------------------------

local unitName = "corhp"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 4065,
  buildCostMetal     = 1019,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 9,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = [[asphalt512c.dds]],
  buildPic           = [[CORHP.DDS]],
  buildTime          = 14253,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL PLANT NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
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
  maxDamage          = 3356,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Hovercraft Platform]],
  noAutoFire         = false,
  objectName         = [[CORHP]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 312,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[corhp]],
  useBuildingGroundDecal = true,
  workerTime         = 200,
  yardMap            = [[occccccooccccccooccccccooccccccooccccccooccccccoocccccco]],
  buildoptions = {
    [[corch]],
    [[corsh]],
    [[corsnap]],
    [[corah]],
    [[cormh]],
    [[corthovr]],
    [[nsaclash]],
  },
  sounds = {
    build              = [[hoverok2]],
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
      [[hoversl2]],
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
    object             = [[CORHP_DEAD]],
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
    object             = [[7X7D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
