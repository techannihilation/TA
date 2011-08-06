-- UNITDEF -- CORDEM --
--------------------------------------------------------------------------------

local unitName = "cordem"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 156664,
  buildCostMetal     = 10489,
  builder            = false,
  buildTime          = 112143,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[KBOT WEAPON ALL NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .5,
  defaultmissiontype = [[Standby]],
  description        = [[Experimental Flame Kbot]],
  designation        = [[COR-DMN]],
  downloadable       = 1,
  energyMake         = 0.4,
  energyStorage      = 0,
  energyUse          = 0.4,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  mass               = 400000,
  maxDamage          = 58446,
  maxSlope           = 14,
  maxVelocity        = 1.7,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[hkbot4]],
  name               = [[Archdemon]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORDEM]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 300,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 590,
  unitname           = [[cordem]],
  unitnumber         = 25001,
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
      [[krogok1]],
    },
    select = {
      [[krogsel1]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[dem_weapon]],
      onlyTargetCategory = [[notair]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  dem_weapon = {
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
    range              = 500,
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
      default            = 8,
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
    description        = [[Archdemon Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[cordem_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Archdemon Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
