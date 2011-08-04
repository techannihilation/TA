-- UNITDEF -- CORACK --
--------------------------------------------------------------------------------

local unitName = "corack"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.204,
  bmcode             = 1,
  brakeRate          = 0.425,
  buildCostEnergy    = 30342,
  buildCostMetal     = 2519,
  buildDistance      = 130,
  builder            = true,
  buildPic           = [[CORACK.DDS]],
  buildTime          = 20709,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[1_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Tech Level 2]],
  energyMake         = 14,
  energyStorage      = 100,
  energyUse          = 14,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 3000,
  maxSlope           = 20,
  maxVelocity        = 1.1,
  maxWaterDepth      = 25,
  metalMake          = 0.14,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Advanced Construction Kbot]],
  noAutoFire         = false,
  objectName         = [[CORACK]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[core]],
  sightDistance      = 318.5,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 1240,
  turnRate           = 935,
  unitname           = [[corack]],
  upright            = true,
  workerTime         = 290,
  buildoptions = {
    [[corfus]],
    [[corgant]],
    [[cmgeo]],
    [[corbhmth]],
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
    [[corlab]],
    [[coralab]],
    [[tawf010]],
    [[core_intimidator]],
    [[corboucher]],
    [[corech18]],
  },
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture2]],
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ["1_DEAD"] = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Construction Kbot Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORACK_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
