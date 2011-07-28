-- UNITDEF -- CORACV --
--------------------------------------------------------------------------------

local unitName = "coracv"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.033,
  bmcode             = 1,
  brakeRate          = 0.1375,
  buildCostEnergy    = 55012,
  buildCostMetal     = 2852,
  buildDistance      = 95,
  builder            = true,
  buildPic           = [[CORACV.DDS]],
  buildTime          = 20882,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[1_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Tech Level 3]],
  energyMake         = 20,
  energyStorage      = 100,
  energyUse          = 20,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 3930,
  maxSlope           = 16,
  maxVelocity        = 1.76,
  maxWaterDepth      = 18,
  metalMake          = 0.2,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Advanced Construction Vehicle]],
  noAutoFire         = false,
  objectName         = [[CORACV]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[core]],
  sightDistance      = 295.1,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 750,
  trackOffset        = 0,
  trackStrength      = 6,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 34,
  turnRate           = 363,
  unitname           = [[coracv]],
  workerTime         = 350,
  buildoptions = {
    [[corfus]],
    [[cafus]],
    [[cmgeo]],
    [[corbhmth]],
    [[corevp]],
    [[cormoho]],
    [[cormexp]],
    [[cormmkr]],
    [[coruwadves]],
    [[coruwadvms]],
    [[corarad]],
    [[corshroud]],
    [[corfort]],
    [[corasp]],
    [[cortarg]],
    [[corsd]],
    [[corgate]],
    [[corflak]],
    [[screamer]],
    [[cortron]],
    [[corfmd]],
    [[corsilo]],
    [[corint]],
    [[corbuzz]],
    [[corvp]],
    [[coravp]],
    [[tawf010]],
    [[core_intimidator]],
    [[corboucher]],
    [[corech18]],
  },
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
    repair             = [[repair2]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ["1_DEAD"] = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Construction Vehicle Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORACV_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
