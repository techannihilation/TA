-- UNITDEF -- TLLMIXER --
--------------------------------------------------------------------------------

local unitName = "tllmixer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.077,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.017,
  buildCostEnergy    = 2181,
  buildCostMetal     = 133,
  builder            = false,
  buildTime          = 6895,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Radar Jammer Ship]],
  designation        = [[]],
  energyUse          = 20,
  explodeAs          = [[BIG_UNITEX]],
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Brouilleur de radar]],
  germandescription  = [[Radar-Störboot]],
  italiandescription = [[Nave - Crea disturbi Radar]],
  maneuverleashlength = 640,
  maxDamage          = 540,
  maxVelocity        = 2.6,
  minWaterDepth      = 6,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Mixer]],
  noAutoFire         = false,
  objectName         = [[TLLMIXER]],
  onoffable          = true,
  radarDistanceJam   = 715,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 305,
  sonarDistance      = 0,
  spanishdescription = [[Buque distorsionador de radar]],
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 385,
  unitname           = [[tllmixer]],
  unitnumber         = 909,
  version            = 3.1,
  waterline          = 4,
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
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllmixer_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
