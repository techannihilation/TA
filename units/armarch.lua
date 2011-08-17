-- UNITDEF -- ARMARCH --
--------------------------------------------------------------------------------

local unitName = "armarch"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 65536,
  buildCostEnergy    = 132143,
  buildCostMetal     = 3874,
  builder            = false,
  buildTime          = 42190,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM LEVEL3 WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Fast Gatling Plasma Battery]],
  designation        = [[ARM-GUARD]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[lARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  highTrajectory     = 2,
  maxDamage          = 8231,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Gatling]],
  noAutoFire         = false,
  objectName         = [[armarch]],
  radarDistance      = 0,
  selfDestructAs     = [[LARGE_BUILDING]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 450,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[armarch]],
  unitnumber         = 911,
  version            = 3.0,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:popupflare]],
    },
  },
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
      [[twrturn3]],
    },
    select = {
      [[twrturn3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMARCH_GUN]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMARCH_GUN = {
    accuracy           = 150,
    areaOfEffect       = 126,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = [[custom:popupcannon]],
    gravityaffected    = [[true]],
    minbarrelangle     = -35,
    name               = [[Rapid Cannon]],
    range              = 1750,
    reloadtime         = 0.17,
    renderType         = 4,
    rgbColor           = [[1 0.6 0.3]],
    shakeduration      = 0,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy5]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 900,
    damage = {
      commanders         = 10,
      default            = 26,
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
    description        = [[Gatling Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armarch_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Gatling Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
