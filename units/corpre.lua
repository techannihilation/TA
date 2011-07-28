-- UNITDEF -- CORPRE --
--------------------------------------------------------------------------------

local unitName = "corpre"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2000,
  buildCostEnergy    = 431120,
  buildCostMetal     = 15760,
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
  energyMake          = -1000,
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
  maxDamage          = 8500,
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
    accuracy           = 750,
    areaOfEffect       = 75,
	beamTime           = 0.00005,
    beamWeapon         = true,
    burnblow           = true,
	coreThickness      = 1.75;
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.4,
    energypershot      = 5000,
    explosionart       = [[Explode5]],
    explosiongaf       = [[FX]],
    fireStarter        = 70,
    --guidance           = true,
    id                 = 142,
    --impulseBoost       = 0.523,
    --impulseFactor      = 0.523,
    lineOfSight        = true,
    --model              = [[ion2]],
    name               = [[Anti-airplane ion discharge]],
    noSelfDamage       = true,
    --pitchtolerance     = 0,
    range              = 1350,
	rgbcolor  = [[0.0 0 1]],
	rgbcolor2  = [[0.2 0 1]],
    reloadtime         = 0.15,
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
    --weaponTimer        = 5,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 3900,
    damage = {
      default            = 3900,
      --gunships           = 1000,
      --hgunships          = 1000,
      --l1bombers          = 1000,
      --l1fighters         = 1000,
      --l2bombers          = 1000,
      --l2fighters         = 1000,
      vradar             = 400,
      --vtol               = 400,
      --vtrans             = 400,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Precipitator Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 25,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[corpre_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Precipitator Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
