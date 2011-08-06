-- UNITDEF -- CBUILDERLVL2 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0266,
  activateWhenBuilt  = true,
  airHoverFactor     = 0,
  brakeRate          = 1.5295,
  buildCostEnergy    = 3358,
  buildCostMetal     = 654,
  buildDistance      = 100,
  builder            = true,
  buildTime          = 4241.250,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB ANTIFLAME ANTIGATOR ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  corpse             = [[dead]],
  cruiseAlt          = 130,
  description        = [[Makes Upgraded t1 Economy]],
  designation        = [[GZ-MCA]],
  dontland           = 1,
  energyMake         = 20,
  energyStorage      = 400,
  energyUse          = 12.1,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[air]],
  maxDamage          = 231,
  maxSlope           = 10,
  maxVelocity        = 7.182,
  maxWaterDepth      = 0,
  metalMake          = .5,
  metalStorage       = 100,
  name               = [[Constructer]],
  objectName         = [[CBuilderLvl2.s3o]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALLSHIP]],
  side               = [[CORE]],
  sightDistance      = 270,
  turnRate           = 353.78,
  unitname           = [[cbuilderlvl2]],
  workerTime         = 100,
  buildoptions = {
    [[cmetalmakerlvl1]],
    [[core_wind_generator]],
    [[cormex1]],
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
    description        = [[Constructer Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CBuilderLvl2_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
