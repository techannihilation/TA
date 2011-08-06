-- UNITDEF -- ARMSHLTX1 --
--------------------------------------------------------------------------------

local unitName = "armshltx1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 254540,
  buildCostMetal     = 17396,
  builder            = true,
  buildingGroundDecalDecaySpeed = 0.01,
  buildingGroundDecalSizeX = 20,
  buildingGroundDecalSizeY = 20,
  buildingGroundDecalType = [[asphalt512.dds]],
  buildPic           = [[ARMSHLTX.DDS]],
  buildTime          = 261380,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[DEAD]],
  description        = [[Produces Level 4 Units]],
  energyStorage      = 1400,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 18,
  footprintZ         = 18,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 104400,
  maxSlope           = 18,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 800,
  mobilestandorders  = 1,
  name               = [[Prototype Gantry]],
  noAutoFire         = false,
  objectName         = [[ARMSHLTX1]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[armshltx1]],
  useBuildingGroundDecal = true,
  workerTime         = 600,
  yardMap            = [[oooooooooooooooooo oooooooooooooooooo oooooooooooooooooo oooooooooooooooooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo ooooccccccccccoooo]],
  buildoptions = {
    [[armbanth1]],
    [[armraz1]],
    [[armraptor]],
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:YellowLight]],
    },
  },
  sounds = {
    activate           = [[gantok2]],
    build              = [[gantok2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[gantok2]],
    repair             = [[lathelrg]],
    underattack        = [[warning1]],
    unitcomplete       = [[gantok1]],
    working            = [[build]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[gantsel1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Experimental Gantry Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 18,
    footprintZ         = 18,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armshltx1_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Experimental Gantry Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 18,
    footprintZ         = 18,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
