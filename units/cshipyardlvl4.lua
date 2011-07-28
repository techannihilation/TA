-- UNITDEF -- CSHIPYARDLVL4 --
--------------------------------------------------------------------------------

local unitName = "cshipyardlvl4"

--------------------------------------------------------------------------------

local unitDef = {
  buildCostEnergy    = 94000,
  buildCostMetal     = 20000,
  builder            = true,
  buildTime          = 500000.500,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[BIG BUILDING]],
  collisionvolumeoffsets = [[0 0 -5]],
  collisionvolumescales = [[272 168 536]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  corpse             = [[dead]],
  description        = [[Build AeroShips]],
  energyStorage      = 1000,
  energyUse          = 0,
  explodeAs          = [[SUPERBLAST]],
  floater            = true,
  footprintX         = 16,
  footprintZ         = 30,
  iconType           = [[building]],
  maxDamage          = 60000.0,
  maxSlope           = 10,
  maxWaterDepth      = 255,
  metalStorage       = 600,
  name               = [[Shipyard]],
  objectName         = [[CShipyardLvl4]],
  radarDistance      = 0,
  selfDestructAs     = [[SUPERBLAST]],
  side               = [[CORE]],
  sightDistance      = 220,
  unitname           = [[cshipyardlvl4]],
  workerTime         = 240,
  yardMap            = [[OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO OCCCCCCO]],
  buildoptions = {
    [[cdevastator]],
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
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[AeroShipyard Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 13,
    footprintZ         = 30,
    height             = 30,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CShipyardLvl4_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
