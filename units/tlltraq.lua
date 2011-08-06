-- UNITDEF -- TLLTRAQ --
--------------------------------------------------------------------------------

local unitName = "tlltraq"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.21,
  buildCostEnergy    = 11234,
  buildCostMetal     = 764,
  builder            = false,
  buildTime          = 23659,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE ALL NOTSUB NOWEAPON NOTAIR]],
  cloakCost          = 50,
  cloakCostMoving    = 250,
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Inflitration Kbot]],
  designation        = [[TLL-TK]],
  downloadable       = 1,
  energyMake         = 51,
  energyStorage      = 500,
  energyUse          = 5,
  explodeAs          = [[SMALL_UNIT]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  healtime           = 10,
  initCloaked        = true,
  maneuverleashlength = 640,
  maxDamage          = 1798,
  maxSlope           = 19,
  maxVelocity        = 1.5,
  maxWaterDepth      = 14,
  metalStorage       = 0,
  minCloakDistance   = 65,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Tracker]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLTRAQ]],
  onoffable          = true,
  radarDistance      = 450,
  selfDestructAs     = [[BIG_UNITEX]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 250,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1005,
  unitname           = [[tlltraq]],
  unitnumber         = 345665,
  upright            = true,
  version            = 3,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLTRAQ_WEAPON]],
      onlyTargetCategory = [[NOTAIR]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLTRAQ_WEAPON = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.12,
    coreThickness      = 0.175,
    color              = 96,
    color2             = 98,
    energypershot      = 120,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 90,
    id                 = 234,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[High Energy Laser]],
    range              = 380,
    reloadtime         = 0.8,
    renderType         = 0,
    soundHit           = [[firehit]],
    soundStart         = [[lasrhvy3]],
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1100,
    damage = {
      default            = 330,
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
    description        = [[Tracker Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlltraq_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Tracker Debris]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
