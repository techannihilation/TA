-- UNITDEF -- CORUPMEX --
--------------------------------------------------------------------------------

local unitName = "corupmex"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 6033,
  buildCostMetal     = 1062,
  builder            = false,
  buildTime          = 96444,
  category           = [[CORE NOWEAPON NOTAIR NOTSUB]],
  corpse             = [[dead]],
  description        = [[Enables jumps on large radius]],
  designation        = [[TAL-BME1]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[SMALL_BUILDINGEX]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[building]],
  maxDamage          = 1344,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Intelligence Jump]],
  noAutoFire         = false,
  objectName         = [[CORUPMEX]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 273,
  unitname           = [[corupmex]],
  unitnumber         = 48,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  customparams = {
    providetech        = [[Jumpjet]],
    providetechrange   = 2000,
  },
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
  HEAP = {
    blocking           = true,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Intelligence Jump Debris]],
    energy             = 100,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 714,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[3X3E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Intelligence Jump werckage]],
    energy             = 400,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 2032,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORUPMEX_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
