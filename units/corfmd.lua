-- UNITDEF -- CORFMD --
--------------------------------------------------------------------------------

local unitName = "corfmd"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  antiweapons        = 1,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 94321,
  buildCostMetal     = 1908,
  builder            = false,
  buildPic           = [[CORFMD.DDS]],
  buildTime          = 126450,
  category           = [[ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  damageModifier     = 0.5,
  description        = [[Anti-Nuke System]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 3280,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Fortitude]],
  objectName         = [[CORFMD]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 195,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[corfmd]],
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
      [[loadwtr1]],
    },
    select = {
      [[loadwtr1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[FMD_ROCKET3]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FMD_ROCKET3 = {
    areaOfEffect       = 400,
    coverage           = 2400,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 14000,
    explosionGenerator = [[custom:FLASH4]],
    fireStarter        = 100,
    flightTime         = 120,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    interceptor        = 1,
    lineOfSight        = true,
    metalpershot       = 1100,
    model              = [[fmdmisl]],
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
    stockpiletime      = 100,
    tolerance          = 4000,
    tracks             = true,
    turnRate           = 99000,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 75,
    weaponTimer        = 3,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 3100,
    damage = {
      default            = 15000,
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
    description        = [[Fortitude Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORFMD_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Fortitude Heap]],
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
