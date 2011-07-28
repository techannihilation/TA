-- UNITDEF -- ARMFARK1 --
--------------------------------------------------------------------------------

local unitName = "armfark1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.216,
  bmcode             = 1,
  brakeRate          = 0.75,
  buildCostEnergy    = 2793,
  buildCostMetal     = 401,
  buildDistance      = 100,
  builder            = true,
  buildPic           = [[ARMFARK.DDS]],
  buildTime          = 4302,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = false,
  canstop            = 1,
  category           = [[ARM KBOT MOBILE NOWEAPON NOTAIR NOTSUB LEVEL2 ALL]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[fast assist engineer]],
  energyMake         = 12,
  energyStorage      = 25,
  energyUse          = 12,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 1200,
  maxSlope           = 14,
  maxVelocity        = 2.64,
  maxWaterDepth      = 22,
  metalMake          = 0.12,
  metalStorage       = 25,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[helper]],
  noAutoFire         = false,
  objectName         = [[ARMFARK]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 377,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  turnRate           = 1100,
  unitname           = [[armfark1]],
  upright            = true,
  workerTime         = 300,
  buildoptions = {
    [[arm_guardian]],
    [[arm_immolator]],
    [[armarch]],
    [[armgate2]],
    [[armcir1]],
    [[armllt1]],
    [[armrad1]],
    [[armrl1]],
    [[commando]],
    [[armshock1]],
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
    object             = [[ARMFARK_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
