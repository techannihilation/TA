-- UNITDEF -- TLLATORP --
--------------------------------------------------------------------------------

local unitName = "tllatorp"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 6520,
  buildCostMetal     = 2190,
  builder            = false,
  buildTime          = 8580,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL WEAPON  LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Torpedo & depth charge Launcher]],
  designation        = [[TLL-ATL]],
  energyMake         = 0.2,
  energyUse          = 0.2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Lance-Torpilles]],
  frenchname         = [[Lance Torpille Avancé]],
  germandescription  = [[Verbesserter Torpedowerfer]],
  germanname         = [[Verbesserter Torpedowerfer]],
  italiandescription = [[Lanciatorpedini avanzato]],
  italianname        = [[Lanciatorpedini avanzato]],
  maxDamage          = 808,
  minWaterDepth      = 5,
  name               = [[Advanced Torpedo Launcher]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLatorp]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  sonarDistance      = 750,
  spanishdescription = [[Lanzatorpedos Avanzado]],
  spanishname        = [[Lanzatorpedos Avanzado]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllatorp]],
  unitnumber         = 866,
  version            = 3.1,
  waterline          = 11,
  workerTime         = 0,
  yardMap            = [[wwwwwwwww]],
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
      [[torpadv2]],
    },
    select = {
      [[torpadv2]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[TLL_ADVEDO]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_ADVEDO = {
    areaOfEffect       = 32,
    burnblow           = true,
    burst              = 2,
    burstrate          = .5,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    guidance           = true,
    id                 = 219,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[TLLtorpedo]],
    name               = [[Torpedo Launcher]],
    propeller          = 1,
    range              = 601,
    reloadtime         = 2.6,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[SPLASH]],
    soundStart         = [[torpedo1]],
    sprayAngle         = 5000,
    startVelocity      = 100,
    tracks             = true,
    turnRate           = 50000,
    turret             = true,
    waterexplosionart  = [[H2oboom2]],
    waterexplosiongaf  = [[CAexp3]],
    waterWeapon        = true,
    weaponAcceleration = 15,
    weaponTimer        = 6,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 100,
    damage = {
      default            = 285,
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllatorp_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
