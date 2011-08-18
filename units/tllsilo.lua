-- UNITDEF -- TLLSILO --
--------------------------------------------------------------------------------

local unitName = "tllsilo"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 38341,
  buildCostMetal     = 10108,
  builder            = false,
  buildTime          = 193549,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL WEAPON LEVEL3 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .28,
  description        = [[Nuclear Missile Launcher]],
  designation        = [[TLL-NMS]],
  digger             = 1,
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLASTSML]],
  firestandorders    = 1,
  firestate          = 0,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Lance-missiles nucléaires]],
  germandescription  = [[Atomraketenwerfer]],
  italiandescription = [[Lanciamissili nucleare ]],
  maxDamage          = 5720,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Revenger]],
  noAutoFire         = false,
  objectName         = [[TLLSILO]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Lanzamisiles nucleares]],
  standingfireorder  = 0,
  stealth            = true,
  threed             = 1,
  unitname           = [[tllsilo]],
  unitnumber         = 859,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
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
      def                = [[CRBLMSSL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CRBLMSSL = {
    areaOfEffect       = 1920,
    avoidFriendly      = false,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 6,
    craterMult         = 3,
    cruise             = 1,
    edgeEffectiveness  = 0.3,
    energypershot      = 187500,
    explosionGenerator = [[custom:FLASHNUKE1920]],
    fireStarter        = 0,
    flightTime         = 400,
    guidance           = true,
    impulseBoost       = 0.5,
    impulseFactor      = 2.5,
    lineOfSight        = true,
    metalpershot       = 1500,
    model              = [[crblmssl]],
    name               = [[CoreNuclearMissile]],
    noautorange        = 1,
    propeller          = 1,
    range              = 72000,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    shakeduration      = 3,
    shakemagnitude     = 50,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[misicbm1]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 120,
    targetable         = 1,
    tolerance          = 4000,
    turnRate           = 32768,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 100,
    weaponTimer        = 7,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 1600,
    damage = {
      commanders         = 2500,
      default            = 11500,
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
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 123,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllsilo_dead]],
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
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[5x5c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
