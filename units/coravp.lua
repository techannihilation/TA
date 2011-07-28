-- UNITDEF -- CORAVP --
--------------------------------------------------------------------------------

local unitName = "coravp"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 71784,
  buildCostMetal     = 3547,
  builder            = true,
  buildingGroundDecalDecaySpeed = 3000,
  buildingGroundDecalSizeX = 10,
  buildingGroundDecalSizeY = 8,
  buildingGroundDecalType = [[asphalt512c.dds]],
  buildPic           = [[CORAVP.DDS]],
  buildTime          = 36492,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[DEAD1]],
  description        = [[Produces T2 Vehicles]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 9,
  footprintZ         = 7,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4628,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 200,
  mobilestandorders  = 1,
  name               = [[Advanced Vehicle Plant]],
  noAutoFire         = false,
  objectName         = [[CORAVP]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 286,
  smoothAnim         = true,
  sortbias           = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[coravp]],
  useBuildingGroundDecal = true,
  workerTime         = 400,
  yardMap            = [[oooooooooooooooooooocccccoooocccccoooocccccoooocccccoooocccccoo]],
  buildoptions = {
    [[coracv]],
    [[consul1]],
    [[corseal]],
    [[correap]],
    [[corparrow]],
    [[corgol]],
    [[tawf114]],
    [[cortotal]],
    [[intruder]],
    [[cormart]],
    [[corvroc]],
    [[trem]],
    [[corsent]],
    [[cormabm]],
    [[coreter]],
    [[corvrad]],
    [[nsacskv]],
    [[tawf116]],
    [[armciph]],
    [[cormonsta]],
    [[requ1]],
    [[cormddm]],
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:WhiteLight]],
    },
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
    energy             = 1600,
    featureDead        = [[HEAP1]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORAVP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP1 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Vehicle Plant Heap]],
    energy             = 800,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6X6C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
