-- UNITDEF -- CONSUL1 --
--------------------------------------------------------------------------------

local unitName = "consul1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0825,
  bmcode             = 1,
  brakeRate          = 0.1375,
  buildCostEnergy    = 5028,
  buildCostMetal     = 216,
  buildDistance      = 80,
  builder            = true,
  buildPic           = [[CONSUL.DDS]],
  buildTime          = 6193,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Combat Engineer]],
  energyMake         = 15,
  energyStorage      = 100,
  energyUse          = 15,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 975,
  maxSlope           = 18,
  maxVelocity        = 2.783,
  maxWaterDepth      = 18,
  metalMake          = 0.15,
  metalStorage       = 100,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Cooler]],
  noAutoFire         = false,
  objectName         = [[CONSUL1]],
  script             = [[consul.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[arm]],
  sightDistance      = 500,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 450,
  trackOffset        = 6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 31,
  turnRate           = 635,
  unitname           = [[consul1]],
  workerTime         = 150,
  buildoptions = {
    [[corsolar]],
    [[cormex]],
    [[coravp]],
    [[cornanotc]],
    [[coreyes]],
    [[corshroud]],
    [[corfort]],
    [[corarad]],
    [[cormine2]],
    [[hllt]],
    [[corvipe]],
    [[cordoom]],
    [[corboucher]],
    [[cortoast]],
    [[madsam]],
    [[corflak]],
    [[cordl]],
    [[corcv]],
    [[correap]],
    [[corgol]],
    [[corseal]],
  },
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Cooler Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CONSUL_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Cooler Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3X3A]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
