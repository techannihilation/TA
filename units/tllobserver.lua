-- UNITDEF -- TLLOBSERVER --
--------------------------------------------------------------------------------

local unitName = "tllobserver"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.045,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.018,
  buildCostEnergy    = 1009,
  buildCostMetal     = 190,
  builder            = false,
  buildTime          = 3655,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL NOWEAPON LEVEL2 NOTAIR NOTSUB NOTSTRUCTURE CTRL_R]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .75,
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Radar Kbot]],
  designation        = [[]],
  energyMake         = 15,
  energyUse          = 45,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Radar KBot]],
  germandescription  = [[Mobiler Radar-KBot]],
  maneuverleashlength = 320,
  maxDamage          = 805,
  maxSlope           = 16,
  maxVelocity        = 0.75,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[kbot2]],
  name               = [[Observer]],
  noAutoFire         = false,
  objectName         = [[TLLOBSERVER]],
  onoffable          = true,
  radarDistance      = 1800,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 240,
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 450,
  unitname           = [[tllobserver]],
  unitnumber         = 862,
  version            = 3.1,
  zbuffer            = 1,
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
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 155,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 122,
    object             = [[tllobserver_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 61,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 47,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
