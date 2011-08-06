-- UNITDEF -- TLLHOVERGAUSS --
--------------------------------------------------------------------------------

local unitName = "tllhovergauss"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.075,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.1,
  buildCostEnergy    = 2793,
  buildCostMetal     = 215,
  builder            = false,
  buildTime          = 5223,
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
  description        = [[Laser Hovertank]],
  designation        = [[TLL-HG]],
  downloadable       = 1,
  energyMake         = 2.7,
  energyStorage      = 0,
  energyUse          = 2.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Laser Hover-tank]],
  germandescription  = [[Laser Schwebepanzer]],
  italiandescription = [[Laser Hovercraft armato]],
  maneuverleashlength = 640,
  maxDamage          = 875,
  maxSlope           = 16,
  maxVelocity        = 2.5,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Maggot]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLhovergauss]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 280,
  spanishdescription = [[Laser Tanque aerodeslizador]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 280,
  unitname           = [[tllhovergauss]],
  unitnumber         = 17403,
  version            = 1.2,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[hovmdof1]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[hovmdok1]],
    },
    select = {
      [[tllhoverok]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_LIGHTLASER]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LIGHTLASER = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.12,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 20,
    explosionGenerator = [[custom:SMALL_RED_BURN]],
    fireStarter        = 30,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[LightLaser]],
    noSelfDamage       = true,
    range              = 430,
    reloadtime         = 0.48,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrfir3]],
    soundTrigger       = true,
    targetMoveError    = 0.1,
    thickness          = 2.5,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 2250,
    damage = {
      commanders         = 140,
      default            = 75,
      gunships           = 3,
      hgunships          = 3,
      l1bombers          = 5,
      l1fighters         = 5,
      l1subs             = 3,
      l2bombers          = 5,
      l2fighters         = 5,
      l2subs             = 3,
      l3subs             = 3,
      vradar             = 5,
      vtol               = 5,
      vtrans             = 5,
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
    hitdensity         = 200,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllhovergauss_dead]],
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
    object             = [[3x3C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
