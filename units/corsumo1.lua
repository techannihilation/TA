-- UNITDEF -- CORSUMO1 --
--------------------------------------------------------------------------------

local unitName = "corsumo1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.048,
  badTargetCategory  = [[ANTILASER]],
  bmcode             = 1,
  brakeRate          = 0.125,
  buildCostEnergy    = 33562,
  buildCostMetal     = 2420,
  builder            = false,
  buildPic           = [[CORSUMO.DDS]],
  buildTime          = 50975,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE KBOT MOBILE WEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 ALL]],
  corpse             = [[CORSUMO_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Very Heavily Armored Assault Kbot]],
  energyMake         = 2.8,
  energyStorage      = 100,
  energyUse          = 2.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 20000,
  maxSlope           = 15,
  maxVelocity        = 0.95,
  maxWaterDepth      = 23,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HKBOT4]],
  name               = [[Heavy Sumo]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORSUMO1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 510,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  turnRate           = 320,
  unitname           = [[corsumo1]],
  upright            = false,
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTILASER]],
      def                = [[CORSUMO_WEAPON1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORSUMO_WEAPON1 = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 145,
    explosionGenerator = [[custom:GreenLaser]],
    fireStarter        = 90,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 850,
    reloadtime         = 0.45,
    renderType         = 0,
    rgbColor           = [[0 1 0]],
    soundHit           = [[lasrhit1]],
    soundStart         = [[lasrhvy3]],
    targetMoveError    = 0.25,
    thickness          = 3,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 800,
    damage = {
      commanders         = 90,
      default            = 245,
      gunships           = 65,
      hgunships          = 65,
      l1bombers          = 65,
      l1fighters         = 65,
      l1subs             = 5,
      l2bombers          = 65,
      l2fighters         = 65,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 65,
      vtol               = 65,
      vtrans             = 65,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORSUMO_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Sumo Wreckage]],
    energy             = 0,
    featureDead        = [[CORSUMO_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORSUMO_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORSUMO_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Sumo Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
