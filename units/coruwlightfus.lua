-- UNITDEF -- CORUWLIGHTFUS --
--------------------------------------------------------------------------------

local unitName = "coruwlightfus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 16000,
  buildCostMetal     = 2550,
  builder            = false,
  buildPic           = [[CORUWLIGHTFUS.DDS]],
  buildTime          = 56000,
  category = [[ALL NOTDEFENSE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL NOTWEAPON]],
  corpse             = [[DEAD]],
  description        = [[Produces Energy / Storage]],
  energyMake         = 640,
  energyStorage      = 1280,
  explodeAs          = [[CRAWL_BLASTSML]],
  footprintX         = 5,
  footprintZ         = 4,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 2750,
  maxSlope           = 16,
  maxVelocity        = 0,
  metalStorage       = 0,
  minWaterDepth      = 25,
  name               = [[Underwater Light Fusion Plant]],
  noAutoFire         = false,
  objectName         = [[CORUWLIGHTFUS]],
  seismicSignature   = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  side               = [[CORE]],
  sightDistance      = 143,
  smoothAnim         = true,
  turnRate           = 0,
  unitname           = [[coruwlightfus]],
  workerTime         = 0,
  yardMap            = [[ooooooooooooooooooooooooo]],
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
      [[watfusn2]],
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
    footprintX         = 5,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 650,
    object             = [[CORUWLIGHTFUS_dead]],
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 260,
    object             = [[4x4d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
