-- UNITDEF -- CORASSHIP --
--------------------------------------------------------------------------------

local unitName = "corasship"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.13,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.03,
  buildAngle         = 16384,
  buildCostEnergy    = 9112,
  buildCostMetal     = 1726,
  buildTime          = 23300,
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
  designation        = [[SEA-K]],
  downloadable       = 1,
  energyMake         = 10,
  energyStorage      = 50,
  energyUse          = 2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Exterminateur de sous-marins]],
  frenchname         = [[Spectre]],
  germandescription  = [[U-Boot Killer]],
  germanname         = [[Specter]],
  maneuverleashlength = 640,
  maxDamage          = 4160,
  maxVelocity        = 2.4,
  metalStorage       = 1,
  minWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[BOAT5]],
  name               = [[Specter]],
  noAutoFire         = false,
  noChaseCategory    = [[Vtol]],
  objectName         = [[CORASSHIP]],
  ovradjust          = 1,
  radarDistance      = 0,
  scale              = 10,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 530,
  sonarDistance      = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 244,
  unitname           = [[corasship]],
  unitnumber         = 33101,
  version            = 3.1,
  waterline          = 2,
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
    [2]  = {
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
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Specter Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORASSHIP_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
