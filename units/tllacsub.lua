-- UNITDEF -- TLLACSUB --
--------------------------------------------------------------------------------

local unitName = "tllacsub"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.03,
  bmcode             = 1,
  brakeRate          = 0.2,
  buildCostEnergy    = 7986,
  buildCostMetal     = 1112,
  buildDistance      = 110,
  builder            = true,
  buildTime          = 17151,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[TLL UNDERWATER LEVEL2 CONSTR NOWEAPON NOTAIR ]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[36 26 66]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Build UW Structures]],
  designation        = [[TL-CS]],
  downloadable       = 1,
  energyMake         = 18,
  energyStorage      = 50,
  energyUse          = 0.9,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Niveau Tech 2]],
  frenchname         = [[Ss-marin de constr. évolué]],
  germandescription  = [[Tech Level 2]],
  germanname         = [[Verb. Konstr. U-Boot]],
  maneuverleashlength = 640,
  maxDamage          = 365,
  maxVelocity        = 2,
  metalMake          = 0.9,
  metalStorage       = 50,
  minWaterDepth      = 20,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT4]],
  name               = [[Advanced Construction Sub]],
  noAutoFire         = false,
  objectName         = [[TLLACSUB]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 120,
  sonarDistance      = 450,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 240,
  unitname           = [[tllacsub]],
  unitnumber         = 897,
  version            = 3.1,
  waterline          = 30,
  workerTime         = 650,
  zbuffer            = 1,
  buildoptions = {
    [[tlluwfusion]],
    [[tllauwmex]],
    [[tllplat]],
    [[tllsy]],
    [[tllasy]],
    [[tllsubpen]],
    [[tlllmtns]],
    [[tllnssam]],
    [[tllatorp]],
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
      [[suarmmov]],
    },
    select = {
      [[suarmsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllacsub_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
