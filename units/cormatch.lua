-- UNITDEF -- CORMATCH --
--------------------------------------------------------------------------------

local unitName = "cormatch"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.105,
  buildCostEnergy    = 3665,
  buildCostMetal     = 348,
  builder            = false,
  buildTime          = 9500,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[corsnap_dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Flamethrower Hovertank]],
  designation        = [[CORMATCH]],
  downloadable       = 1,
  energyMake         = 2.1,
  energyStorage      = 0,
  energyUse          = 2.1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft blindé lance-flammes]],
  frenchname         = [[Matcher]],
  germandescription  = [[Flammenwerfer Hovercraft]],
  germanname         = [[Matcher]],
  italiandescription = [[Hovercraft armato]],
  italianname        = [[Matcher]],
  maneuverleashlength = 640,
  maxDamage          = 1800,
  maxSlope           = 16,
  maxVelocity        = 2.8,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Matcher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORMATCH]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 270,
  spanishdescription = [[Tanque aerodeslizador]],
  spanishname        = [[Matcher]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 230,
  unitname           = [[cormatch]],
  unitnumber         = 6144,
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
      badTargetCategory  = [[VTOL]],
      def                = [[FLAMETHROWER]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  FLAMETHROWER = {
    areaOfEffect       = 48,
    avoidFeature       = false,
    burst              = 22,
    burstrate          = 0.01,
    craterBoost        = 0,
    craterMult         = 0,
    endsmoke           = 1,
    fireStarter        = 100,
    flameGfxTime       = 1.9,
    groundbounce       = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    intensity          = 0.6,
    lineOfSight        = true,
    name               = [[FlameThrower]],
    noSelfDamage       = true,
    range              = 230,
    reloadtime         = 1.1,
    renderType         = 5,
    rgbColor           = [[1 0.95 0.9]],
    rgbColor2          = [[0.9 0.85 0.8]],
    sizeGrowth         = 1.1,
    soundStart         = [[Flamhvy1]],
    soundTrigger       = false,
    sprayAngle         = 1500,
    tolerance          = 2500,
    turret             = true,
    weaponTimer        = 1.5,
    weaponType         = [[Flame]],
    weaponVelocity     = 265,
    damage = {
      default            = 12,
      flamethrowers      = 5,
      gunships           = 1,
      hgunships          = 1,
      l1subs             = 1,
      l2subs             = 1,
      l3subs             = 1,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORSNAP_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Snapper Heap]],
    energy             = 0,
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[3X3D]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  corsnap_dead = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Snapper Wreckage]],
    energy             = 0,
    featureDead        = [[CORSNAP_HEAP]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORSNAP_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
