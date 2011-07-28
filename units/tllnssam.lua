-- UNITDEF -- TLLNSSAM --
--------------------------------------------------------------------------------

local unitName = "tllnssam"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 824,
  buildCostMetal     = 420,
  builder            = false,
  buildTime          = 5135,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Floating SAM Tower]],
  designation        = [[TL-SAM NS]],
  energyUse          = 12,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maxDamage          = 1455,
  minWaterDepth      = 20,
  name               = [[NS Wiper]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  noshadow           = 1,
  objectName         = [[TLLNSSAM]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 950,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllnssam]],
  unitnumber         = 873,
  version            = 3.1,
  waterline          = 5,
  workerTime         = 0,
  yardMap            = [[wwwwwwwwwwwwwwww]],
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[PACKO_MISSILE]],
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 43,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllNSSAM_dead]],
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
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
