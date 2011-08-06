-- UNITDEF -- CORACA --
--------------------------------------------------------------------------------

local unitName = "coraca"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.066,
  bankscale          = 1.5,
  bmcode             = 1,
  brakeRate          = 1.875,
  buildCostEnergy    = 28824,
  buildCostMetal     = 2731,
  buildDistance      = 60,
  builder            = true,
  buildPic           = [[CORACA.DDS]],
  buildTime          = 28001,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE ANTIGATOR NOTSUB ANTIFLAME ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  corpse             = [[1_DEAD]],
  cruiseAlt          = 70,
  defaultmissiontype = [[VTOL_Standby]],
  description        = [[Tech Level 2]],
  energyMake         = 10,
  energyStorage      = 50,
  energyUse          = 10,
  explodeAs          = [[CA_EX]],
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[air]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 1280,
  maxDamage          = 2185,
  maxSlope           = 10,
  maxVelocity        = 8.05,
  maxWaterDepth      = 0,
  metalMake          = 0.1,
  metalStorage       = 50,
  mobilestandorders  = 1,
  name               = [[Advanced Construction Aircraft]],
  noAutoFire         = false,
  objectName         = [[CORACA]],
  radarDistance      = 50,
  scale              = 0.8,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 383.5,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  turnRate           = 121,
  unitname           = [[coraca]],
  workerTime         = 180,
  buildoptions = {
    [[corfus]],
    [[corplat]],
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
    [[corap]],
    [[coraap]],
    [[tawf010]],
    [[core_intimidator]],
    [[corboucher]],
    [[corech18]],
  },
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
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
      [[vtolcrmv]],
    },
    select = {
      [[vtolcrac]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ["1_DEAD"] = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Construction Airplane Wreckage]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORACA_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
