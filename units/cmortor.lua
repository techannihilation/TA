-- UNITDEF -- CMORTOR --
--------------------------------------------------------------------------------

local unitName = "cmortor"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 31342,
  buildCostMetal     = 1987,
  builder            = false,
  buildTime          = 33833,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE WEAPON LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Range Mortar Cannon]],
  designation        = [[HM-SN11]],
  energyStorage      = 10,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Mortier lourd à courte portée]],
  frenchname         = [[Avalanche]],
  germandescription  = [[Schwerer Mörser mit kurzer Reichweite]],
  germanname         = [[Avalanche]],
  maxDamage          = 3611,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Avalanche]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CMORTOR]],
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 350,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[cmortor]],
  unitnumber         = 111,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak1]],
    uncloak            = [[kloak1un]],
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
      [[twractv3]],
    },
    select = {
      [[twractv3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[MORTARTILLERY]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  MORTARTILLERY = {
    areaOfEffect       = 70,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    gravityaffected    = [[true]],
    id                 = 169,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    minbarrelangle     = -35,
    name               = [[Mortar Cannon]],
    range              = 1700,
    reloadtime         = 2.1,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 550,
    damage = {
      default            = 300,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[CMortor Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[cmortor_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Cmortor Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
