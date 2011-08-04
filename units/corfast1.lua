-- UNITDEF -- CORFAST1 --
--------------------------------------------------------------------------------

local unitName = "corfast1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 3583,
  buildCostMetal     = 392,
  buildDistance      = 80,
  builder            = true,
  buildPic           = [[CORFAST.DDS]],
  buildTime          = 6488,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canstop            = 1,
  category           = [[CORE KBOT MOBILE NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 ALL]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[fast assist engineer]],
  energyMake         = 15,
  energyStorage      = 100,
  energyUse          = 15,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  healtime           = 8,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 1150,
  maxSlope           = 17,
  maxVelocity        = 3,
  maxWaterDepth      = 22,
  metalMake          = 0.15,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[helper]],
  noAutoFire         = false,
  objectName         = [[CORFAST]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 520,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 2,
  turnRate           = 1210,
  unitname           = [[corfast1]],
  upright            = true,
  workerTime         = 300,
  buildoptions = {
    [[arm_guardian]],
    [[core_immolator]],
    [[armarch]],
    [[corgate2]],
    [[corerad1]],
    [[corllt1]],
    [[corrad1]],
    [[corrl1]],
    [[commando]],
    [[armraven1]],
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
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Helper Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORFAST_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
