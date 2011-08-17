-- UNITDEF -- NSACSKV --
--------------------------------------------------------------------------------

local unitName = "nsacskv"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.04,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.006,
  buildCostEnergy    = 9452,
  buildCostMetal     = 474,
  builder            = false,
  buildTime          = 19000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Skirmish Tank]],
  designation        = [[NSA-CSKV]],
  downloadable       = 1,
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Skirmish Tank]],
  frenchname         = [[Absolutor]],
  germaname          = [[Absolutor]],
  germandescription  = [[Skirmish Tank]],
  italiandescription = [[Skirmish Tank]],
  italianname        = [[Absolutor]],
  maneuverleashlength = 640,
  maxDamage          = 2857,
  maxSlope           = 10,
  maxVelocity        = 1.7,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestanorders   = 1,
  movementClass      = [[TANK3]],
  name               = [[Absolutor]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[NSACSKV]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 219,
  spanishdescription = [[Skirmish Tank]],
  spanishname        = [[Absolutor]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 511,
  unitname           = [[nsacskv]],
  unitnumber         = 1414,
  version            = 1.0,
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
      [[mavbok1]],
    },
    select = {
      [[mavbsel1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORKROG_FIRE10]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORKROG_FIRE10 = {
    areaOfEffect       = 12,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    explosionGenerator = [[custom:KNIGHT_EXPLOSION_FX]],
    id                 = 150,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -15,
    name               = [[Gauss Cannon]],
    range              = 700,
    reloadtime         = 1.0,
    renderType         = 4,
    soundHit           = [[xplomed21]],
    soundStart         = [[Krogun1]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 450,
    damage = {
      default            = 320,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Absolutor Wreckage]],
    featureDead        = [[heap]],
    featurereclaimate  = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 60,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[nsacskv_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Absolutor Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
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
