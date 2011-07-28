-- UNITDEF -- CORGATOR1 --
--------------------------------------------------------------------------------

local unitName = "corgator1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.085,
  badTargetCategory  = [[ANTIGATOR]],
  bmcode             = 1,
  brakeRate          = 0.095,
  buildCostEnergy    = 1442,
  buildCostMetal     = 218,
  builder            = false,
  buildPic           = [[CORGATOR.DDS]],
  buildTime          = 1761,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE TANK MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[CORGATOR_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Light Tank]],
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
  maxDamage          = 920, --1,25*norm
  maxSlope           = 10,
  maxVelocity        = 3.5,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Insistent Instigator]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORGATOR1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 5,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 21,
  turnRate           = 640,
  unitname           = [[corgator1]],
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTIGATOR]],
      def                = [[GATOR_LASERX1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GATOR_LASERX1 = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 5,
    explosionGenerator = [[custom:FLASH1red]],
    fireStarter        = 50,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 6,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 270,
    reloadtime         = 0.62,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrlit3]],
    soundTrigger       = true,
    targetMoveError    = 0.05,
    thickness          = 2.7,
    tolerance          = 15000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1500,
    damage = {
      default            = 82,
      gunships           = 9,
      hgunships          = 9,
      l1bombers          = 9,
      l1fighters         = 9,
      l1subs             = 5,
      l2bombers          = 9,
      l2fighters         = 9,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 9,
      vtol               = 9,
      vtrans             = 12,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORGATOR_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Insistent Instigator Wreckage]],
    energy             = 0,
    featureDead        = [[CORGATOR_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORGATOR_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORGATOR_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Instigator Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2F]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
