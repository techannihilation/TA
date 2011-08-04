-- UNITDEF -- ARMANNI1 --
--------------------------------------------------------------------------------

local unitName = "armanni1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  badTargetCategory  = [[ANTILASER]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 162563,
  buildCostMetal     = 12985,
  builder            = false,
  buildPic           = [[ARMANNI.DDS]],
  buildTime          = 252071,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP LEVEL3 NOTLAND ALL]],
  corpse             = [[DEAD]],
  damageModifier     = 0.25,
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Super Tachyon Accelerator]],
  energyStorage      = 2000,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 8,
  footprintZ         = 8,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 65500,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Advanced Annihilator]],
  noChaseCategory    = [[MOBILE]],
  objectName         = [[ARMANNI1]],
  onoffable          = true,
  radarDistance      = 1500,
  seismicSignature   = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[ARM]],
  sightDistance      = 780,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[armanni1]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      [[anni]],
    },
    select = {
      [[anni]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[ANTILASER]],
      def                = [[ATA10]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ATA10 = {
    areaOfEffect       = 46,
    avoidFeature       = false,
    beamlaser          = 1,
    beamTime           = 2.2,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 15000,
    explosionGenerator = [[custom:BURN_WHITE]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 20,
    lineOfSight        = true,
    name               = [[ATA]],
    noSelfDamage       = true,
    range              = 1900,
    reloadtime         = 6.9,
    renderType         = 0,
    rgbColor           = [[0 0 1]],
    soundHit           = [[xplolrg1]],
    soundStart         = [[annigun1]],
    targetMoveError    = 0.3,
    thickness          = 7,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1400,
    damage = {
      commanders         = 1100,
      default            = 14000,
      hero               = 34000,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Annihilator Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMANNI1_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Annihilator Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 8,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6X6B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
