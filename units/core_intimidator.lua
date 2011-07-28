-- UNITDEF -- CORE_INTIMIDATOR --
--------------------------------------------------------------------------------

local unitName = "core_intimidator"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 40670,
  buildCostMetal     = 4732,
  builder            = false,
  buildPic           = [[core_intimidator.DDS]],
  buildTime          = 73020,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[CORE LEVEL3 WEAPON NOTAIR NOTSUB]],
  corpse             = [[CORINT_DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[- Long Range EMP Paralizer]],
  designation        = [[F-PS2]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  healtime           = 11,
  iconType           = [[building]],
  immunetoparalyzer  = 1,
  maxDamage          = 5225,
  maxSlope           = 10,
  maxWaterDepth      = 33,
  metalStorage       = 0,
  name               = [[Intimidator Paralizer]],
  noAutoFire         = false,
  objectName         = [[core_intimidator]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[Core]],
  sightDistance      = 367.5,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[core_intimidator]],
  unitnumber         = 113,
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
  zbuffer            = 1,
  customparams = {
    canareaattack      = 1,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:berthaflare]],
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
      [[servlrg4]],
    },
    select = {
      [[servlrg4]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORE_INTIMIDATOREMP]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_INTIMIDATOREMP = {
    accuracy           = 300,
    aimrate            = 500,
    alphaDecay         = 0.01,
    areaOfEffect       = 850,
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
      default            = 1600,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORINT_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Intimidator Wreckage]],
    energy             = 0,
    featureDead        = [[CORINT_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORINT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORINT_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Intimidator Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
