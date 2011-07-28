-- UNITDEF -- ARMACV --
--------------------------------------------------------------------------------

local unitName = "armacv"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0363,
  bmcode             = 1,
  brakeRate          = 0.1518,
  buildCostEnergy    = 52063,
  buildCostMetal     = 2931,
  buildDistance      = 135,
  builder            = true,
  buildPic           = [[ARMACV.DDS]],
  buildTime          = 20397,
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
  maxDamage          = 3860,
  maxSlope           = 16,
  maxVelocity        = 1.87,
  maxWaterDepth      = 18,
  metalMake          = 0.2,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Advanced Construction Vehicle]],
  noAutoFire         = false,
  objectName         = [[ARMACV]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[arm]],
  sightDistance      = 289.9,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 750,
  trackOffset        = 0,
  trackStrength      = 6,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 34,
  turnRate           = 399,
  unitname           = [[armacv]],
  workerTime         = 350,
  buildoptions = {
    [[armfus]],
    [[aafus]],
    [[armckfus]],
    [[amgeo]],
    [[armgmm]],
    [[armevp]],
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
    [[armvp]],
    [[armavp]],
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
      [[varmmove]],
    },
    select = {
      [[varmsel]],
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
    object             = [[ARMACV_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
