-- UNITDEF -- CORLAB --
--------------------------------------------------------------------------------

local unitName = "corlab"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 1250,
  buildCostMetal     = 580,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 7,
  buildingGroundDecalSizeY = 7,
  buildingGroundDecalType = [[asphalt512c.dds]],
  buildPic           = [[CORLAB.DDS]],
  buildTime          = 5500,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL PLANT NOTLAND NOWEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Produces Level 1 Kbots]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2600,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 100,
  mobilestandorders  = 1,
  name               = [[Kbot Lab]],
  noAutoFire         = false,
  objectName         = [[CORLAB]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 287.3,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[corlab]],
  useBuildingGroundDecal = true,
  workerTime         = 250,
  yardMap            = [[occccooccccooccccooccccooccccoocccco]],
  buildoptions = {
    [[corck]],
    [[corak]],
    [[cornecro]],
    [[corstorm]],
    [[corthud]],
    [[corcrash]],
    [[armflea1]],
    [[gladiator]],
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
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Kbot Lab Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORLAB_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Kbot Lab Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6X6B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
