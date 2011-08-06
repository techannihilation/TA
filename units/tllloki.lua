-- UNITDEF -- TLLLOKI --
--------------------------------------------------------------------------------

local unitName = "tllloki"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.012,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.01,
  buildCostEnergy    = 1351,
  buildCostMetal     = 482,
  builder            = false,
  buildTime          = 4770,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Artillery]],
  designation        = [[]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Artillerie mobile]],
  germandescription  = [[Mobile Artillerie]],
  italiandescription = [[Artiglieria mobile]],
  maneuverleashlength = 640,
  maxDamage          = 642,
  maxSlope           = 12,
  maxVelocity        = 1.40,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Loki]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLLOKI]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 230,
  spanishdescription = [[Artillería móvil]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 350,
  unitname           = [[tllloki]],
  unitnumber         = 836,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORE_ARTILLERY]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_ARTILLERY = {
    accuracy           = 960,
    areaOfEffect       = 129,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    explosionGenerator = [[custom:FLASH4]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    minbarrelangle     = -10,
    name               = [[PlasmaCannon]],
    noSelfDamage       = true,
    range              = 1265,
    reloadtime         = 2,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 413.24932861328,
    damage = {
      default            = 90,
      gunships           = 17,
      hgunships          = 17,
      l1bombers          = 17,
      l1fighters         = 17,
      l1subs             = 5,
      l2bombers          = 17,
      l2fighters         = 17,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 17,
      vtol               = 17,
      vtrans             = 17,
    },
  },
}
unitDef.weaponDefs = weaponDefs


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
    hitdensity         = 200,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TLLLOKI_dead]],
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
    hitdensity         = 80,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
