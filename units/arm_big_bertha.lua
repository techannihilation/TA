-- UNITDEF -- ARM_BIG_BERTHA --
--------------------------------------------------------------------------------

local unitName = "arm_big_bertha"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 45530,
  buildCostMetal     = 4076,
  builder            = false,
  buildPic           = [[arm_big_bertha.DDS]],
  buildTime          = 67926,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[ARM LEVEL3 WEAPON NOTAIR NOTSUB]],
  corpse             = [[ARMBRTHA_DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[- Long Range EMP Paralizer]],
  designation        = [[ARM-LRC]],
  downloadable       = 1,
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  healtime           = 11,
  iconType           = [[building]],
  immunetoparalyzer  = 1,
  maxDamage          = 4950,
  maxSlope           = 10,
  maxWaterDepth      = 33,
  metalStorage       = 0,
  name               = [[Big Bertha Paralizer]],
  objectName         = [[arm_big_bertha]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[Arm]],
  sightDistance      = 367.5,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[arm_big_bertha]],
  unitnumber         = 16,
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
  zbuffer            = 1,
  customparams = {
    canareaattack      = 1,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:BERTHAFLARE]],
    },
  },
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_BERTHACANNONEMP]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BERTHACANNONEMP = {
    accuracy           = 300,
    aimrate            = 500,
    alphaDecay         = 0.01,
    areaOfEffect       = 800,
    ballistic          = true,
    cegTag             = [[vulcanfx1]],
    color              = 3,
    craterBoost        = 0.0,
    craterMult         = 0.0,
    edgeEffectiveness  = 50,
    energypershot      = 16300,
    explosionGenerator = [[custom:EMPFLASH240]],
    fireStarter        = 50,
    gravityaffected    = [[true]],
    groundbounce       = false,
    holdtime           = 1,
    id                 = 72,
    impulseBoost       = 0.0,
    impulseFactor      = 0.0,
    name               = [[Bertha Cannon]],
    noGap              = true,
    paralyzer          = true,
    paralyzeTime       = 16,
    range              = 6750,
    reloadtime         = 15.67,
    renderType         = 4,
    rgbColor           = [[1 0.8 0.5]],
    separation         = 0.01,
    size               = 4,
    sizeDecay          = -0.01,
    soundHit           = [[EMGPULS1]],
    soundStart         = [[xplonuk4]],
    stages             = 20,
    startsmoke         = 1,
    tolerance          = 7000,
    turret             = true,
    waterbounce        = false,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1100,
    damage = {
      default            = 1900,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMBRTHA_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Big Bertha Wreckage]],
    energy             = 0,
    featureDead        = [[ARMBRTHA_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMBRTHA_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMBRTHA_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Big Bertha Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
