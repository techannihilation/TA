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
  category           = [[TLL  LEVEL2 NOWEAPON NOTAIR MOBILE ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Aircraft Carrier with Anti-Nuke]],
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
  sonarDistance      = 760,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
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
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[TLL_ROCKET]],
    },
  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_ROCKET = {
    areaOfEffect       = 420,
    avoidFriendly      = false,
    collideFriendly    = false,
    coverage           = 2000,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 7500,
    explosionGenerator = [[custom:FLASH4]],
    fireStarter        = 100,
    flightTime         = 120,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    interceptor        = 1,
    lineOfSight        = true,
    metalpershot       = 150,
    model              = [[amdrocket]],
    name               = [[Rocket]],
    noautorange        = 1,
    noSelfDamage       = true,
    range              = 72000,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 90,
    tolerance          = 4000,
    tracks             = true,
    turnRate           = 99000,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 75,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 3000,
    damage = {
      default            = 1500,
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
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllgiant_dead]],
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
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 20,
    metal              = unitDef.buildCostMetal*0.64,
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
