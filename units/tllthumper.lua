-- UNITDEF -- TLLTHUMPER --
--------------------------------------------------------------------------------

local unitName = "tllthumper"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.030,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.02,
  buildCostEnergy    = 5720,
  buildCostMetal     = 2480,
  builder            = false,
  buildTime          = 19280,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL TANK LEVEL3 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[standby]],
  description        = [[Very Heavy Assault Tank]],
  designation        = [[]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Char d'assaut très lourd]],
  germandescription  = [[Überschwerer Gefechtspanzer]],
  italiandescription = [[Carro armato super-pesante da attacco]],
  maneuverleashlength = 300,
  maxDamage          = 10800,
  maxSlope           = 20,
  maxVelocity        = 0.78,
  maxWaterDepth      = 25,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Thumper]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLTHUMPER]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 650,
  spanishdescription = [[Tanque súper pesado]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 200,
  unitname           = [[tllthumper]],
  unitnumber         = 834,
  version            = 3.1,
  zbuffer            = 1,
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
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_Thumper]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_Thumper = {
    areaOfEffect       = 311,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH96]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[HeavyCannon]],
    noSelfDamage       = true,
    range              = 730,
    reloadtime         = 3.4,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 313.9267578125,
    damage = {
      default            = 1000,
      gunships           = 55,
      hgunships          = 55,
      l1bombers          = 55,
      l1fighters         = 55,
      l1subs             = 5,
      l2bombers          = 55,
      l2fighters         = 55,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 55,
      vtol               = 55,
      vtrans             = 55,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 200,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TLLTHUMPER_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 80,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
