-- UNITDEF -- ARMSAM1 --
--------------------------------------------------------------------------------

local unitName = "armsam1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0396,
  badTargetCategory  = [[ALL]],
  bmcode             = 1,
  brakeRate          = 0.0165,
  buildCostEnergy    = 2027,
  buildCostMetal     = 260,
  builder            = false,
  buildPic           = [[ARMSAM.DDS]],
  buildTime          = 2945,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[ARMSAM_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[upgraded Missile Truck]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 1365,
  maxSlope           = 16,
  maxVelocity        = 1.605,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[upg Samson]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSAM1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 620,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  trackOffset        = -6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 32,
  turnRate           = 497,
  unitname           = [[armsam1]],
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      [[custom:rocketflare]],
    },
  },
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
      [[varmmove]],
    },
    select = {
      [[varmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[ARMTRUCK_MISSILE1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMTRUCK_MISSILE1 = {
    areaOfEffect       = 48,
    burst              = 3,
    burstrate          = 0.25,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Missiles]],
    noSelfDamage       = true,
    range              = 740,
    reloadtime         = 3.94,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed2]],
    soundStart         = [[rockhvy2]],
    soundTrigger       = true,
    startsmoke         = 1,
    startVelocity      = 450,
    texture2           = [[armsmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    trajectoryHeight   = 0.75,
    turnRate           = 63000,
    turret             = true,
    weaponAcceleration = 108,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 540,
    damage = {
      commanders         = 50,
      default            = 33,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMSAM_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 639,
    description        = [[Samson Wreckage]],
    energy             = 0,
    featureDead        = [[ARMSAM_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 167,
    object             = [[ARMSAM_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMSAM_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 320,
    description        = [[Samson Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 65,
    object             = [[3X3D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
