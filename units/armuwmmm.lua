-- UNITDEF -- ARMUWMMM --
--------------------------------------------------------------------------------

local unitName = "armuwmmm"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 34077,
  buildCostMetal     = 780,
  builder            = false,
  buildPic           = [[ARMUWMMM.DDS]],
  buildTime          = 48964,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  damageModifier     = 0.3,
  description        = [[Converts Energy to Metal]],
  energyStorage      = 0,
  energyUse          = 600,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 5,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  makesMetal         = 16,
  maxDamage          = 1100,
  maxSlope           = 16,
  maxVelocity        = 0,
  metalStorage       = 0,
  minWaterDepth      = 15,
  name               = [[Underwater Moho Metal Maker]],
  noAutoFire         = false,
  objectName         = [[ARMUWMMM]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[ARM]],
  sightDistance      = 156,
  smoothAnim         = true,
  TEDClass           = [[METAL]],
  turnRate           = 0,
  unitname           = [[armuwmmm]],
  workerTime         = 0,
  yardMap            = [[oooooooooooooooooooo]],
  sounds = {
    activate           = [[metlon1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff1]],
    underattack        = [[warning1]],
    working            = [[metlrun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 240,
    description        = [[Underwater Moho Metal Maker Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 500,
    object             = [[ARMUWMMM_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 120,
    description        = [[Underwater Moho Metal Maker Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 193,
    object             = [[4X4C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
