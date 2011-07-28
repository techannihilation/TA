-- UNITDEF -- TLLION --
--------------------------------------------------------------------------------

local unitName = "tllion"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 1700,
  buildCostEnergy    = 1178502,
  buildCostMetal     = 274840,
  builder            = false,
  buildPic           = [[tllion.jpg]],
  buildTime          = 999999,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL WEAPON NOTAIR NOTSUB ALL]],
  collisionvolumeoffsets = [[0 -89 0]],
  collisionvolumescales = [[105 182 105]],
  collisionvolumetest = 1,
  collisionvolumetype = [[Ell]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Control station for the orbital Ion Cannon - 200,000 E / Shot]],
  designation        = [[TL-EXT]],
  energyMake         = 0,
  energyStorage      = 0,
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  firestate          = 0,
  footprintX         = 7,
  footprintZ         = 7,
  iconType           = [[building]],
  maxDamage          = 3920,
  maxSlope           = 12,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Command Center]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLION]],
  selfDestructAs     = [[CRAWL_BLAST]],
  side               = [[TLL]],
  sightDistance      = 300,
  standingfireorder  = 2,
  unitname           = [[tllion]],
  workerTime         = 0,
  yardMap            = [[yoooyyy yoooooo ooooooo ooooooo yoooooo yoooooy yyooooy ]],
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
      [[servroc1]],
    },
    select = {
      [[servroc1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_ION_CANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_ION_CANNON = {
    alwaysVisible      = true,
    areaOfEffect       = 360,
    avoidFeature       = false,
    avoidFriendly      = false,
    beamlaser          = 1,
    beamWeapon         = true,
    coreThickness      = 0.47,
    craterBoost        = 0,
    craterMult         = 0.35,
    duration           = 2.0,
    edgeEffectiveness  = 0,
    energypershot      = 600000,
    explosionGenerator = [[custom:FLASHNUKE360]],
    fallOffRate        = 0,
    fireStarter        = 0,
    flightTime         = 0,
    impulseBoost       = 0.5,
    intensity          = 1,
    interceptedByShieldType = 0,
    largeBeamLaser     = true,
    lineOfSight        = true,
    minIntensity       = 1.0,
    name               = [[Ion Cannon]],
    noautorange        = 1,
    range              = 32000,
    reloadtime         = 36,
    renderType         = 0,
    rgbColor           = [[0.35 0 0.35]],
    rgbColor2          = [[0.07 1 1]],
    shakeduration      = 1.5,
    shakemagnitude     = 20,
    soundHit           = [[xplolrg1]],
    soundHitVolume     = 50,
    soundStart         = [[annigun1]],
    texture1           = [[Type6Beam]],
    texture2           = [[NULL]],
    texture3           = [[NULL]],
    texture4           = [[EMG4]],
    thickness          = 100,
    tolerance          = 500,
    turret             = true,
    weaponTimer        = 0,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 2500,
    damage = {
      blackhydra         = 6000,
      commanders         = 1800,
      default            = 2100,
      heavyunits         = 4000,
      hero               = 14000,
      krogoth            = 10000,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Command Center Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllion_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Command Center Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
