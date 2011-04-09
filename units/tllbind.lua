-- UNITDEF -- TLLBIND --
--------------------------------------------------------------------------------

local unitName = "tllbind"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.3,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.183105469,
  buildCostEnergy    = 2400,
  buildCostMetal     = 1185,
  builder            = false,
  buildTime          = 21020,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL2 WEAPON NOTAIR NOTSUB NOTSTRUCTURE CTRL_G CTRL_W]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy flame thrower]],
  designation        = [[]],
  energyMake         = 1.1,
  energyUse          = 1.2,
  explodeAs          = [[CORPYRO_BLAST]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[K-bot Lance flammes lourd]],
  maneuverleashlength = 640,
  maxDamage          = 3735,
  maxSlope           = 17,
  maxVelocity        = 1.15,
  maxWaterDepth      = 25,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Binder]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLBind]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 245,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 250,
  unitname           = [[tllbind]],
  unitnumber         = 8301,
  upright            = true,
  version            = 3.1,
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[CTRL_V]],
      def                = [[TLL_FLAME2]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_FLAME2 = {
    accuracy           = 500,
    areaOfEffect       = 64,
    burnblow           = true,
    burst              = 6,
    burstrate          = .01,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    endsmoke           = 0,
    fireStarter        = 95,
    groundbounce       = false,
    id                 = 157,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lineOfSight        = true,
    name               = [[FlameThrower]],
    noExplode          = true,
    noradar            = 1,
    range              = 400,
    reloadtime         = 0.03,
    renderType         = 5,
    smokedelay         = 1,
    soundStart         = [[flamhvy1]],
    sprayAngle         = 3000,
    startsmoke         = 0,
    tolerance          = 4500,
    turret             = true,
    unitsonly          = 1,
    weaponTimer        = 1.625,
    weaponType         = [[Flame]],
    weaponVelocity     = 300,
    damage = {
      default            = 3,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 1080,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 242,
    object             = [[tllbind_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1531,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 381,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
