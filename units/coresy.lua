-- UNITDEF -- CORESY --
--------------------------------------------------------------------------------

local unitName = "coresy"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 73053,
  buildCostMetal     = 19704,
  builder            = true,
  buildTime          = 43240,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT NOWEAPON NOTAIR NOTSUB NOTSHIP NOTLAND ALL]],
  collisionvolumescales = [[227 64 227]],
  collisionvolumetype = [[Box]],
  corpse             = [[dead]],
  description        = [[Produces Level 3 Ships, water depth 89 or more required]],
  designation        = [[COR-SCF]],
  energyStorage      = 400,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 15,
  footprintZ         = 15,
  iconType           = [[building]],
  maxDamage          = 10598,
  metalMake          = 2,
  metalStorage       = 400,
  minWaterDepth      = 89,
  mobilestandorders  = 1,
  name               = [[Capital Shipyard]],
  noAutoFire         = false,
  objectName         = [[CORESY]],
  radarDistance      = 100,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[CORE]],
  sightDistance      = 324,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  unitname           = [[coresy]],
  waterline          = 65,
  workerTime         = 400,
  yardMap            = [[wCCCCCCCCCCCCCw	cCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCccCCCCCCCCCCCCCc]],
  buildoptions = {
    [[cortyrnt]],
    [[corhcar]],
    [[uppercut]],
    [[corblackhy]],
  },
  sounds = {
    build              = [[pshpwork]],
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    unitcomplete       = [[untdone]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[pshpactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Capital Shipyard Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 6,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[7X7B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Capital Shipyard Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 15,
    footprintZ         = 15,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORESY_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
