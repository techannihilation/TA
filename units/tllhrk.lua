-- UNITDEF -- TLLHRK --
--------------------------------------------------------------------------------

local unitName = "tllhrk"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 1370,
  buildCostMetal     = 642,
  builder            = false,
  buildTime          = 5519,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT WEAPON ALL NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-Terrain Heavy rocket Kbot]],
  designation        = [[TL-HRK]],
  downloadable       = 1,
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Lanceur-roquette lourd]],
  germandescription  = [[Schwerer Raketen-Kbot]],
  italiandescription = [[Kbot lanciarazzi pesante]],
  maneuverleashlength = 640,
  maxDamage          = 655,
  maxSlope           = 14,
  maxVelocity        = 1.4,
  maxWaterDepth      = 21,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTKBOT4]],
  name               = [[Rlik]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLHRK]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 285,
  spanishdescription = [[Kbot Lanzacohetes pesado]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 658,
  unitname           = [[tllhrk]],
  unitnumber         = 932,
  upright            = true,
  version            = 3.1,
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORHRK_ROCKET]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORHRK_ROCKET = {
    areaOfEffect       = 60,
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
    model              = [[corkbmissl1]],
    name               = [[HeavyRockets]],
    noautorange        = 1,
    noSelfDamage       = true,
    range              = 1210,
    reloadtime         = 7,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    turnRate           = 28384,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 100,
    weaponTimer        = 3,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 800,
    damage = {
      default            = 750,
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
    damage             = 445,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 12,
    hitdensity         = 100,
    metal              = 412,
    object             = [[tllhrk_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 234,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    hitdensity         = 5,
    metal              = 159,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
