-- UNITDEF -- VAPORISER --
--------------------------------------------------------------------------------

local unitName = "vaporiser"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.01379,
  buildCostEnergy    = 8435,
  buildCostMetal     = 850,
  builder            = false,
  buildTime          = 24999,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  collisionVolumeScales = [[30.423076629639 13.423076629639 41.423076629639]],
  collisionVolumeOffsets = [[-1 0 -1]],
  collisionVolumeTest = 0,
  collisionVolumeType = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[High Energy Laser Tank]],
  designation        = [[vaporiser]],
  energyMake         = 1.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maneuverleashlength = 640,
  maxDamage          = 2400,
  maxSlope           = 36,
  maxVelocity        = 3,
  maxWaterDepth      = 80,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK3]],
  name               = [[Vaporiser]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[vaporiser]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 240,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 399,
  unitname           = [[vaporiser]],
  unitnumber         = 543,
  version            = 2,
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
      def                = [[MountedAntimatterAccelerator1]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[MountedAntimatterAccelerator1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  MountedAntimatterAccelerator1 = {
    areaOfEffect       = 60,
    beamlaser          = 1,
    beamTime           = 1.5,
    burnblow           = true,
    coreThickness      = 0.8,
    craterBoost        = 0,
    craterMult         = 0,
    endsmoke           = 1,
    energypershot      = 0,
    explosionGenerator = [[custom:laser_residuals_sred]],
    fireStarter        = 20,
    id                 = 168,
    impulseBoost       = 0.127,
    impulseFactor      = 12,
    largeBeamLaser     = true,
    laserFlareSize     = 5,
    lineOfSight        = true,
    name               = [[Mounted antimatter accelerator]],
    noExplode          = false,
    pitchtolerance     = 100,
    range              = 500,
    reloadtime         = 4,
    renderType         = 4,
    rgbColor           = [[1 0 0]],
    soundHit           = [[thunder_clap]],
    soundStart         = [[arrfire]],
    soundTrigger       = true,
    startsmoke         = 1,
    targetMoveError    = 0.2,
    texture1           = [[Type4Beam]],
    texture2           = [[NULL]],
    texture3           = [[NULL]],
    texture4           = [[EMG]],
    thickness          = 3.5,
    tolerance          = 100,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1500,
    damage = {
      commanders         = 300,
      default            = 1800,
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
    description        = [[Vaporiser Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 50,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[vaporiser_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Vaporiser Heap]],
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
