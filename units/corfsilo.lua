-- UNITDEF -- CORFSILO --
--------------------------------------------------------------------------------

local unitName = "corfsilo"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 989624,
  buildCostMetal     = 152460,
  builder            = false,
  buildTime          = 542439,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE SPECIAL WEAPON LEVEL3 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Ultimate Nuclear Missile Launcher]],
  designation        = [[CORFSILO]],
  downloadable       = 1,
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[NUCLEAR_DISASTER]],
  firestandorders    = 1,
  footprintX         = 16,
  footprintZ         = 16,
  frenchdescription  = [[Lance-missiles nucléaires ultime]],
  frenchname         = [[Remover]],
  germandescription  = [[Ultimativer Nuklearraketenwerfer]],
  germanname         = [[Remover]],
  maxDamage          = 15100,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Remover]],
  noAutoFire         = false,
  objectName         = [[CORFSILO]],
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_DISASTER]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 350,
  standingfireorder  = 0,
  threed             = 1,
  unitname           = [[corfsilo]],
  unitnumber         = 3364,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo oooooooo]],
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
      [[servroc1]],
    },
    select = {
      [[servroc1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORFSILO_WEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORFSILO_WEAPON = {
    areaOfEffect       = 3020,
    commandfire        = true,
    cruise             = 1,
    edgeEffectiveness  = 0.5,
    energypershot      = 3000000,
    explosionart       = [[commboom]],
    explosiongaf       = [[commboom]],
    fireStarter        = 100,
    flightTime         = 450,
    guidance           = true,
    id                 = 233,
    lavaexplosionart   = [[commboom]],
    lavaexplosiongaf   = [[commboom]],
    lineOfSight        = true,
    metalpershot       = 18000,
    model              = [[corfnuke]],
    name               = [[Ultimate Nuclear Missile]],
    noautorange        = 1,
    propeller          = 1,
    range              = 80000,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    shakeduration      = 2.5,
    shakemagnitude     = 48,
    smokedelay         = 0.02,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[misicbm1]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 180,
    targetable         = 2,
    tolerance          = 4000,
    turnRate           = 2000,
    twoPhase           = true,
    vlaunch            = true,
    waterexplosionart  = [[commboom]],
    waterexplosiongaf  = [[commboom]],
    weaponAcceleration = 21,
    weaponTimer        = 30,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 150,
    damage = {
      default            = 30000,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Remover Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 16,
    footprintZ         = 16,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[corfsilo_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Remover Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
