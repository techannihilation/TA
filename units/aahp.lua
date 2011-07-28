-- UNITDEF -- AAHP --
--------------------------------------------------------------------------------

local unitName = "aahp"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildCostEnergy    = 13277,
  buildCostMetal     = 3507,
  builder            = true,
  buildTime          = 34521,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM PLANT LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  collisionvolumescales = [[150 42 120]],
  collisionvolumetype = [[Box]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Builds T2 Hovercraft]],
  designation        = [[ARM-H]],
  downloadable       = 1,
  energyStorage      = 300,
  energyUse          = 50,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 10,
  footprintZ         = 8,
  frenchdescription  = [[Construit des Hovercrafts]],
  frenchname         = [[Plate-forme de constr. évoluée]],
  germandescription  = [[Baut Hovercrafts]],
  germanname         = [[Verb. Hovercraft-Plattform]],
  italiandescription = [[Costruisce Hovercraft]],
  italianname        = [[Piattaforma Hovercraft Spec.]],
  maxDamage          = 5005,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 300,
  mobilestandorders  = 1,
  name               = [[Advanced Hovercraft Platform]],
  noAutoFire         = false,
  objectName         = [[AAHP]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  side               = [[ARM]],
  sightDistance      = 220,
  spanishdescription = [[Construye hovercrafts]],
  spanishname        = [[Plataforma Av. Hovercraft]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  threed             = 1,
  unitname           = [[aahp]],
  unitnumber         = 11001,
  version            = 1.2,
  workerTime         = 400,
  yardMap            = [[ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo ooccccccoo]],
  zbuffer            = 1,
  buildoptions = {
    [[aach]],
    [[r75-v]],
    [[concealer]],
    [[armhplasma]],
    [[armvisit]],
    [[armlashover]],
    [[nsaatorph]],
    [[devastator]],
    [[armiguana]],
    [[speeder]],
    [[armtem]],
  },
  sounds = {
    build              = [[hoverok1]],
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
      [[hoversl1]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Hovercraft Plataform Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 10,
    footprintZ         = 8,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[Aahp_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Advanced Hovercraft Plataform heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 8,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[7x7a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
