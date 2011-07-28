-- UNITDEF -- CORMONSTA --
--------------------------------------------------------------------------------

local unitName = "cormonsta"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.652587891,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.352587891,
  buildCostEnergy    = 27415,
  buildCostMetal     = 2574,
  builder            = false,
  buildTime          = 80561,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Defiler Assault]],
  designation        = [[ATAS]],
  energyMake         = 0.7,
  energyStorage      = 0,
  energyUse          = 0.7,
  explodeAs          = [[MINE_MEDIUM]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Araigné d'assaut évolué]],
  frenchname         = [[Defiler]],
  germandescription  = [[Araigné d'assaut évolué]],
  germanname         = [[Defiler]],
  healtime           = 27,
  maneuverleashlength = 640,
  maxDamage          = 18158,
  maxSlope           = 40,
  maxVelocity        = 0.85,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTKBOT4]],
  name               = [[Defiler]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORMONSTA]],
  onoffable          = true,
  selfDestructAs     = [[MINE_MEDIUM]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 550,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 340,
  unitname           = [[cormonsta]],
  unitnumber         = 852741,
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
      [[krogok1]],
    },
    select = {
      [[krogsel1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[CORMONSTA_GUN]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[SAM2_MISSILE]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORMONSTA_GUN = {
    areaOfEffect       = 75,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    explosionGenerator = [[custom:PLASMARED21]],
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -15,
    model              = [[dragothflame]],
    name               = [[Tanker Canon]],
    range              = 480,
    reloadtime         = 0.37,
    renderType         = 1,
    soundHit           = [[xplomed21]],
    soundStart         = [[DEFILER2]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 950,
    damage = {
      default            = 105,
    },
  },
  SAM2_MISSILE = {
    areaOfEffect       = 50,
    ballistic          = true,
    burnblow           = true,
    edgeEffectiveness  = 0.90,
    explosionGenerator = [[custom:GDLIGHTROCKET]],
    fireStarter        = 70,
    gravityaffected    = [[true]],
    guidance           = true,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    minbarrelangle     = -24,
    model              = [[missile10]],
    name               = [[Sam Missile]],
    range              = 680,
    reloadtime         = 2.6,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplomed21]],
    soundStart         = [[Rocklit3]],
    startsmoke         = 0,
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 24384,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponTimer        = 7,
    weaponType         = [[Cannon]],
    weaponVelocity     = 950,
    damage = {
      default            = 880,
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
    description        = [[Defiler Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 9,
    footprintZ         = 9,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[cormonsta_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Defiler Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
