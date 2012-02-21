-- UNITDEF -- CORASSIS --
--------------------------------------------------------------------------------

local unitName = "corassis"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0825,
  bmcode             = 1,
  brakeRate          = 0.1375,
  buildCostEnergy    = 5028,
  buildCostMetal     = 216,
  buildDistance      = 80,
  builder            = true,
  buildPic           = [[CORASSIS.PNG]],
  buildTime          = 6193,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL CONSTR MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
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
  name               = [[Mole]],
  noAutoFire         = false,
  objectName         = [[CORASSIS]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 500,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[CNSTR]],
  trackOffset        = 6,
  trackStrength      = 5,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 31,
  turnRate           = 635,
  unitname           = [[corassis]],
  workerTime         = 150,
  buildoptions = {
		[1] = [[corsolar]],
		[2] = [[cormex]],
		[3] = [[coravp]],
		[4] = [[cornanotc]],
		[5] = [[coreyes]],
		[6] = [[corshroud]],
		[7] = [[corfort]],
		[8] = [[corarad]],
		[9] = [[cormine2]],
		[10] = [[hllt]],
		[11] = [[corvipe]],
		[12] = [[cordoom]],
		[13] = [[corboucher]],
		[14] = [[cortoast]],
		[15] = [[madsam]],
		[16] = [[corflak]],
		[17] = [[cordl]],
		[18] = [[corcv]],
		[19] = [[correap]],
		[20] = [[corgol]],
		[21] = [[corseal]],
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 1000,
    description        = [[Wreckage]],
    energy             = 0,
    featureDead        = [[HEAP]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 8,
    hitdensity         = 100,
    metal              = 78,
    object             = [[CORASSIS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 380,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 2,
    hitdensity         = 100,
    metal              = 31,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
