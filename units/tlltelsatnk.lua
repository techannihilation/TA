-- UNITDEF -- TLLTELSATNK --
--------------------------------------------------------------------------------

local unitName = "tlltelsatnk"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 9000,
  buildCostMetal     = 3400,
  builder            = false,
  buildTime          = 25000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TINY MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
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
  maxDamage          = 5000,
  maxSlope           = 12,
  maxVelocity        = 1.36,
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
  sightDistance      = 430,
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
      onlyTargetCategory = [[NOTVTOL]],
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
    intensity          = 12,
    metalpershot       = 1,
    name               = [[Telsa Energy Weapon]],
    range              = 825,
    reloadtime         = 2.5,
    renderType         = 7,
    rgbColor           = [[0.2 0.2 1]],
    soundHit           = [[lashit2]],
    soundStart         = [[Lghthvy1]],
    texture1           = [[lightning]],
    soundTrigger       = true,
    startsmoke         = 1,
    turret             = true,
    thickness          = 9,
    waterexplosionart  = [[conifboom]],
    waterexplosiongaf  = [[trees]],
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 350,
    damage = {
      commanders = 350,
      default = 1600,
      subs = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Telsa Tank Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 1,
    hitdensity         = 23,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[tlltelsatnk_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 0.3600 * unitDef.maxDamage,
    description        = [[Telsa Tank Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 0.6400 * unitDef.buildCostMetal,
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
