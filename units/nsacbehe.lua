-- UNITDEF -- NSACBEHE --
--------------------------------------------------------------------------------

local unitName = "nsacbehe"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = .03,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = .23,
  buildCostEnergy    = 15360,
  buildCostMetal     = 1691,
  builder            = false,
  buildTime          = 20531,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1998 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Very heavy assault Hovercraft]],
  designation        = [[NSA-CBEHE]],
  downloadable       = 1,
  energyMake         = 2.6,
  energyStorage      = 0,
  energyUse          = 2.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft de siège]],
  frenchname         = [[Behemoth]],
  germaname          = [[Behemoth]],
  germandescription  = [[Belagerungs Hovercraft]],
  italiandescription = [[Siege HoverCraft]],
  italianname        = [[Behemoth]],
  maneuverleashlength = 640,
  maxDamage          = 6516,
  maxSlope           = 16,
  maxVelocity        = 1.65,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestanorders   = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Behegoli]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[NSACBEHE]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 680,
  smoothAnim         = true,
  spanishdescription = [[Siege HoverCraft]],
  spanishname        = [[Behemoth]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 169,
  unitname           = [[nsacbehe]],
  unitnumber         = 1408,
  version            = 1.0,
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
      [[hovlgok2]],
    },
    select = {
      [[hovlgsl2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[COR_BEHEGOLI]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COR_BEHEGOLI = {
    areaOfEffect       = 292,
    ballistic          = true,
    canatackground     = 1,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH96]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[HeavyCannon]],
    noSelfDamage       = true,
    range              = 600,
    reloadtime         = 3,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 310,
    damage = {
      default            = 840,
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
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Behegoli Wreckage]],
    featureDead        = [[heap]],
    featurereclaimate  = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 60,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[nsacbehe_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Behegoli Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
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
