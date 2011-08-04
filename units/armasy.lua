-- UNITDEF -- ARMASY --
--------------------------------------------------------------------------------

local unitName = "armasy"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 32096,
  buildCostMetal     = 3632,
  builder            = true,
  buildPic           = [[ARMASY.DDS]],
  buildTime          = 35972,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND PLANT NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[1_DEAD]],
  description        = [[Produces T2 ships]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 12,
  footprintZ         = 12,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4512,
  maxVelocity        = 0,
  metalMake          = 1,
  metalStorage       = 200,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  name               = [[Advanced Shipyard]],
  noAutoFire         = false,
  objectName         = [[ARMASY]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 299,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  turnRate           = 0,
  unitname           = [[armasy]],
  waterline          = 6,
  workerTime         = 600,
  yardMap            = [[wCCCCCCCCCCwCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCwCCCCCCCCCCw]],
  buildoptions = {
    [[armacsub]],
    [[armrecl]],
    [[armmls]],
    [[armsubk]],
    [[tawf009]],
    [[armaas]],
    [[armcrus]],
    [[armbats]],
    [[armmship]],
    [[armcarry]],
    [[armsjam]],
  },
  sounds = {
    build              = [[pshpwork]],
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
      [[pshpactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ["1_DEAD"] = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Shipyard Wreckage]],
    energy             = 0,
    footprintX         = 12,
    footprintZ         = 12,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMASY_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
