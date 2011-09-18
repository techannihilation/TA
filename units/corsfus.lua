-- UNITDEF -- CORSFUS --
--------------------------------------------------------------------------------

local unitName = "corsfus"

--------------------------------------------------------------------------------
--NEWFUS
local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 136000,
  buildCostMetal     = 15700,
  builder            = false,
  buildPic           = [[CORSFUS.png]],
  buildTime          = 298000,
  category           = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
  
  modelCenterOffset = [[0 -55 0]],
  collisionvolumeoffsets = [[0 -15 0]],
  collisionvolumescales = [[45 100 45]],
  collisionvolumetest = 0,
  collisionvolumetype = [[ellipsoid]],
  corpse             = [[DEAD]],
  description        = [[Produces Energy / Storage]],
  energyMake         = 4096,
  energyStorage      = 40960,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 9,
  footprintZ         = 9,
  hideDamage         = true,
  iconType           = [[building]],
  idleAutoHeal       = 20,
  idleTime           = 1800,
  maxDamage          = 11500,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 1,
  metalStorage       = 0,
  name               = [[Airstrike Resistant Fusion Reactor]],
  noAutoFire         = false,
  objectName         = [[CORSFUS]],
  onoffable = true,
  seismicSignature   = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[corsfus]],
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[fusion2]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[CORSFUSshield]],
    },

  },
}

--------------------------------------------------------------------------------

local weaponDefs = {
  CORSFUSshield = {
	exteriorshield = 0,
    isShield           = true,
    name               = [[FusionShield]],
    shieldAlpha        = 0.3,
    shieldBadColor     = [[1 0.2 0.2]],
    shieldEnergyUse    = 512,
    shieldGoodColor    = [[0.6 0.8 1]],
    shieldInterceptType = 17, --1, 16
    shieldPower        = 16000,
    shieldPowerRegen   = 120,
    shieldPowerRegenEnergy = 2048,
    shieldRadius       = 180,
    shieldRepulser     = false,
    shieldStartingPower = 4000,
    --smartShield        = true,
	--shieldForce = 50,
	--shieldMaxSpeed = 0.05,
    visibleShield      = false,
    visibleShieldHitFrames = 32,
    visibleShieldRepulse = true,
    weaponType         = [[Shield]],
	--texture1 = [[megaparticle]]
    damage = {
      default            = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------


local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*2,
    description        = [[Fusion Reactor Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORFUS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Fusion Reactor Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
