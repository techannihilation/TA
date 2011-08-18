-- UNITDEF -- TLLLFT --
--------------------------------------------------------------------------------

local unitName = "tlllft"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 0,
  buildAngle         = 32768,
  buildCostEnergy    = 2846,
  buildCostMetal     = 262,
  builder            = false,
  buildTime          = 5846,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL WEAPON LEVEL1 NOTAIR NOTSUB ]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[22 84 22]],
  collisionvolumetype = [[box]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Light Flame Tower]],
  designation        = [[]],
  energyStorage      = 100,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maxDamage          = 1850,
  maxSlope           = 14,
  maxWaterDepth      = 0,
  name               = [[L.F.T.]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLLFT]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 422,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlllft]],
  unitnumber         = 808,
  version            = 1,
  yardMap            = [[oooo]],
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
      [[servmed2]],
    },
    select = {
      [[servmed2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_FLAME]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_FLAME = {
    accuracy           = 500,
    areaOfEffect       = 64,
    burnblow           = true,
    burst              = 6,
    burstrate          = .02,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    endsmoke           = 0,
    fireStarter        = 95,
    flameGfxTime       = 1.9,
    groundbounce       = false,
    id                 = 157,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lineOfSight        = true,
    name               = [[FlameThrower]],
    noExplode          = true,
    noradar            = 1,
    range              = 450,
    reloadtime         = 0.03,
    renderType         = 5,
    rgbColor           = [[1 0.95 0.9]],
    rgbColor2          = [[0.9 0.85 0.8]],
    sizeGrowth         = 0.7,
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
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlllft_dead]],
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
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
