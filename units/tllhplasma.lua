-- UNITDEF -- TLLHPLASMA --
--------------------------------------------------------------------------------

local unitName = "tllhplasma"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.075,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.1,
  buildCostEnergy    = 5150,
  buildCostMetal     = 535,
  builder            = false,
  buildTime          = 10987,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Hover plasma tank]],
  designation        = [[TLL-PTK]],
  downloadable       = 1,
  energyMake         = 2.7,
  energyStorage      = 0,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hover-tank]],
  germandescription  = [[Schwebepanzer]],
  italiandescription = [[Hovercraft armato]],
  maneuverleashlength = 640,
  maxDamage          = 1955,
  maxSlope           = 12,
  maxVelocity        = 2.3,
  maxWaterDepth      = 100,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Rimpler]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLhplasma]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 280,
  spanishdescription = [[Tanque aerodeslizador]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 280,
  unitname           = [[tllhplasma]],
  unitnumber         = 17404,
  version            = 1.2,
  workerTime         = 0,
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
      [[hovmdok1]],
    },
    select = {
      [[hovmdsl1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_BULL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BULL = {
    areaOfEffect       = 140,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH72]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[PlasmaCannon]],
    noSelfDamage       = true,
    range              = 460,
    reloadtime         = 1.12,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannon3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 300,
    damage = {
      default            = 240,
      gunships           = 30,
      hgunships          = 30,
      l1bombers          = 30,
      l1fighters         = 30,
      l1subs             = 5,
      l2bombers          = 30,
      l2fighters         = 30,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 30,
      vtol               = 30,
      vtrans             = 30,
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhplasma_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 80,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
