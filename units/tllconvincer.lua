-- UNITDEF -- TLLCONVINCER --
--------------------------------------------------------------------------------

local unitName = "tllconvincer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.016,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.03,
  buildCostEnergy    = 1887,
  buildCostMetal     = 581,
  builder            = false,
  buildTime          = 9201,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Rocket Launcher]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Lance-Pulse mobile]],
  germandescription  = [[Mobiler Raketen-Werfer]],
  italiandescription = [[Lanciarazzi mobile]],
  maneuverleashlength = 320,
  maxDamage          = 645,
  maxSlope           = 16,
  maxVelocity        = 1.15,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Convincer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLCONVINCER]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 230,
  spanishdescription = [[Lanzacohetes móvil]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[tllconvincer]],
  unitnumber         = 872,
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[MOBILE]],
      def                = [[ARMTRUCK_ROCKET]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMTRUCK_ROCKET = {
    areaOfEffect       = 155,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    explosionGenerator = [[custom:STARFIRE]],
    fireStarter        = 100,
    flightTime         = 10,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[rocket]],
    name               = [[Rocket]],
    noautorange        = 1,
    noSelfDamage       = true,
    range              = 1800,
    reloadtime         = 16,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    tolerance          = 4000,
    turnRate           = 24384,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 102.4,
    weaponTimer        = 3.3,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 380,
    damage = {
      commanders         = 500,
      default            = 2200,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 120,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllconvincer_dead]],
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
    hitdensity         = 80,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
