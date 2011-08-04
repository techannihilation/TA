-- UNITDEF -- ARMFLEA1 --
--------------------------------------------------------------------------------

local unitName = "armflea1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  badTargetCategory  = [[ANTIGATOR]],
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 322,
  buildCostMetal     = 14,
  builder            = false,
  buildPic           = [[ARMFLEA.DDS]],
  buildTime          = 789,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[ARMFLEA_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Scout Kbot]],
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[FLEA_EX]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  mass               = 1000,
  maxDamage          = 50,
  maxSlope           = 255,
  maxVelocity        = 4.4,
  maxWaterDepth      = 16,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT1]],
  name               = [[Pulcina]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMFLEA1]],
  seismicSignature   = 0,
  selfDestructAs     = [[FLEA_EX]],
  side               = [[ARM]],
  sightDistance      = 550,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  turnRate           = 1672,
  unitname           = [[armflea1]],
  unitRestricted     = 150,
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
      [[servtny2]],
    },
    select = {
      [[servtny2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTIGATOR]],
      def                = [[FLEA_LASER]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FLEA_LASER = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.1,
    burstrate          = 0.2,
    coreThickness      = 0.1,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 2,
    explosionGenerator = [[custom:SMALL_YELLOW_BURN]],
    fireStarter        = 50,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 2,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 140,
    reloadtime         = 0.6,
    renderType         = 0,
    rgbColor           = [[1 1 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrfir1]],
    soundTrigger       = true,
    targetMoveError    = 0.1,
    thickness          = 0.75,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 600,
    damage = {
      default            = 24,
      gunships           = 2,
      hgunships          = 2,
      l1bombers          = 2,
      l1fighters         = 2,
      l1subs             = 1,
      l2bombers          = 2,
      l2fighters         = 2,
      l2subs             = 1,
      l3subs             = 1,
      vradar             = 2,
      vtol               = 2,
      vtrans             = 2,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMFLEA_DEAD = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Flea Wreckage]],
    energy             = 0,
    featureDead        = [[ARMFLEA_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMFLEA_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMFLEA_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Flea Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 1,
    footprintZ         = 1,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[1X1A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
