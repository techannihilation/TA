-- UNITDEF -- TLLSQUID --
--------------------------------------------------------------------------------

local unitName = "tllsquid"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.18,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.33,
  buildCostEnergy    = 3175,
  buildCostMetal     = 323,
  builder            = false,
  buildTime          = 13408,
  canAttack          = false,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL MOBILE WEAPON NOTLAND NOTAIR]],
  collisionvolumeoffsets = [[0 -3 0]],
  collisionvolumescales = [[35 35 65]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Sonar Jamming Sub]],
  designation        = [[]],
  energyUse          = 100,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Sous-Marin Brouilleur]],
  germandescription  = [[Sonar-Stör-U-Boot]],
  italiandescription = [[Disturbo sonar subacqueo]],
  maneuverleashlength = 640,
  maxDamage          = 480,
  maxVelocity        = 2.45,
  minWaterDepth      = 15,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT3]],
  name               = [[Squid]],
  noAutoFire         = false,
  objectName         = [[TLLSQUID]],
  onoffable          = true,
  radarDistance      = 100,
  radarDistanceJam   = 475,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  sonarDistance      = 120,
  sonarDistanceJam   = 475,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 580,
  unitname           = [[tllsquid]],
  unitnumber         = 912,
  upright            = true,
  version            = 3.1,
  waterline          = 30,
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
      [[suarmmov]],
    },
    select = {
      [[watrjam1]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsquid_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 20,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
