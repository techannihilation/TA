-- UNITDEF -- ARMHLT1 --
--------------------------------------------------------------------------------

local unitName = "armhlt1"

--------------------------------------------------------------------------------

-- should be about 1.8 times stronger than normal one
-- 1.5 times bigger hp, + 80 range, 2 times bigger dps, 1.2 times faster ROF
-- morph cost should be reduced by 30% (in morph config)

local unitDef = {
  acceleration       = 0,
  badTargetCategory  = [[ANTILASER]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 8900,
  buildCostMetal     = 745,
  builder            = false,
  buildPic           = [[ARMHLT.DDS]],
  buildTime          = 17000,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[ARMHLT_DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Heavy Laser Tower]],
  energyStorage      = 1000,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 3500,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[High-Energy Sentinel]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[ARMHLT]],
  seismicSignature   = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 494,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[armhlt1]],
  workerTime         = 0,
  yardMap            = [[oooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak1]],
    uncloak            = [[kloak1un]],
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
      [[twractv3]],
    },
    select = {
      [[twractv3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTILASER]],
      def                = [[ARM_LASERH2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LASERH2 = {
    areaOfEffect       = 20,
    beamlaser          = 1,
    beamTime           = 0.7,
    coreThickness      = 0.45,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 150,
    explosionGenerator = [[custom:GreenLaser]],
    fireStarter        = 90,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 20,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 700,
    reloadtime         = 1.5,
    renderType         = 0,
    rgbColor           = [[0 1 0]],
    soundHit           = [[lasrhit1]],
    soundStart         = [[Lasrmas2]],
    targetMoveError    = 0.2,
    thickness          = 3,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 2850,
    damage = {
      commanders         = 1200,
      default            = 920,
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
  ARMHLT_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Sentinel Wreckage]],
    energy             = 0,
    featureDead        = [[ARMHLT_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMHLT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMHLT_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Sentinel Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
