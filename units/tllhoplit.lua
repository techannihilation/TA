-- UNITDEF -- TLLHOPLIT --
--------------------------------------------------------------------------------

local unitName = "tllhoplit"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.060,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.02,
  buildCostEnergy    = 2010,
  buildCostMetal     = 155,
  builder            = false,
  buildTime          = 6059,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL TANK LEVEL2 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Anti-Air Rocket Tank]],
  designation        = [[TL-TK]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maneuverleashlength = 640,
  maxDamage          = 940,
  maxSlope           = 10,
  maxVelocity        = 2.4,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Hoplit]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLHOPLIT]],
  ovradjust          = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 740,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 795,
  unitname           = [[tllhoplit]],
  unitnumber         = 874,
  version            = 3.1,
  zbuffer            = 1,
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
      def                = [[PACKO_MISSILE]],
      onlyTargetCategory = [[VTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  PACKO_MISSILE = {
    areaOfEffect       = 16,
    burst              = 2,
    burstrate          = 0.2,
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 72,
    flightTime         = 2,
    guidance           = true,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[AA2Missile]],
    noSelfDamage       = true,
    proximityPriority  = 1,
    range              = 1000,
    reloadtime         = 1.7,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[packohit]],
    soundStart         = [[packolau]],
    soundTrigger       = true,
    startsmoke         = 1,
    startVelocity      = 520,
    texture2           = [[armsmoketrail]],
    toAirWeapon        = true,
    tolerance          = 9950,
    tracks             = true,
    turnRate           = 68000,
    turret             = true,
    weaponAcceleration = 160,
    weaponTimer        = 2,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 820,
    wobble             = 120,
    damage = {
      default            = 169,
      gunships           = 95,
      hgunships          = 95,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
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
    footprintX         = 2,
    footprintZ         = 2,
    height             = 12,
    hitdensity         = 45,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhoplit_dead]],
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
    footprintX         = 2,
    footprintZ         = 2,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
