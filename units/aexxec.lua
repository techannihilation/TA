-- UNITDEF -- AEXXEC --
--------------------------------------------------------------------------------

local unitName = "aexxec"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.4,
  ai_limit           = [[limit aexxec 5]],
  ai_weight          = [[weight aexxec 2.5]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 5311,
  buildCostMetal     = 675,
  builder            = false,
  buildTime          = 8500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy assault K-bot]],
  designation        = [[ARM-KI2]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[K-bot d'assaut lourd]],
  frenchname         = [[Exxec]],
  maneuverleashlength = 640,
  mass               = 5000,
  maxDamage          = 3700,
  maxSlope           = 17,
  maxVelocity        = 1.15,
  maxWaterDepth      = 25,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[ADT]],
  name               = [[Exxec]],
  noAutoFire         = false,
  objectName         = [[AEXXEC]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 700,
  unitname           = [[aexxec]],
  unitnumber         = 901,
  version            = 1.2,
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
      def                = [[ARM_EXXEC]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_EXXEC = {
    areaOfEffect       = 8,
    beamWeapon         = true,
    color              = 144,
    color2             = 217,
    energypershot      = 0,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 30,
    id                 = 253,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Annihilator Weapon]],
    range              = 295,
    reloadtime         = 0.50,
    renderType         = 0,
    soundHit           = [[xplolrg1]],
    soundStart         = [[annigun1]],
    soundTrigger       = true,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 800,
    damage = {
      commanders         = 110,
      default            = 355,
      janus1             = 300,
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
    description        = [[Exxec Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[aexxec_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Exxec Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
