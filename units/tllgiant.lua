-- UNITDEF -- TLLGIANT --
--------------------------------------------------------------------------------

local unitName = "tllgiant"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.013,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.022,
  buildAngle         = 16384,
  buildCostEnergy    = 12507,
  buildCostMetal     = 1395,
  builder            = true,
  buildTime          = 25941,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ENERGY LEVEL2 NOWEAPON NOTAIR NOTSTRUCTURE CTRL_R]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Light Carrier]],
  designation        = [[]],
  energyMake         = 410,
  energyUse          = 42,
  explodeAs          = [[ATOMIC_BLAST]],
  floater            = true,
  footprintX         = 6,
  footprintZ         = 6,
  frenchdescription  = [[Porte-avions léger]],
  germandescription  = [[Leichter Flugzeugträger]],
  isAirBase          = true,
  italiandescription = [[Portaerei leggera]],
  maneuverleashlength = 1640,
  maxDamage          = 3700,
  maxVelocity        = 2.35,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  movementClass      = [[DBOAT6]],
  name               = [[Giant]],
  noAutoFire         = false,
  objectName         = [[TLLGIANT]],
  onoffable          = true,
  radarDistance      = 1850,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Transporte ligero]],
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  threed             = 1,
  turnRate           = 72,
  unitname           = [[tllgiant]],
  unitnumber         = 907,
  version            = 3.1,
  waterline          = 7,
  workerTime         = 220,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 2431,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = 881,
    object             = [[tllgiant_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1521,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 20,
    metal              = 401,
    object             = [[4x4d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
