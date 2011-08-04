-- UNITDEF -- ARMAMD2 --
--------------------------------------------------------------------------------

local unitName = "armamd2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  antiweapons        = 1,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 789439,
  buildCostMetal     = 21937,
  builder            = false,
  buildPic           = [[ARMAMD.DDS]],
  buildTime          = 495678,
  category           = [[ARM WEAPON NOTAIR NOTSUB NOTSHIP LEVEL3 NOTLAND ALL]],
  corpse             = [[ARMAMD1_DEAD]],
  damageModifier     = 0.5,
  description        = [[T3  Anti-Nuke System]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 14800,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[T3 Protector]],
  objectName         = [[ARMAMD2]],
  radarDistance      = 50,
  script             = [[armamd.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 201,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[armamd2]],
  unitRestricted     = 8,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      [[loadwtr2]],
    },
    select = {
      [[loadwtr2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[AMD_ROCKET2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AMD_ROCKET2 = {
    areaOfEffect       = 400,
    coverage           = 3600,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 55000,
    explosionGenerator = [[custom:FLASH4]],
    fireStarter        = 100,
    flightTime         = 120,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    interceptor        = 2,
    lineOfSight        = true,
    metalpershot       = 6780,
    model              = [[amdrocket]],
    name               = [[Rocket]],
    noautorange        = 1,
    noSelfDamage       = true,
    range              = 72000,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 90,
    tolerance          = 4000,
    tracks             = true,
    turnRate           = 99000,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 26,
    weaponTimer        = 25,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 190,
    damage = {
      default            = 15000,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMAMD1_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Protector Wreckage]],
    energy             = 0,
    featureDead        = [[ARMAMD1_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMAMD_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMAMD1_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Protector Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5X5B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
