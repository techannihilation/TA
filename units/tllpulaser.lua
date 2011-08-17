-- UNITDEF -- TLLPULASER --
--------------------------------------------------------------------------------

local unitName = "tllpulaser"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 1875,
  buildCostMetal     = 661,
  builder            = false,
  buildTime          = 12381,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.125,
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Pop-Up Heavy Laser]],
  designation        = [[TL-PUL]],
  digger             = 1,
  downloadable       = 1,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Canon laser lourd rétractable]],
  germandescription  = [[Getarnter schwerer Laser]],
  italiandescription = [[Laser pesante a comparsa]],
  maxDamage          = 1588,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Adder]],
  noAutoFire         = false,
  objectName         = [[TLLPULASER]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 310,
  spanishdescription = [[Láser automático pesado]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllpulaser]],
  unitnumber         = 844,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooo ooo ooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak2]],
    uncloak            = [[kloak2un]],
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
      [[servmed1]],
    },
    select = {
      [[servmed1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_LASERH2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LASERH2 = {
    areaOfEffect       = 14,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 75,
    explosionGenerator = [[custom:GreenLaser]],
    fireStarter        = 90,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 700,
    reloadtime         = 0.6,
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
      commanders         = 500,
      default            = 237,
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
    footprintX         = 4,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 23,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllpulaser_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
