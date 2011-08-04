-- UNITDEF -- AVTR --
--------------------------------------------------------------------------------

local unitName = "avtr"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.036,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.05,
  buildCostEnergy    = 84140,
  buildCostMetal     = 4864,
  builder            = false,
  buildPic           = [[avtr.pcx]],
  buildTime          = 68231,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile LRPC]],
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 6200,
  maxSlope           = 12,
  maxVelocity        = 1.2,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Avatar]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[AVTR]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 260,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 22,
  trackStrength      = 10,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 35,
  turnRate           = 176,
  unitname           = [[avtr]],
  unitnumber         = 999,
  workerTime         = 0,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
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
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Avatar Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 2,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Avatar Wreckage]],
    featureDead        = [[HEAP]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 8,
    hitdensity         = 621,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[AVTR_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
