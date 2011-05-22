-- UNITDEF -- TLLVIOLATOR --
--------------------------------------------------------------------------------

local unitName = "tllviolator"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.025,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.011,
  buildAngle         = 16384,
  buildCostEnergy    = 4607,
  buildCostMetal     = 921,
  builder            = false,
  buildTime          = 13522,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON TORP NOTAIR NOTSTRUCTURE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Destroyer]],
  designation        = [[TL-VIO1]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Destroyer]],
  germandescription  = [[Zerstörer]],
  italiandescription = [[Distruttore]],
  maneuverleashlength = 640,
  maxDamage          = 3201,
  maxVelocity        = 2.8,
  minWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Violator]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLVIOLATOR]],
  scale              = 0.5,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 330,
  sonarDistance      = 305,
  spanishdescription = [[Destructor]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  threed             = 1,
  turnRate           = 115,
  unitname           = [[tllviolator]],
  unitnumber         = 894,
  version            = 3.1,
  waterline          = 8,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_ROY]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_ROY = {
    areaOfEffect       = 32,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH3]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    minbarrelangle     = -25,
    name               = [[HeavyCannon]],
    noSelfDamage       = true,
    range              = 600,
    reloadtime         = 1.4,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannon3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 300,
    damage = {
      default            = 160,
      gunships           = 41,
      hgunships          = 41,
      l1bombers          = 41,
      l1fighters         = 41,
      l1subs             = 5,
      l2bombers          = 41,
      l2fighters         = 41,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 41,
      vtol               = 41,
      vtrans             = 41,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 2452,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 590,
    object             = [[tllviolator_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1545,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 227,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
