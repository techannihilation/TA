-- UNITDEF -- CBUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.02527,
  airHoverFactor     = 0,
  brakeRate          = 1.9305,
  buildCostEnergy    = 584031.1675,
  buildCostMetal     = 24061.530,
  buildDistance      = 190,
  builder            = true,
  buildTime          = 360000.3975,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[BIG UNIT]],
  collide            = false,
  corpse             = [[dead]],
  cruiseAlt          = 180,
  description        = [[cruiser]],
  designation        = [[COR-SS-SUP]],
  dontland           = 0,
  energyMake         = 60,
  energyStorage      = 750,
  energyUse          = 30,
  explodeAs          = [[SHIPBLAST]],
  footprintX         = 3,
  footprintZ         = 5,
  iconType           = [[air]],
  maxDamage          = 8000.0,
  maxSlope           = 10,
  maxVelocity        = 3.591,
  maxWaterDepth      = 0,
  metalMake          = 3.75,
  metalStorage       = 100,
  name               = [[Builder Level 3]],
  objectName         = [[CBuilderLvl3]],
  radarDistance      = 0,
  selfDestructAs     = [[SHIPBLAST]],
  side               = [[CORE]],
  sightDistance      = 400,
  turnRate           = 199.50,
  unitname           = [[cbuilderlvl3]],
  workerTime         = 2000,
  buildoptions = {
    [[cfusionplant]],
    [[cmetalmakerlvl2]],
    [[cnanotower]],
    [[corgate1]],
    [[cshipyardlvl4]],
    [[corint1]],
    [[corbuzz1]],
    [[corgant1]],
    [[corflu]],
    [[cordoom1]],
    [[corfsilo]],
    [[corfmd2]],
    [[cormas]],
    [[corpre]],
    [[cadvmsto]],
  },
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    arrived = {
      [[bigstop]],
    },
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[biggo]],
    },
    select = {
      [[bigsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Fulcrum Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 8,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CBuilderLvl3_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
