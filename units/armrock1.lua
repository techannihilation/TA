-- UNITDEF -- ARMROCK1 --
--------------------------------------------------------------------------------

local unitName = "armrock1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.188,
  buildCostEnergy    = 1644,
  buildCostMetal     = 197,
  builder            = false,
  buildPic           = [[ARMROCK.DDS]],
  buildTime          = 1887,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM KBOT MOBILE WEAPON NOTAIR NOTSUB NOTSHIP ALL]],
  corpse             = [[ARMROCK_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Rocket Kbot]],
  energyMake         = 0.6,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 950,
  maxSlope           = 14,
  maxVelocity        = 1.8,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Insistent Rocko]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMROCK1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 388,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  turnRate           = 1106,
  unitname           = [[armrock1]],
  upright            = true,
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      [[custom:rocketflare]],
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_KBOT_ROCKET1]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_KBOT_ROCKET1 = {
    areaOfEffect       = 48,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:VSMLMISSILE_EXPLOSION]],
    fireStarter        = 70,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Rockets]],
    noSelfDamage       = true,
    range              = 570,
    reloadtime         = 3.8,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[rocklit1]],
    startsmoke         = 1,
    startVelocity      = 200,
    texture2           = [[armsmoketrail]],
    trajectoryHeight   = 0.45,
    turret             = true,
    weaponAcceleration = 120,
    weaponTimer        = 2,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 200,
    damage = {
      default            = 192,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMROCK_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Insistent Rocko Wreckage]],
    energy             = 0,
    featureDead        = [[ARMROCK_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMROCK_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMROCK_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Insistent Rocko Heap]],
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
