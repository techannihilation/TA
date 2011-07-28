-- UNITDEF -- ARMCD --
--------------------------------------------------------------------------------

local unitName = "armcd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 8928,
  buildCostMetal     = 1992,
  builder            = false,
  buildTime          = 9102,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  collisionVolumeScales = [[30.908721923828 18.908721923828 48.908721923828]],
  collisionVolumeOffsets = [[0 -1 0]],
  collisionVolumeTest = 1,
  collisionVolumeType = [[CylZ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Laser Tank]],
  designation        = [[ARM-CD]],
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Char à laser lourd]],
  frenchname         = [[Coodos]],
  germandescription  = [[Schwerer Laserpanzer]],
  germanname         = [[Coodos]],
  maneuverleashlength = 490,
  maxDamage          = 2350,
  maxSlope           = 13,
  maxVelocity        = .75,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Coodos]],
  noAutoFire         = false,
  objectName         = [[ARMCD]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 290,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 409,
  unitname           = [[armcd]],
  unitnumber         = 2109,
  upright            = true,
  version            = 3.0,
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
      badTargetCategory  = [[NOTAIR]],
      def                = [[hvy_laser_weapon]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  hvy_laser_weapon = {
    areaOfEffect       = 38,
    beamWeapon         = true,
    color              = 502,
    color2             = 120,
    explosionart       = [[explode4]],
    explosiongaf       = [[fx]],
    id                 = 99,
    lavaexplosionart   = [[explode4]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Heavy Laser]],
    range              = 450,
    reloadtime         = 0.5,
    renderType         = 0,
    soundHit           = [[lashit]],
    soundStart         = [[lasrlit1]],
    turret             = true,
    waterexplosionart  = [[explode4]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 800,
    damage = {
      commanders         = 700,
      default            = 2542,
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
    description        = [[Coodos Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 22,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armcd_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Coodos Heap]],
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
