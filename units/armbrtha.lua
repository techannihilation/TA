-- UNITDEF -- ARMBRTHA --
--------------------------------------------------------------------------------

local unitName = "armbrtha"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  antiweapons        = 1,
  badTargetCategory  = [[MOBILE]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 32700,
  buildCostEnergy    = 60680,
  buildCostMetal     = 4184,
  builder            = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX = 6,
  buildingGroundDecalSizeY = 6,
  buildingGroundDecalType = [[armbrtha_aoplane.dds]],
  buildPic           = [[ARMBRTHA.DDS]],
  buildTime          = 85185,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP LEVEL3 NOTLAND ALL]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Long Range Plasma Cannon]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 0,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4200,
  maxSlope           = 12,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Big Bertha]],
  objectName         = [[ARMBRTHA]],
  seismicSignature   = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  standingfireorder  = 0,
  turnRate           = 0,
  unitname           = [[armbrtha]],
  useBuildingGroundDecal = true,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[MOBILE]],
      def                = [[ARM_BERTHACANNON2]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BERTHACANNON2 = {
    accuracy           = 500,
    aimrate            = 2200,
    areaOfEffect       = 192,
    ballistic          = true,
    collideFriendly    = false,
    craterBoost        = 0.15,
    craterMult         = 0.15,
    energypershot      = 5000,
    explosionGenerator = [[custom:FLASHBIGBUILDING]],
    gravityaffected    = [[true]],
    holdtime           = 1,
    impulseBoost       = 0.5,
    impulseFactor      = 0.5,
    metalpershot       = 10,
    name               = [[BerthaCannon]],
    noSelfDamage       = true,
    range              = 6800,
    reloadtime         = 7,
    renderType         = 4,
    soundHit           = [[xplonuk1]],
    soundStart         = [[xplonuk4]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1000,
    damage = {
      blackhydra         = 2800,
      default            = 1225,
      flakboats          = 2800,
      jammerboats        = 2800,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
      otherboats         = 2800,
      seadragon          = 2800,
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
    description        = [[Big Bertha Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
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
  HEAP = {
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
