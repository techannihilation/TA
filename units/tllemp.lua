-- UNITDEF -- TLLEMP --
--------------------------------------------------------------------------------

local unitName = "tllemp"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 13341,
  buildCostMetal     = 1120,
  builder            = false,
  buildTime          = 59531,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL WEAPON LEVEL3 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[EMP Launcher]],
  designation        = [[TL-EMP]],
  downloadable       = 1,
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  maxDamage          = 2500,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Freezer]],
  noAutoFire         = false,
  objectName         = [[TLLEMP]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  standingfireorder  = 0,
  TEDClass           = [[SPECIAL]],
  threed             = 1,
  unitname           = [[tllemp]],
  unitnumber         = 861,
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
      [[servroc1]],
    },
    select = {
      [[servroc1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMEMP_WEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMEMP_WEAPON = {
    areaOfEffect       = 256,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 1,
    energypershot      = 23437,
    explosionGenerator = [[custom:EMPLAUNCHER]],
    fireStarter        = 0,
    flightTime         = 400,
    guidance           = true,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lineOfSight        = true,
    metalpershot       = 750,
    model              = [[empmisl]],
    name               = [[EMPMissile]],
    noautorange        = 1,
    noSelfDamage       = true,
    paralyzer          = true,
    paralyzeTime       = 60,
    propeller          = 1,
    range              = 4500,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    shakeduration      = 1.5,
    shakemagnitude     = 32,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[misicbm1]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 90,
    tolerance          = 4000,
    turnRate           = 32768,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 180,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 1200,
    damage = {
      blackhydra         = 300,
      commanders         = 300,
      default            = 96000,
      krogoth            = 300,
      seadragon          = 300,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 1900,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 123,
    metal              = 717,
    object             = [[tllsilo_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1100,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 276,
    object             = [[4x4c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
