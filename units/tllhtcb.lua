-- UNITDEF -- TLLHTCB --
--------------------------------------------------------------------------------

local unitName = "tllhtcb"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2,
  bmcode             = 1,
  brakeRate          = 0.35,
  buildCostEnergy    = 12522,
  buildCostMetal     = 900,
  buildDistance      = 82,
  builder            = true,
  buildTime          = 25153,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[TLL KBOT LEVEL3 CONSTR NOWEAPON NOTAIR NOTSUB CTRL_B]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[High Tech Contruction Vehicle]],
  designation        = [[TL-HTCB]],
  energyMake         = 45,
  energyUse          = -2,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Constructeur High Tech]],
  maneuverleashlength = 640,
  maxDamage          = 3200,
  maxSlope           = 20,
  maxVelocity        = .595,
  maxWaterDepth      = 35,
  metalMake          = 1.9,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[High Tech Builder]],
  objectName         = [[TLLHTCB]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 290,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 2,
  TEDClass           = [[CNSTR]],
  threed             = 1,
  turnRate           = 128,
  unitname           = [[tllhtcb]],
  unitnumber         = 935,
  upright            = true,
  version            = 3.1,
  workerTime         = 300,
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 2545,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 100,
    metal              = 680,
    object             = [[tllhtcb_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1434,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 5,
    metal              = 312,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
