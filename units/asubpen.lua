-- UNITDEF -- ASUBPEN --
--------------------------------------------------------------------------------

local unitName = "asubpen"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 5144,
  buildCostMetal     = 860,
  builder            = true,
  buildPic           = [[ASUBPEN.DDS]],
  buildTime          = 11112,
  canPatrol          = true,
  category           = [[ALL PLANT NOTSUB NOWEAPON NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Produces Amphibious/Underwater Units]],
  energyStorage      = 150,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2400,
  maxSlope           = 10,
  maxVelocity        = 0,
  metalMake          = 1,
  metalStorage       = 150,
  minWaterDepth      = 25,
  mobilestandorders  = 1,
  name               = [[Amphibious Complex]],
  noAutoFire         = false,
  objectName         = [[ASUBPEN]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 234,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[asubpen]],
  workerTime         = 150,
  yardMap            = [[oooooooooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCooCCCCCCo]],
  buildoptions = {
    [[armbeaver]],
    [[armpincer]],
    [[armcroc]],
    [[armjeth]],
    [[armaak]],
    [[armsub]],
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
  DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Amphibious Complex Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 5,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ASUBPEN_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
