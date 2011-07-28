-- UNITDEF -- TLLHOVERROCKET --
--------------------------------------------------------------------------------

local unitName = "tllhoverrocket"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.04,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.09,
  buildCostEnergy    = 3412,
  buildCostMetal     = 305,
  builder            = false,
  buildTime          = 12521,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Hovercraft Vpulse Launcher]],
  designation        = [[TLL-MRJ]],
  downloadable       = 1,
  energyMake         = 2.6,
  energyStorage      = 0,
  energyUse          = 2.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft Lance-Pulse]],
  germandescription  = [[Hovercraft-Raketenwerfer]],
  italiandescription = [[Hovercraft lanciarazzi]],
  maneuverleashlength = 640,
  maxDamage          = 482,
  maxSlope           = 16,
  maxVelocity        = 2.15,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Vandal]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tllhoverrocket]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 280,
  spanishdescription = [[Hovercraft lanzador de torpedos]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 360,
  unitname           = [[tllhoverrocket]],
  unitnumber         = 28803,
  version            = 1.2,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[hovmdof1]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[hovmdok1]],
    },
    select = {
      [[tllhoverok]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_Vpulse]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_Vpulse = {
    areaOfEffect       = 126,
    explosionart       = [[lrptexplo]],
    explosiongaf       = [[lrptexplo]],
    fireStarter        = 100,
    flightTime         = 10,
    guidance           = true,
    id                 = 236,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[vpulse]],
    name               = [[Vpulse Rocket]],
    noautorange        = 1,
    range              = 800,
    reloadtime         = 10.5,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .5,
    smokeTrail         = true,
    soundHit           = [[vpulsehit]],
    soundStart         = [[vpulsefire]],
    startsmoke         = 1,
    tolerance          = 4000,
    turnRate           = 24384,
    twoPhase           = true,
    vlaunch            = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 150,
    weaponTimer        = 3.5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 400,
    damage = {
      default            = 400,
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
    object             = [[tllhoverrocket_dead]],
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
