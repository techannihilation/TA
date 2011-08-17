-- UNITDEF -- CORFROG --
--------------------------------------------------------------------------------

local unitName = "corfrog"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.04,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 0.1,
  buildCostEnergy    = 16447,
  buildCostMetal     = 2006,
  builder            = false,
  buildTime          = 30005,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[corsent_dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Flak Hovercraft]],
  designation        = [[CAAH-5]],
  downloadable       = 1,
  energyMake         = 0.3,
  energyStorage      = 100,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft antiaérien]],
  frenchname         = [[F.R.O.G.]],
  germandescription  = [[Flak-Hovercraft]],
  germanname         = [[F.R.O.G.]],
  italiandescription = [[Veicolo d'artiglieria mobile]],
  italianname        = [[F.R.O.G.]],
  maneuverleashlength = 30,
  maxDamage          = 2460,
  maxSlope           = 14,
  maxVelocity        = 1.81,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[F.R.O.G.]],
  noAutoFire         = false,
  objectName         = [[CORFROG]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 260,
  spanishdescription = [[Vehículo Móvil Antiaéreo]],
  spanishname        = [[F.R.O.G.]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 489,
  unitname           = [[corfrog]],
  unitnumber         = 165,
  upright            = true,
  version            = 1.2,
  workerTime         = 0,
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
      [[hovmdok2]],
    },
    select = {
      [[hovmdsl2]],
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
    reloadtime         = 0.40,
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
  CORSENT_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Copperhead Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[2X2A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  corsent_dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Copperhead Wreckage]],
    energy             = 0,
    featureDead        = [[CORSENT_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORSENT_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
