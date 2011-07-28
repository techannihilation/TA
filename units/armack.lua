-- UNITDEF -- ARMACK --
--------------------------------------------------------------------------------

local unitName = "armack"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.216,
  bmcode             = 1,
  brakeRate          = 0.45,
  buildCostEnergy    = 33084,
  buildCostMetal     = 2500,
  buildDistance      = 130,
  builder            = true,
  buildPic           = [[ARMACK.DDS]],
  buildTime          = 20432,
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
  maxDamage          = 2400,
  maxSlope           = 20,
  maxVelocity        = 1.15,
  maxWaterDepth      = 25,
  metalMake          = 0.14,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Advanced Construction Kbot]],
  noAutoFire         = false,
  objectName         = [[ARMACK]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[arm]],
  sightDistance      = 323.7,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 1220,
  turnRate           = 990,
  unitname           = [[armack]],
  upright            = true,
  workerTime         = 290,
  buildoptions = {
    [[armfus]],
    [[armckfus]],
    [[armshltx]],
    [[amgeo]],
    [[armgmm]],
    [[armmoho]],
    [[armmmkr]],
    [[armuwadves]],
    [[armuwadvms]],
    [[armarad]],
    [[armveil]],
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
    [[armlab]],
    [[armalab]],
    [[armmagneto]],
    [[arm_big_bertha]],
    [[nebraska]],
    [[armrech18]],
  },
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
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
    object             = [[ARMACK_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
