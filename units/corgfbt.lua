-- UNITDEF -- CORGFBT --
--------------------------------------------------------------------------------

local unitName = "corgfbt"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.025,
  activateWhenBuilt  = true,
  ai_limit           = [[limit corGFBT 12]],
  ai_weight          = [[weight corGFBT 1.6]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.02,
  buildCostEnergy    = 9982,
  buildCostMetal     = 651,
  builder            = false,
  buildTime          = 9523,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Magnesium FireBall Tank (anti spam)]],
  designation        = [[sWsGFBT]],
  downloadable       = 1,
  energyMake         = 0.7,
  energyStorage      = 100,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maneuverleashlength = 640,
  mass               = 5000,
  maxDamage          = 4528,
  maxSlope           = 14,
  maxVelocity        = 1.22,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Grimani]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[corGFBT]],
  ovradjust          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 300,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[corgfbt]],
  unitnumber         = 397,
  version            = 2.5,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[FIREBALL]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FIREBALL = {
    areaOfEffect       = 168,
    beamWeapon         = true,
    color              = 3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 210,
    explosionart       = [[LavaSplash]],
    explosiongaf       = [[FX]],
    fireStarter        = 100,
    id                 = 41,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[LavaSplash]],
    lavaexplosiongaf   = [[FX]],
    lineOfSight        = true,
    name               = [[Grimani's Magnesium Fireball]],
    range              = 300,
    reloadtime         = 2.1,
    renderType         = 4,
    smokeTrail         = true,
    soundHit           = [[Burn02]],
    soundStart         = [[Mavgun1]],
    soundTrigger       = true,
    soundwater         = [[SplsSml]],
    sprayAngle         = 1024,
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[H2O]],
    waterexplosiongaf  = [[FX]],
    weaponTimer        = 4,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 360,
    damage = {
      default            = 600,
      fireball           = 100,
      janus1             = 900,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Fireball Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[corGFBT_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Fireball Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
