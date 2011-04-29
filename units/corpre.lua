-- UNITDEF -- CORPRE --
--------------------------------------------------------------------------------

local unitName = "corpre"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2000,
  buildCostEnergy    = 231120,
  buildCostMetal     = 5760,
  builder            = false,
  buildTime          = 220000,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE LEVEL3 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Very Heavy Anti-Air Flak Gun]],
  designation        = [[oMgtehfLakZZzZ]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Canon antiaérien]],
  frenchname         = [[Precipitator]],
  germandescription  = [[Flak]],
  germanname         = [[Precipitator]],
  healtime           = -1,
  italiandescription = [[Cannone per bersagli aerei]],
  italianname        = [[Precipitator]],
  maxDamage          = 18500,
  maxSlope           = 20,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Precipitator]],
  noAutoFire         = false,
  objectName         = [[CORPRE]],
  radarDistance      = 1000,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 800,
  spanishdescription = [[Arma de fuego antiaéreo]],
  spanishname        = [[Precipitator]],
  standingfireorder  = 2,
  TEDClass           = [[FORT]],
  threed             = 1,
  unitname           = [[corpre]],
  unitnumber         = 161,
  version            = 1.0,
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
      def                = [[FFAAION]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FFAAION = {
    areaOfEffect       = 50,
    beamWeapon         = true,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.90,
    energypershot      = 5,
    explosionart       = [[Explode5]],
    explosiongaf       = [[FX]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 142,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[ion2]],
    name               = [[Anti-airplane ion discharge]],
    noSelfDamage       = true,
    pitchtolerance     = 0,
    range              = 1100,
    reloadtime         = 0.08,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[lashit]],
    soundStart         = [[lasrlit1]],
    startsmoke         = 0,
    toAirWeapon        = true,
    tolerance          = 0,
    tracks             = true,
    turnRate           = 24384,
    turret             = true,
    weaponTimer        = 5,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 1500,
    damage = {
      default            = 0,
      gunships           = 150,
      hgunships          = 150,
      l1bombers          = 150,
      l1fighters         = 150,
      l2bombers          = 150,
      l2fighters         = 150,
      vradar             = 150,
      vtol               = 150,
      vtrans             = 80,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = 18000,
    description        = [[Precipitator Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 25,
    hitdensity         = 100,
    metal              = 3646,
    object             = [[corpre_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 12000,
    description        = [[Precipitator Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = 1397,
    object             = [[5x5a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
