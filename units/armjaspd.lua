-- UNITDEF -- ARMJASPD --
--------------------------------------------------------------------------------

local unitName = "armjaspd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.15,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 1547,
  buildCostMetal     = 64,
  builder            = false,
  buildTime          = 5423,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-Terrain Jammer Kbot]],
  designation        = [[ARM-JASPD]],
  energyMake         = 15,
  energyStorage      = 0,
  energyUse          = 35,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 235,
  maxSlope           = 16,
  maxVelocity        = 1.15,
  maxWaterDepth      = 32,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TKBOT3]],
  name               = [[Difuser]],
  noAutoFire         = false,
  objectName         = [[ARMJASPD]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 0,
  radarDistanceJam   = 600,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 0,
  side               = [[ARM]],
  sightDistance      = 225,
  spanishdescription = [[Distorsionador de radar]],
  spanishname        = [[Difusor]],
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 950,
  unitname           = [[armjaspd]],
  unitnumber         = 6343,
  version            = 1.2,
  workerTime         = 0,
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
      [[spider2]],
    },
    select = {
      [[radjam4]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Difuser Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armjaspd_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Difuser Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
