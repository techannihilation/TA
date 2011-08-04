-- UNITDEF -- ARMMCV --
--------------------------------------------------------------------------------

local unitName = "armmcv"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.09,
  activateWhenBuilt  = true,
  amphibious         = 1,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.08,
  buildCostEnergy    = 184765,
  buildCostMetal     = 7851,
  builder            = false,
  buildTime          = 172624,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Command Vehicle]],
  designation        = [[ARM-MCV]],
  downloadable       = 1,
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 40,
  explodeAs          = [[ESTOR_BUILDING]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  immunetoparalyzer  = 1,
  maneuverleashlength = 640,
  mass               = 200000,
  maxDamage          = 66495,
  maxSlope           = 12,
  maxVelocity        = 1.7,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Titan]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMMCV]],
  onoffable          = true,
  ovradjust          = 1,
  radarDistance      = 2880,
  selfDestructAs     = [[NUCLEAR_Missile]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 640,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 128,
  unitname           = [[armmcv]],
  unitnumber         = 22134,
  version            = 1,
  workerTime         = 0,
  zbuffer            = 1,
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_BATSAFTX]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BATSAFTX = {
    accuracy           = 350,
    areaOfEffect       = 96,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASHSMALLUNIT]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    minbarrelangle     = -25,
    name               = [[BattleShipCannon]],
    noSelfDamage       = true,
    range              = 1300,
    reloadtime         = 1.2,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy1]],
    startsmoke         = 1,
    tolerance          = 5000,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 470,
    damage = {
      default            = 300,
      gunships           = 65,
      hgunships          = 65,
      l1bombers          = 65,
      l1fighters         = 65,
      l1subs             = 5,
      l2bombers          = 65,
      l2fighters         = 65,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 65,
      vtol               = 65,
      vtrans             = 65,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Titan Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armmcv_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Titan Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 7,
    footprintZ         = 7,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[6x6c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
