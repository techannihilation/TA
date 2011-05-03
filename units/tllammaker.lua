-- UNITDEF -- TLLAMMAKER --
--------------------------------------------------------------------------------

local unitName = "tllammaker"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = false,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 18803,
  buildCostMetal     = 161,
  builder            = false,
  buildTime          = 46820,
  category           = [[TLL METAL LEVEL2 NOWEAPON NOTAIR NOTSUB  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = .7,
  description        = [[Converts Energy into Metal]],
  designation        = [[TL-AMMK]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 700,
  explodeAs          = [[ATOMIC_BLAST]],
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Convertisseur d'énergie en métal avançée]],
  frenchname         = [[Métallo avançé]],
  germandescription  = [[Metallgewinnung]],
  germanname         = [[Moho-Metallschmelze]],
  iconType           = [[building]],
  italiandescription = [[Complesso per la creazione di metalli]],
  italianname        = [[Crea-Metalli Moho]],
  makesMetal         = 12,
  maxDamage          = 480,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Moho Metal Maker]],
  noAutoFire         = false,
  objectName         = [[tllammaker]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Complejo de producción de metal]],
  spanishname        = [[Productor de Metal Moho]],
  TEDClass           = [[METAL]],
  threed             = 1,
  unitname           = [[tllammaker]],
  unitnumber         = 847,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[oooo oooo oooo oooo]],
  zbuffer            = 1,
  sounds = {
    activate           = [[metlon1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[metloff1]],
    underattack        = [[warning1]],
    working            = [[metlrun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[metlon1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 345,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 102,
    metal              = 104,
    object             = [[tllammaker_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 134,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 41,
    object             = [[4x4f]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
