-- UNITDEF -- CORGEO --
--------------------------------------------------------------------------------

local unitName = "corgeo"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 8375,
  buildCostMetal     = 1655,
  builder            = false,
  buildPic           = [[CORGEO.DDS]],
  buildTime          = 12875,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  description        = [[Produces Energy / Storage]],
  energyMake         = 800,
  energyStorage      = 1000,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2350,
  maxSlope           = 15,
  maxVelocity        = 0,
  maxWaterDepth      = 9999,
  metalStorage       = 0,
  name               = [[Geothermal Powerplant]],
  noAutoFire         = false,
  objectName         = [[CORGEO]],
  seismicSignature   = 0,
  selfDestructAs     = [[ESTOR_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[corgeo]],
  workerTime         = 0,
  yardMap            = [[oooo oGGo oGGo oooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[geothrm2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Geothermal Powerplant Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[4X4B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Geothermal Powerplant Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORGEO_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
