-- UNITDEF -- CORMEX1 --
--------------------------------------------------------------------------------

local unitName = "cormex1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 2048,
  buildCostEnergy    = 5514,
  buildCostMetal     = 331,
  builder            = false,
  buildPic           = [[CORMEX.DDS]],
  buildTime          = 1874,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  corpse             = [[CORMEX_DEAD]],
  damageModifier     = 0.4,
  description        = [[Upg Metal Extractor amphibious]],
  energyStorage      = 0,
  energyUse          = 40,
  explodeAs          = [[SMALL_BUILDINGEX]],
  extractsMetal      = 0.003,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 675,
  maxSlope           = 20,
  maxVelocity        = 0,
  maxWaterDepth      = 9999,
  metalStorage       = 300,
  name               = [[Metal Extractor]],
  noAutoFire         = false,
  objectName         = [[CORMEX]],
  onoffable          = true,
  seismicSignature   = 0,
  selfDestructAs     = [[TINY_BUILDINGEX]],
  selfDestructCountdown = 1,
  side               = [[CORE]],
  sightDistance      = 273,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[cormex1]],
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  sounds = {
    activate           = [[mexrun2]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[mexoff2]],
    underattack        = [[warning1]],
    working            = [[mexrun2]],
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
      [[mexon2]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  CORMEX_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Metal Extractor Wreckage]],
    energy             = 0,
    featureDead        = [[CORMEX_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORMEX_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORMEX_HEAP = {
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
    object             = [[3X3E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
