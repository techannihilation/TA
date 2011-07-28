-- UNITDEF -- CBRUTUS --
--------------------------------------------------------------------------------

local unitName = "cbrutus"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.019,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.018,
  buildCostEnergy    = 10960,
  buildCostMetal     = 570,
  builder            = false,
  buildTime          = 18456,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Rocket Battle Tank]],
  designation        = [[CORE_Brutus]],
  energyMake         = 12,
  energyStorage      = 0,
  energyUse          = 5,
  explodeAs          = [[BIG_UNIT]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Char de combat lourd]],
  frenchname         = [[M1735 Brutus]],
  germandescription  = [[Schwerer Kampfpanzer]],
  germanname         = [[M1735 Brutus]],
  maneuverleashlength = 640,
  maxDamage          = 1950,
  maxSlope           = 15,
  maxVelocity        = 1.4,
  maxWaterDepth      = 30,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Brutus]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CBRUTUS]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 600,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 343,
  unitname           = [[cbrutus]],
  unitnumber         = 8887656747,
  version            = 1,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORVIPE_LASER]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORVIPE_LASER = {
    areaOfEffect       = 32,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 80,
    flightTime         = 1.2,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[shipmissile]],
    name               = [[HeavyRockets]],
    noSelfDamage       = true,
    range              = 650,
    reloadtime         = 1.6,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[rockhvy3]],
    startVelocity      = 550,
    targetMoveError    = 0.2,
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 2500,
    turret             = true,
    weaponTimer        = 1.2,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 550,
    damage = {
      commanders         = 380,
      default            = 195,
      gunships           = 26,
      hgunships          = 26,
      l1bombers          = 26,
      l1fighters         = 26,
      l1subs             = 5,
      l2bombers          = 26,
      l2fighters         = 26,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 26,
      vtol               = 26,
      vtrans             = 26,
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
    description        = [[Daemon Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CBRUTUS_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Daemon Heap]],
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
