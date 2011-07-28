-- UNITDEF -- SCREAMER --
--------------------------------------------------------------------------------

local unitName = "screamer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 57660,
  buildCostMetal     = 1762,
  builder            = false,
  buildPic           = [[SCREAMER.DDS]],
  buildTime          = 37543,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL WEAPON NOTSUB SPECIAL NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Long-Range Missile Tower]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 4355,
  maxSlope           = 20,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Screamer]],
  noAutoFire         = false,
  objectName         = [[SCREAMER]],
  onoffable          = false,
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 700,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[screamer]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
  sounds = {
    activate           = [[targon2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[targoff2]],
    underattack        = [[warning1]],
    working            = [[targsel2]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[targsel2]],
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
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Screamer Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[SCREAMER_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Screamer Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4X4A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
