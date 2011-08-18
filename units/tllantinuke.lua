-- UNITDEF -- TLLANTINUKE --
--------------------------------------------------------------------------------

local unitName = "tllantinuke"

--------------------------------------------------------------------------------

local unitDef = {
  antiweapons        = 1,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 54500,
  buildCostMetal     = 1985,
  builder            = false,
  buildTime          = 98025,
  category           = [[TLL SPECIAL WEAPON LEVEL3 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.8,
  description        = [[Anti-Nuke System]],
  designation        = [[TL-AMDS]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Missile nucléaire de défense]],
  germandescription  = [[Atomare Raketenabwehr]],
  italiandescription = [[Sistema di difesa anti-missili]],
  maxDamage          = 2795,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Peacemaker]],
  noAutoFire         = true,
  objectName         = [[TLLANTINUKE]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLASTSML]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 155,
  spanishdescription = [[Sistema de Defensa Antimisiles]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllantinuke]],
  unitnumber         = 860,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
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
      [[loadwtr2]],
    },
    select = {
      [[loadwtr2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTAIR]],
      def                = [[AMD_ROCKET3]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  AMD_ROCKET3 = {
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
    hitdensity         = 123,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllantinuke_dead]],
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
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
