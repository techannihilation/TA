-- UNITDEF -- ARMJANUS1 --
--------------------------------------------------------------------------------

local unitName = "armjanus1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0198,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.055,
  buildCostEnergy    = 3261,
  buildCostMetal     = 466,
  builder            = false,
  buildPic           = [[ARMJANUS.DDS]],
  buildTime          = 3545,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM TANK WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[ARMJANUS_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Twin Heavy Rocket Launcher (Boost)]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 1100,
  maxSlope           = 10,
  maxVelocity        = 1.9,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Ruinous Janus]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMJANUS1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 325,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 3,
  trackStrength      = 6,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 24,
  turnRate           = 338.8,
  unitname           = [[armjanus1]],
  workerTime         = 0,
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
      def                = [[JANUS_ROCKET1]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[JANUS_ROCKET1]],
      onlyTargetCategory = [[NOTAIR]],
      slaveTo            = 1,
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  JANUS_ROCKET1 = {
    areaOfEffect       = 190,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:VEHROCKET_EXPLOSION]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.85,
    impulseFactor      = 0.75,
    lineOfSight        = true,
    model              = [[megamisl]],
    name               = [[HeavyRocket]],
    noSelfDamage       = false,
    range              = 440,
    reloadtime         = 12,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundHitVolume     = 8,
    soundStart         = [[rocklit1]],
    soundStartVolume   = 7,
    startsmoke         = 1,
    startVelocity      = 195,
    texture2           = [[armsmoketrail]],
    tracks             = true,
    trajectoryHeight   = 0.5,
    turnRate           = 22000,
    turret             = true,
    weaponAcceleration = 125,
    weaponTimer        = 3,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 225,
    damage = {
	  commanders         = 150,
      default            = 470,
      gunships           = 35,
      hgunships          = 35,
      l1bombers          = 35,
      l1fighters         = 35,
      l1subs             = 5,
      l2bombers          = 35,
      l2fighters         = 35,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 35,
      vtol               = 35,
      vtrans             = 35,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMJANUS_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Ruinous Janus Wreckage]],
    energy             = 0,
    featureDead        = [[ARMJANUS_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMJANUS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMJANUS_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Janus Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
