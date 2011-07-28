-- UNITDEF -- ARMSPY --
--------------------------------------------------------------------------------

local unitName = "armspy"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.24,
  activateWhenBuilt  = true,
  amphibious         = 1,
  bmcode             = 1,
  brakeRate          = 0.2,
  buildCostEnergy    = 8219,
  buildCostMetal     = 128,
  builder            = false,
  buildPic           = [[ARMSPY.DDS]],
  buildTime          = 17631,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  cloakCost          = 50,
  cloakCostMoving    = 100,
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Radar-Invisible Spy Kbot]],
  energyMake         = 5,
  energyStorage      = 0,
  energyUse          = 5,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  immunetoparalyzer  = 1,
  maneuverleashlength = 640,
  maxDamage          = 270,
  maxSlope           = 32,
  maxVelocity        = 2.18,
  maxWaterDepth      = 112,
  metalStorage       = 0,
  minCloakDistance   = 75,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Infiltrator]],
  noAutoFire         = false,
  objectName         = [[ARMSPY]],
  onoffable          = true,
  seismicSignature   = 2,
  selfDestructAs     = [[SPYBOMBX]],
  selfDestructCountdown = 1,
  side               = [[ARM]],
  sightDistance      = 550,
  smoothAnim         = true,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  turnRate           = 1375,
  unitname           = [[armspy]],
  upright            = true,
  workerTime         = 0,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
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
    description        = [[Infiltrator Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMSPY_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Infiltrator Heap]],
    energy             = 0,
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
