-- UNITDEF -- CCOVERTOPSCENTRE --
--------------------------------------------------------------------------------

local unitName = "ccovertopscentre"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  buildCostEnergy    = 1300000,
  buildCostMetal     = 76000,
  builder            = true,
  buildTime          = 65250.000,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[BIG BUILDING]],
  corpse             = [[dead]],
  description        = [[build T4 Con]],
  designation        = [[COC-1]],
  energyStorage      = 250,
  energyUse          = 180,
  explodeAs          = [[SHIPBLAST]],
  floater            = true,
  footprintX         = 13,
  footprintZ         = 12,
  maxDamage          = 40000,
  maxSlope           = 10,
  maxWaterDepth      = 255,
  metalStorage       = 250,
  name               = [[OPS Centre T4]],
  objectName         = [[CCovertOpsCentre]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[SHIPBLAST]],
  side               = [[CORE]],
  sightDistance      = 220,
  stealth            = true,
  unitname           = [[ccovertopscentre]],
  workerTime         = 160,
  yardMap            = [[OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO OCCCCCCCCCCCO]],
  buildoptions = {
    [[cbuilderlvl3]],
  },
  sounds = {
    build              = [[hoverok21]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[intro]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[corplant1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[OPS CORE Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 12,
    footprintZ         = 12,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CCovertOpsCentre_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
