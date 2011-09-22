-- UNITDEF -- TLLTELSATNK --
--------------------------------------------------------------------------------

local unitName = "tlltelsatnk"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 1600,
  buildCostMetal     = 90,
  builder            = false,
  buildTime          = 2500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE TANK LEVEL1 WEAPON NOTAIR  NOTSUB ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Telsa Assault Tank]],
  designation        = [[none]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 580,
  maxSlope           = 12,
  maxVelocity        = 1.2,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Telsa Tank]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLTELSATNK]],
  radarDistance      = 0,
  scale              = 1.2,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[BIO]],
  sightDistance      = 230,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 475,
  unitname           = [[tlltelsatnk]],
  unitnumber         = 30006,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLLTELSA_CANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLTELSA_CANNON = {
    areaOfEffect       = 30,
    beamWeapon         = true,
    color              = 128,
    color2             = 130,
    duration           = 5,
    energypershot      = 35,
    explosionart       = [[conifboom]],
    explosiongaf       = [[trees]],
    fireStarter        = 50,
    id                 = 119,
    lavaexplosionart   = [[conifboom]],
    lavaexplosiongaf   = [[trees]],
    lineOfSight        = true,
    metalpershot       = 1,
    name               = [[Telsa Energy Weapon]],
    range              = 350,
    reloadtime         = 2.0,
    renderType         = 7,
    soundHit           = [[Anti-Matter_Hit]],
    soundStart         = [[Anti-Matter_Fire]],
    soundTrigger       = true,
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[conifboom]],
    waterexplosiongaf  = [[trees]],
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 350,
    damage = {
      armcom             = 95,
      armflash           = 300,
      biocom             = 10,
      corcom             = 95,
      default            = 150,
      nea_com            = 90,
      tav_hwall          = 500,
      tav_vwall          = 500,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 12,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 1,
    hitdensity         = 23,
    metal              = 123,
    object             = [[tlltelsatnk_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 10,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 100,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
