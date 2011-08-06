-- UNITDEF -- ARMMEX1 --
--------------------------------------------------------------------------------

local unitName = "armmex1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 5521,
  buildCostMetal     = 325,
  builder            = false,
  buildPic           = [[ARMMEX.DDS]],
  buildTime          = 1800,
  category           = [[ARM NOWEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[ARMMEX_DEAD]],
  description        = [[Upg Metal Extractor amphibious]],
  energyStorage      = 0,
  energyUse          = 40,
  explodeAs          = [[TINY_BUILDINGEX]],
  extractsMetal      = 0.003,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 570,
  maxSlope           = 20,
  maxVelocity        = 0,
  maxWaterDepth      = 9999,
  metalStorage       = 300,
  name               = [[Metal Extractor]],
  noAutoFire         = false,
  objectName         = [[ARMMEX]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructAs     = [[TINY_BUILDINGEX]],
  selfDestructCountdown = 1,
  side               = [[ARM]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[armmex1]],
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  sounds = {
    activate           = [[mexrun1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[mexoff1]],
    underattack        = [[warning1]],
    working            = [[mexrun1]],
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
      [[mexon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ARMMEX_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Metal Extractor Wreckage]],
    energy             = 0,
    featureDead        = [[ARMMEX_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMMEX_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMMEX_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Extractor Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
