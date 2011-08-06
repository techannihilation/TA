-- UNITDEF -- ARMVULC1 --
--------------------------------------------------------------------------------

local unitName = "armvulc1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  antiweapons        = 1,
  badTargetCategory  = [[MOBILE]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 29096,
  buildCostEnergy    = 1803644,
  buildCostMetal     = 273094,
  builder            = false,
  buildPic           = [[ARMVULC.DDS]],
  buildTime          = 2772961,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 NOTLAND ALL]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[T3 Rapid-Fire Long-Range Plasma Cannon]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 16,
  footprintZ         = 16,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 104440,
  maxSlope           = 13,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Super Vulcan]],
  objectName         = [[ARMVULC1]],
  script             = [[armvulc.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  standingfireorder  = 1,
  turnRate           = 0,
  unitname           = [[armvulc1]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
  sfxtypes = {
    explosiongenerators = {
      [[custom:vulcanflare]],
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
      def                = [[ARMVULC_WEAPON1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMVULC_WEAPON1 = {
    accuracy           = 400,
    areaOfEffect       = 224,
    ballistic          = true,
    collideFriendly    = false,
    color              = 2,
    craterBoost        = 0.65,
    craterMult         = 0.65,
    edgeEffectiveness  = 0.75,
    energypershot      = 61000,
    explosionGenerator = [[custom:FLASHBIGBUILDING]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.5,
    impulseFactor      = 0.5,
    name               = [[RapidfireLRPC]],
    noSelfDamage       = true,
    randomdecay        = 11,
    range              = 9800,
    reloadtime         = 0.5,
    renderType         = 4,
    soundHit           = [[rflrpc3]],
    soundStart         = [[XPLONUK4]],
    startsmoke         = 1,
    turret             = true,
    weaponTimer        = 14,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1350,
    damage = {
      blackhydra         = 2500,
      default            = 6100,
      flakboats          = 2500,
      jammerboats        = 2500,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
      otherboats         = 2500,
      seadragon          = 2500,
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
    description        = [[Super Vulcan Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 14,
    footprintZ         = 14,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMVULC1_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
