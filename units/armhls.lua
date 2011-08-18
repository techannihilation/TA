-- UNITDEF -- ARMHLS --
--------------------------------------------------------------------------------

local unitName = "armhls"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.016,
  buildAngle         = 16384,
  buildCostEnergy    = 5147,
  buildCostMetal     = 984,
  builder            = false,
  buildTime          = 14150,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Antiswarm Hover Cruiser]],
  designation        = [[ARMHLS]],
  energyMake         = 2,
  energyStorage      = 0,
  energyUse          = 2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Croiseur à laser lourd]],
  frenchname         = [[Century]],
  germandescription  = [[Schwere Laserkreuzer]],
  germanname         = [[Century]],
  maneuverleashlength = 640,
  maxDamage          = 2600,
  maxVelocity        = 2.8,
  metalStorage       = 0,
  minWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Century]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMHLS]],
  radarDistance      = 0,
  scale              = 0.5,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 530,
  sonarDistance      = 305,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 220,
  unitname           = [[armhls]],
  unitnumber         = 5963,
  version            = 1,
  waterline          = 1,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[ARM_LASERAHOVER]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_LASERAHOVER = {
    areaOfEffect       = 14,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 75,
    explosionGenerator = [[custom:LARGE_GREEN_LASER_BURN]],
    fireStarter        = 90,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 10,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 580,
    reloadtime         = 1.1,
    renderType         = 0,
    rgbColor           = [[0 1 0]],
    soundHit           = [[lasrhit1]],
    soundStart         = [[Lasrmas2]],
    targetMoveError    = 0.2,
    thickness          = 3,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 2250,
    damage = {
      commanders         = 60,
      default            = 112,
      gunships           = 35,
      hgunships          = 35,
      hover              = 590,
      l1bombers          = 35,
      l1fighters         = 35,
      l1subs             = 5,
      l2bombers          = 35,
      l2fighters         = 35,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 35,
      vtol               = 35,
      vtrans             = 35,
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
    description        = [[Century Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[Armhls_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
