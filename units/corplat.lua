-- UNITDEF -- CORPLAT --
--------------------------------------------------------------------------------

local unitName = "corplat"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 39321,
  buildCostMetal     = 5760,
  builder            = true,
  buildPic           = [[CORPLAT.DDS]],
  buildTime          = 20102,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL PLANT NOTLAND NOWEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  description        = [[Builds Seaplanes]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 7,
  footprintZ         = 7,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2000,
  maxVelocity        = 0,
  metalMake          = 1,
  metalStorage       = 200,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Seaplane Platform]],
  noAutoFire         = false,
  objectName         = [[CORPLAT]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 169,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  turnRate           = 0,
  unitname           = [[corplat]],
  waterline          = 23,
  workerTime         = 200,
  yardMap            = [[wwwwwwwwCCCCCwwCCCCCwwCCCCCwwCCCCCwwCCCCCwwwwwwww]],
  buildoptions = {
    [[corcsa]],
    [[corhunt]],
    [[corsfig]],
    [[corseap]],
    [[corcut]],
    [[corsb]],
  },
  sounds = {
    build              = [[seaplok2]],
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
      [[seaplsl2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Seaplane Platform Wreckage]],
    energy             = 0,
    footprintX         = 7,
    footprintZ         = 7,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORPLAT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
