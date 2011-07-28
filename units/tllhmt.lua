-- UNITDEF -- TLLHMT --
--------------------------------------------------------------------------------

local unitName = "tllhmt"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 16219,
  buildCostMetal     = 2157,
  builder            = false,
  buildTime          = 13341,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Long-Range Anti-Air Tower]],
  designation        = [[]],
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maxDamage          = 4725,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[H.M.T.]],
  noAutoFire         = false,
  objectName         = [[TLLHMT]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllhmt]],
  unitnumber         = 817,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak1]],
    uncloak            = [[kloak1un]],
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
      [[twrturn3]],
    },
    select = {
      [[twrturn3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[ARM_ADVSAM]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_ADVSAM = {
    areaOfEffect       = 800,
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.25,
    explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
    fireStarter        = 90,
    flightTime         = 3,
    guidance           = true,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lineOfSight        = true,
    model              = [[ADVSAM]],
    name               = [[ADVSAM]],
    noSelfDamage       = true,
    proximityPriority  = -1.5,
    range              = 3000,
    reloadtime         = 14.75,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0,
    smokeTrail         = true,
    soundHit           = [[impact]],
    soundStart         = [[launch]],
    startsmoke         = 1,
    startVelocity      = 1000,
    texture2           = [[armsmoketrail]],
    toAirWeapon        = true,
    tolerance          = 10000,
    tracks             = true,
    trajectoryHeight   = 0.55,
    turnRate           = 99000,
    turret             = true,
    weaponAcceleration = 300,
    weaponTimer        = 8,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 1600,
    damage = {
      default            = 0,
      gunships           = 1750,
      hgunships          = 5000,
      l1bombers          = 1750,
      l1fighters         = 1750,
      l2bombers          = 1750,
      l2fighters         = 1750,
      vradar             = 1750,
      vtol               = 1750,
      vtrans             = 1750,
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
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhmt_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3A]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
