-- UNITDEF -- ARMLLT1 --
--------------------------------------------------------------------------------

local unitName = "armllt1"

--------------------------------------------------------------------------------
-- should be about 2 times stronger than normal one
-- 1.7 times bigger hp, + 80 range, 2.1 times bigger dps, 1.2 times faster ROF
-- morph cost should be reduced by 30% (in morph config)

local unitDef = {
  acceleration       = 0,
  badTargetCategory  = [[ANTILASER]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 32768,
  buildCostEnergy    = 1300,
  buildCostMetal     = 170,
  builder            = false,
  buildPic           = [[armllt1.pcx]],
  buildTime          = 5300,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[ARMLLT_DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Boosted Light Laser Tower]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 952,
  maxSlope           = 14,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Boosted LLT]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[ARMLLT1]],
  seismicSignature   = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 594,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[armllt1]],
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
      def                = [[ARM_LIGHTLASER1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LIGHTLASER1 = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.12,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 40,
    explosionGenerator = [[custom:FLASH1red]],
    fireStarter        = 30,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[LightLaser]],
    noSelfDamage       = true,
    range              = 510,
    reloadtime         = 0.4,
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
      commanders         = 240,
      default            = 130,
      gunships           = 3,
      hgunships          = 3,
      l1bombers          = 5,
      l1fighters         = 5,
      l1subs             = 3,
      l2bombers          = 5,
      l2fighters         = 5,
      l2subs             = 3,
      l3subs             = 3,
      vradar             = 5,
      vtol               = 5,
      vtrans             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMLLT_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[LLT Wreckage]],
    energy             = 0,
    featureDead        = [[ARMLLT_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMLLT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMLLT_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[LLT Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
