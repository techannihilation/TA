-- UNITDEF -- ARMACK1 --
--------------------------------------------------------------------------------

local unitName = "armack1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.216,
  bmcode             = 1,
  brakeRate          = 0.45,
  buildCostEnergy    = 40084,
  buildCostMetal     = 3190,
  buildDistance      = 110,
  builder            = true,
  buildPic           = [[ARMACK.DDS]],
  buildTime          = 39432,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ARM KBOT MOBILE NOWEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 ALL]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Upg T2 Kbot]],
  energyMake         = 14,
  energyStorage      = 100,
  energyUse          = 14,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 3840,
  maxSlope           = 20,
  maxVelocity        = 1.15,
  maxWaterDepth      = 25,
  metalMake          = 0.14,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Tech 3 Kbot]],
  noAutoFire         = false,
  objectName         = [[ARMACK]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 323.7,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[CNSTR]],
  turnRate           = 990,
  unitname           = [[armack1]],
  upright            = true,
  workerTime         = 340,
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
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 22504,
    description        = [[Advanced Construction Kbot Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 1689,
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
