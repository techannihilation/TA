-- UNITDEF -- TLLHLT --
--------------------------------------------------------------------------------

local unitName = "tllhlt"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 0,
  buildAngle         = 32768,
  buildCostEnergy    = 2724,
  buildCostMetal     = 622,
  builder            = false,
  buildTime          = 9911,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL WEAPON LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Heavy Laser Tower]],
  designation        = [[]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Tourelle laser lourde]],
  germandescription  = [[Schwerer Laserturm]],
  italiandescription = [[Torretta laser pesante]],
  maxDamage          = 3080,
  maxSlope           = 14,
  maxWaterDepth      = 0,
  name               = [[H.L.T.]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[TLLHLT]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 380,
  spanishdescription = [[Torre láser pesada]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllhlt]],
  unitnumber         = 810,
  version            = 1,
  yardMap            = [[oooo]],
  zbuffer            = 1,
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
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_LASERH1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LASERH1 = {
    areaOfEffect       = 14,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 75,
    explosionGenerator = [[custom:LARGE_GREEN_LASER_BURN]],
    fireStarter        = 90,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 630,
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
    weaponVelocity     = 2250,
    damage = {
      commanders         = 800,
      default            = 530,
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
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhlt_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
