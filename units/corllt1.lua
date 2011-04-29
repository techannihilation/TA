-- UNITDEF -- CORLLT1 --
--------------------------------------------------------------------------------

local unitName = "corllt1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  badTargetCategory  = [[ANTILASER]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 32768,
  buildCostEnergy    = 952,
  buildCostMetal     = 134,
  builder            = false,
  buildPic           = [[CORLLT.DDS]],
  buildTime          = 12724,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE WEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[CORLLT_DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[upgraded Light Laser Tower]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 2,
  footprintZ         = 2,
  healtime           = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 985,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[upg LLT]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[CORLLT]],
  seismicSignature   = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 594,
  smoothAnim         = true,
  standingfireorder  = 2,
  TEDClass           = [[FORT]],
  turnRate           = 0,
  unitname           = [[corllt1]],
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
      [[servmed2]],
    },
    select = {
      [[servmed2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTILASER]],
      def                = [[CORE_LIGHTLASER1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_LIGHTLASER1 = {
    areaOfEffect       = 12,
    avoidFeature       = false,
    beamlaser          = 1,
    beamTime           = 0.12,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 20,
    explosionGenerator = [[custom:FLASH1red]],
    fireStarter        = 100,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[LightLaser]],
    noSelfDamage       = true,
    range              = 535,
    reloadtime         = 0.28,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrfir3]],
    soundTrigger       = true,
    targetMoveError    = 0.1,
    thickness          = 2.5,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 2250,
    damage = {
      commanders         = 140,
      default            = 105,
      gunships           = 3,
      hgunships          = 3,
      l1bombers          = 5,
      l1fighters         = 5,
      l1subs             = 2,
      l2bombers          = 5,
      l2fighters         = 5,
      l2subs             = 2,
      l3subs             = 2,
      vradar             = 5,
      vtol               = 5,
      vtrans             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORLLT_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 351,
    description        = [[LLT Wreckage]],
    energy             = 0,
    featureDead        = [[CORLLT_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = 86,
    object             = [[CORLLT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORLLT_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 176,
    description        = [[LLT Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 34,
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
