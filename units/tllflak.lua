-- UNITDEF -- TLLFLAK --
--------------------------------------------------------------------------------

local unitName = "tllflak"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 8425,
  buildCostMetal     = 1109,
  builder            = false,
  buildTime          = 13995,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL LEVEL3 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Anti-Air Flak Gun]],
  designation        = [[]],
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Canon antiaérien]],
  frenchname         = [[Chandelier]],
  germandescription  = [[Flak]],
  italiandescription = [[Cannone per bersagli aerei]],
  iconType           = [[building]],
  maxDamage          = 5699,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Candlestick]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[TLLFLAK]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 550,
  spanishdescription = [[Arma de fuego antiaéreo]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllflak]],
  unitnumber         = 818,
  version            = 3.1,
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
      badTargetCategory  = [[NOTAIR]],
      def                = [[ARMFLAK_GUN]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMFLAK_GUN = {
    accuracy           = 1000,
    areaOfEffect       = 192,
    ballistic          = true,
    burnblow           = true,
    canattackground    = false,
    color              = 1,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.85,
    explosionGenerator = [[custom:FLASH3]],
    gravityaffected    = [[true]],
    impulseBoost       = 0,
    impulseFactor      = 0,
    minbarrelangle     = -24,
    name               = [[FlakCannon]],
    noSelfDamage       = true,
    range              = 975,
    reloadtime         = 0.30,
    renderType         = 4,
    size               = 5,
    soundHit           = [[flakhit]],
    soundStart         = [[flakfire]],
    startsmoke         = 1,
    toAirWeapon        = true,
    turret             = true,
    unitsonly          = 1,
    weaponTimer        = 1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1550,
    damage = {
      default            = 0,
      gunships           = 500,
      hgunships          = 500,
      l1bombers          = 550,
      l1fighters         = 170,
      l2bombers          = 1100,
      l2fighters         = 950,
      vradar             = 600,
      vtol               = 200,
      vtrans             = 200,
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
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllflak_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
