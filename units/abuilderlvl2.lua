-- UNITDEF -- ABUILDERLVL2 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0266,
  activateWhenBuilt  = true,
  airHoverFactor     = 0,
  brakeRate          = 1.596,
  buildCostEnergy    = 3619,
  buildCostMetal     = 668,
  buildDistance      = 100,
  builder            = true,
  buildTime          = 3992.6475,
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
  designation        = [[ARN-MCA]],
  dontland           = 1,
  energyMake         = 20,
  energyStorage      = 500,
  energyUse          = 10.1,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[air]],
  maxDamage          = 235,
  maxSlope           = 10,
  maxVelocity        = 8.379,
  maxWaterDepth      = 0,
  metalMake          = .5,
  metalStorage       = 100,
  name               = [[ditawn]],
  objectName         = [[ABuilderLvl2]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALLSHIP]],
  side               = [[ARM]],
  sightDistance      = 400,
  turnRate           = 380.38,
  unitname           = [[abuilderlvl2]],
  workerTime         = 100,
  buildoptions = {
    [[ametalmakerlvl1]],
    [[arm_wind_generator]],
    [[armmex1]],
  },
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    arrived = {
      [[armshipstop]],
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
      [[armshipgo]],
    },
    select = {
      [[armselect]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Ditawn Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ABuilderLvl2_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
