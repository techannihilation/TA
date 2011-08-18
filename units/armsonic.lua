-- UNITDEF -- ARMSONIC --
--------------------------------------------------------------------------------

local unitName = "armsonic"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.81,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.19,
  buildCostEnergy    = 3991,
  buildCostMetal     = 420,
  builder            = false,
  buildTime          = 8129,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Sonic Riot Tank]],
  designation        = [[UGS-SR2/T]],
  downloadable       = 1,
  energyMake         = 0.0,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[SMALL_UNIT]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Tank émeute]],
  frenchname         = [[RaTastrophe]],
  germandescription  = [[Vernichtungspanzer]],
  germanname         = [[RaTastrophe]],
  italiandescription = [[Carro armato d'assalto]],
  italianname        = [[RaTastrophe]],
  maneuverleashlength = 640,
  mass               = 5000,
  maxDamage          = 620,
  maxSlope           = 34,
  maxVelocity        = 1.64,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[RaTastrophe]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSONIC]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 415,
  spanishdescription = [[Tanque Antidisturbios]],
  spanishname        = [[RaTastrophe]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 220,
  unitname           = [[armsonic]],
  unitnumber         = 6303,
  version            = 1,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[SONIC_CANNON]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SONIC_CANNON = {
    areaOfEffect       = 210,
    burnblow           = true,
    rgbColor           = [[1 5 5]],
    coreThickness      = .5,
    edgeEffectiveness  = 1,
    energypershot      = 0,
    explosionart       = 1,
    explosiongaf       = [[pdgexp1]],
    explosionGenerator = [[custom:diesmallwhite]],
    fireStarter        = 0,
    id                 = 181,
    impulseFactor      = 0,
    intensity          = 1.5,
    lavaexplosionart   = [[flamestream]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -25,
    name               = [[Sonic Wave Projector]],
    range              = 480,
    reloadtime         = 1.9,
    renderType         = 3,
    size               = 10,
    soundHit           = [[debris4]],
    soundStart         = [[sonicwv1]],
    tolerance          = 2000,
    turret             = true,
    waterexplosionart  = [[parablast]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 600,
    damage = {
      default            = 202,
      janus1             = 644,
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
    description        = [[Sonic Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 100,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armsonic_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Sonic Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
