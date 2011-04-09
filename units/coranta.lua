-- UNITDEF -- CORANTA --
--------------------------------------------------------------------------------

local unitName = "coranta"

--------------------------------------------------------------------------------

local unitDef = {
  antiweapons        = 1,
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 32687,
  buildCostMetal     = 7642,
  builder            = false,
  buildTime          = 49030,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE LEVEL3 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  description        = [[Rapid Fire Plasma Battery]],
  designation        = [[COR-ANTA]],
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 3,
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Batterie à plasma à tir rapide]],
  frenchname         = [[Antagonizer]],
  germandescription  = [[Schnellfeuernde Plasma - Batterie]],
  germanname         = [[Antagonizer]],
  maxDamage          = 9980,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Antagonizer]],
  objectName         = [[CORANTA]],
  onlyTargetCategory = [[NOTAIR]],
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 310,
  smoothAnim         = true,
  standingfireorder  = 3,
  TEDClass           = [[SPECIAL]],
  unitname           = [[coranta]],
  unitnumber         = 20001,
  version            = 3.0,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooo]],
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[RAPID_PLASMA]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  RAPID_PLASMA = {
    accuracy           = 800,
    areaOfEffect       = 90,
    ballistic          = true,
    canatackground     = 1,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 25,
    explosionart       = [[explode2]],
    explosiongaf       = [[fx]],
    gravityaffected    = [[true]],
    id                 = 254,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    name               = [[Rapid Plasma Cannon]],
    range              = 2080,
    reloadtime         = 0.7,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy5]],
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 529.90563964844,
    damage = {
      commanders         = 600,
      default            = 780,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  corpun_heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 882,
    description        = [[Punisher Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 449,
    object             = [[4X4B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = 23682,
    description        = [[Antagonizer Wreckage]],
    featureDead        = [[corpun_heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = 6544,
    object             = [[coranta_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
