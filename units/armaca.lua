-- UNITDEF -- ARMACA --
--------------------------------------------------------------------------------

local unitName = "armaca"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.078,
  bankscale          = 1.5,
  bmcode             = 1,
  brakeRate          = 1.875,
  buildCostEnergy    = 29096,
  buildCostMetal     = 2720,
  buildDistance      = 60,
  builder            = true,
  buildPic           = [[ARMACA.DDS]],
  buildTime          = 27763,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB ANTIFLAME ANTIGATOR ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  corpse             = [[1_DEAD]],
  cruiseAlt          = 80,
  defaultmissiontype = [[VTOL_standby]],
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
  maxDamage          = 2180,
  maxSlope           = 10,
  maxVelocity        = 8.4,
  maxWaterDepth      = 0,
  metalMake          = 0.1,
  metalStorage       = 50,
  mobilestandorders  = 1,
  name               = [[Advanced Construction Aircraft]],
  noAutoFire         = false,
  objectName         = [[ARMACA]],
  radarDistance      = 50,
  scale              = 0.8,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[arm]],
  sightDistance      = 383.5,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 240,
  turnRate           = 138,
  unitname           = [[armaca]],
  workerTime         = 180,
  buildoptions = {
    [[armfus]],
    [[armckfus]],
    [[armplat]],
    [[amgeo]],
    [[armgmm]],
    [[armmoho]],
    [[armmmkr]],
    [[armuwadves]],
    [[armuwadvms]],
    [[armarad]],
    [[armveil]],
    [[armfort]],
    [[armasp]],
    [[armtarg]],
    [[armsd]],
    [[armgate]],
    [[armflak]],
    [[mercury]],
    [[armemp]],
    [[armamd]],
    [[armsilo]],
    [[armbrtha]],
    [[armvulc]],
    [[armdf]],
    [[armap]],
    [[armaap]],
    [[armmagneto]],
    [[arm_big_bertha]],
    [[nebraska]],
    [[armrech18]],
  },
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    repair             = [[repair1]],
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
      [[vtolarmv]],
    },
    select = {
      [[vtolarac]],
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
    object             = [[ARMACA_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
