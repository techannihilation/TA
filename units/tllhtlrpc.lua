-- UNITDEF -- TLLHTLRPC --
--------------------------------------------------------------------------------

local unitName = "tllhtlrpc"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 1700,
  buildCostEnergy    = 29850,
  buildCostMetal     = 3840,
  builder            = false,
  buildTime          = 53485,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL LEVEL3 STRATEGIC WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Plasma Deflector]],
  designation        = [[TL-EXT]],
  energyMake         = 0,
  energyStorage      = 1800,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Commande le Canon Orbital]],
  maxDamage          = 3800,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Reeper]],
  noAutoFire         = true,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLHTLRPC]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 240,
  standingfireorder  = 0,
  TEDClass           = [[FORT]],
  threed             = 1,
  unitname           = [[tllhtlrpc]],
  unitnumber         = 940,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo ooooooo ]],
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
      [[servroc1]],
    },
    select = {
      [[servroc1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[REPULSOR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  REPULSOR = {
    isShield           = true,
    name               = [[PlasmaRepulsor]],
    range              = 400,
    shieldAlpha        = 0.35,
    shieldBadColor     = [[1 0.2 0.2]],
    shieldEnergyUse    = 600,
    shieldForce        = 7,
    shieldGoodColor    = [[0.2 1 0.2]],
    shieldInterceptType = 1,
    shieldMaxSpeed     = 3500,
    shieldPower        = 7500,
    shieldPowerRegen   = 150,
    shieldPowerRegenEnergy = 562.5,
    shieldRadius       = 400,
    shieldRepulser     = true,
    smartShield        = true,
    visibleShield      = true,
    visibleShieldHitFrames = 70,
    visibleShieldRepulse = true,
    weaponType         = [[Shield]],
    damage = {
      default            = 100,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 1884,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 12,
    hitdensity         = 100,
    metal              = 2442,
    object             = [[tllhtlrpc_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1121,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    hitdensity         = 4,
    metal              = 937,
    object             = [[5x5d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
