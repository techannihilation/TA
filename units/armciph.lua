-- UNITDEF -- ARMCIPH --
--------------------------------------------------------------------------------

local unitName = "armciph"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.013,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.098,
  buildCostEnergy    = 8523,
  buildCostMetal     = 1197,
  builder            = false,
  buildTime          = 12920,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Resistant Skirmish Tank]],
  designation        = [[ARM-CPH]],
  energyMake         = 1,
  energyStorage      = 0,
  energyUse          = 1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Char d'escarmouche moyen]],
  frenchname         = [[Cipher]],
  germandescription  = [[Mittelschwerer Gefechtspanzer]],
  germanname         = [[Cipher]],
  maneuverleashlength = 640,
  maxDamage          = 11950,
  maxSlope           = 11,
  maxVelocity        = 1.703,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK4]],
  name               = [[Cipher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMCIPH]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 235,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 325,
  unitname           = [[armciph]],
  unitnumber         = 754,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[PINKCANNON]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PINKCANNON = {
    areaOfEffect       = 122,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode4]],
    explosiongaf       = [[fx]],
    explosionGenerator = [[custom:PINKBOLT]],
    gravityaffected    = [[true]],
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 1,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    name               = [[Lighghht Cannon]],
    range              = 600,
    reloadtime         = 0.5,
    renderType         = 4,
    rgbColor           = [[1 0 0]],
    rgbColor2          = [[1 1 1]],
    size               = 3,
    soundHit           = [[xplosml3]],
    soundStart         = [[canlite3]],
    sprayAngle         = 300,
    startsmoke         = 1,
    thickness          = 2,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 370,
    damage = {
      default            = 225,
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
    description        = [[Cipher Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 14,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armciph_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Cipher Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 5,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
