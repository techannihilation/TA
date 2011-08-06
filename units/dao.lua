-- UNITDEF -- DAO --
--------------------------------------------------------------------------------

local unitName = "dao"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.031,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.007629395,
  buildCostEnergy    = 2848,
  buildCostMetal     = 373,
  builder            = false,
  buildTime          = 4530,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Laser Tank]],
  designation        = [[RaT-Dao]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Char à laser moyen]],
  frenchname         = [[Dao]],
  germandescription  = [[Mittlerer Laserpanzer]],
  germanname         = [[Dao]],
  maneuverleashlength = 640,
  maxDamage          = 2443,
  maxSlope           = 12,
  maxVelocity        = 2.5,
  maxWaterDepth      = 100,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Dao]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[dao]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 340,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[dao]],
  unitnumber         = 176,
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
      def                = [[GATOR_LASERX1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GATOR_LASERX1 = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.1,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = [[custom:FLASH1red]],
    fireStarter        = 50,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 6,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 290,
    reloadtime         = 0.67,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrlit3]],
    soundTrigger       = true,
    targetMoveError    = 0.15,
    thickness          = 2.5,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1000,
    damage = {
      default            = 95,
      gunships           = 9,
      hgunships          = 9,
      l1bombers          = 9,
      l1fighters         = 9,
      l1subs             = 5,
      l2bombers          = 9,
      l2fighters         = 9,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 9,
      vtol               = 9,
      vtrans             = 12,
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
    description        = [[Dao Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[dao_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Dao Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
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
