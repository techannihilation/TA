-- UNITDEF -- TLLHOVERLIGHT --
--------------------------------------------------------------------------------

local unitName = "tllhoverlight"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.15,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.05,
  buildCostEnergy    = 1099,
  buildCostMetal     = 70,
  builder            = false,
  buildTime          = 2401,
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
  description        = [[Scout Hovercraft]],
  designation        = [[TLL-HLL]],
  downloadable       = 1,
  energyMake         = 2.2,
  energyStorage      = 0,
  energyUse          = 2.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft Reconnaissance]],
  germandescription  = [[Aufklärungs-Hovercraft]],
  italiandescription = [[Hovercraft di ricognizione]],
  maneuverleashlength = 640,
  maxDamage          = 210,
  maxSlope           = 16,
  maxVelocity        = 3.8,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Fox]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLHOVERLIGHT]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 280,
  spanishdescription = [[Hidroavión de Exploración]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 425,
  unitname           = [[tllhoverlight]],
  unitnumber         = 28303,
  version            = 1.2,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[hovsmof2]],
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
      [[hovsmok2]],
    },
    select = {
      [[tllhoverok]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMSH_WEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMSH_WEAPON = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.1,
    burstrate          = 0.2,
    color              = 232,
    color2             = 234,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.02,
    energypershot      = 3,
    explosionGenerator = [[custom:FLASH1nd]],
    fireStarter        = 50,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 230,
    reloadtime         = 0.6,
    renderType         = 0,
    soundHit           = [[lashit]],
    soundStart         = [[lasrfast]],
    soundTrigger       = true,
    targetMoveError    = 0.3,
    thickness          = 1.25,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 450,
    damage = {
      default            = 48,
      gunships           = 6,
      hgunships          = 6,
      l1subs             = 2,
      l2subs             = 2,
      l3subs             = 2,
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
    object             = [[tllhoverlight_dead]],
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
