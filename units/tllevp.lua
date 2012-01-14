-- UNITDEF -- TLLEVP --
--------------------------------------------------------------------------------

local unitName = "tllevp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 1024,
  buildCostEnergy    = 17000,
  buildCostMetal     = 3500,
  builder            = true,
  buildTime          = 62000,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON PLANT LEVEL2]],
  corpse             = [[dead]],
  description        = [[expermental vechile plant]],
  designation        = [[none]],
  downloadable       = 1,
  energyMake         = 100,
  energyStorage      = 2500,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 12,
  footprintZ         = 8,
  maxDamage          = 3500,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalMake          = 0.5,
  metalStorage       = 250,
  mobilestandorders  = 1,
  name               = [[EVP]],
  noAutoFire         = false,
  objectName         = [[TLLEVP]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[TLL]],
  sightDistance      = 220,
  sortbias           = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllevp]],
  unitnumber         = 30007,
  version            = 3.0,
  workerTime         = 250,
  yardMap            = [[oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo oooccccccooo]],
  zbuffer            = 1,
  buildoptions = {
		[1] = [[tlltelsatnk]],
		[2] = [[tllmlrpc]],
		[3] = [[tlldemon]],
		[4] = [[tllacid]],	
		[5] = [[tlllongshot]],
		[6] = [[anvil]],


},
  sounds = {
    build              = [[pvehwork]],
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
      [[pvehactv]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 1,
    hitdensity         = 23,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[TLLEVP_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 0.3600 * unitDef.maxDamage,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 0.6400 * unitDef.buildCostMetal,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
