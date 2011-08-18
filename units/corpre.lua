-- UNITDEF -- CORPRE --
--------------------------------------------------------------------------------

local unitName = "corpre"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 2000,
  buildCostEnergy    = 1231120,
  buildCostMetal     = 17760,
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
      def                = [[CapitalShipMinigun]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CapitalShipMinigun = {
   accuracy           = 750,
    areaOfEffect       = 75,
    beamWeapon         = true,
    burnblow           = true,
    burst              = 2,
    burstrate          = .1,
    coreThickness      = 1,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.04,
    edgeEffectiveness  = 0.4,
    energypershot      = 5000,
    explosionart       = [[Explode5]],
    explosiongaf       = [[FX]],
	guidance           = true,

    id                 = 142,
    lineOfSight        = true,
    --model              = [[ion2]],
    name               = [[Anti-airplane ion mingun]],
    noSelfDamage       = true,
    --pitchtolerance     = 0,
    range              = 1350,
	rgbColor           = [[1 1 1]],
	rgbColor2          = [[0.5 0.5 0.5]],
    reloadtime         = 0.20,
    renderType         = 0,
    selfprop           = true,
    soundHit           = [[flakhit]],
    --soundStart         = [[flakfire]],
    soundStart         = [[MG1]],
	soundStartVolume   = 15,
    soundTrigger       = true,
    startsmoke         = 0,
    texture1           = [[NarrowBoltNoisy]],
    texture2           = [[NULL]],
    texture3           = [[NULL]],
	thickness          = 3.5,
    toAirWeapon        = true,
    tolerance          = 0,
    tracks             = true,
    turnRate           = 15000,
    turret             = true,
    --weaponTimer        = 5,
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 2500,
    damage = {
      default            = 3500,
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
