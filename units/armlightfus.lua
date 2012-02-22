-- UNITDEF -- ARMLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "armlightfus"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 65535,
  buildCostEnergy    = 10000,
  buildCostMetal     = 1700,
  builder            = false,
  buildPic           = [[armlightfus.png]],
  buildTime          = 22000,
  category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
  corpse             = [[DEAD]],
  description = [[Produces Energy / Storage]],
  designation        = [[Brzapp-66]],
  downloadable       = 1,
  energyMake         = 400,
  energyStorage      = 1000,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLASTSML]],
  footprintX         = 6,
  footprintZ         = 6,
  iconType           = [[building]],
  maxDamage          = 2500,
  maxSlope           = 10,
  maxWaterDepth      = 1,
  metalStorage       = 0,
  name               = [[Light Fusion Power Plant]],
  noAutoFire         = false,
  objectName         = [[armlightfus]],
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  side               = [[ARM]],
  sightDistance      = 367.5,
  threed             = 1,
  unitname           = [[armlightfus]],
  unitnumber         = 106,
  version            = 1.2,
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:ReactorSequence]],
    },
  },
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
      [[fusion1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 794,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = 585,
    object             = [[armlightfus_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 794,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = 234,
    object             = [[6x6d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
