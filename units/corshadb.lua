-- UNITDEF -- CORSHADB --
--------------------------------------------------------------------------------

local unitName = "corshadb"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.002,
  ai_limit           = [[limit CORSHADB 6]],
  ai_weight          = [[weight CORSHADB 2]],
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.002,
  buildCostEnergy    = 64322,
  buildCostMetal     = 9800,
  builder            = false,
  buildTime          = 92422,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Siege Assault Tank]],
  designation        = [[TABUG-SB]],
  downloadable       = 1,
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Char d'assaut de siège]],
  frenchname         = [[Shadowbane]],
  germandescription  = [[Belagerungs- Angriffspanzer]],
  germanname         = [[Shadowbane]],
  maneuverleashlength = 640,
  maxDamage          = 15000,
  maxSlope           = 22,
  maxVelocity        = 0.9,
  maxWaterDepth      = 10,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[ShadowBane]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORSHADB]],
  radarDistance      = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 273,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 150,
  unitname           = [[corshadb]],
  unitnumber         = 999888,
  upright            = true,
  version            = 1,
  workerTime         = 0,
  wter_badtargetcategory = [[VTOL]],
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
      [[krogok1]],
    },
    select = {
      [[krogsel1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[PLUTON_GUN]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [2]  = {
      def                = [[GATOR_LASER]],
      onlyTargetCategory = [[NOTAIR]],
    },
    [3]  = {
      def                = [[GATOR_LASER]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  GATOR_LASER = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.1,
    coreThickness      = 0.175,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 0,
    explosionGenerator = [[custom:SMALL_RED_BURN]],
    fireStarter        = 50,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 6,
    lineOfSight        = true,
    name               = [[Laser]],
    noSelfDamage       = true,
    range              = 240,
    reloadtime         = 0.5,
    renderType         = 0,
    rgbColor           = [[1 0 0]],
    soundHit           = [[lasrhit2]],
    soundStart         = [[lasrlit3]],
    soundTrigger       = true,
    targetMoveError    = 0.15,
    thickness          = 2,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1000,
    damage = {
      default            = 35,
      gunships           = 4,
      hgunships          = 4,
      l1bombers          = 4,
      l1fighters         = 4,
      l1subs             = 1,
      l2bombers          = 4,
      l2fighters         = 4,
      l2subs             = 1,
      l3subs             = 1,
      vradar             = 4,
      vtol               = 4,
      vtrans             = 4,
    },
  },
  PLUTON_GUN = {
    areaOfEffect       = 105,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = .885,
    explosionart       = [[plutonium]],
    explosiongaf       = [[plutonium]],
    id                 = 254,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -5,
    name               = [[Plutonium Shell]],
    noSelfDamage       = true,
    range              = 780,
    reloadtime         = 1.1,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 790,
    damage = {
      default            = 990,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  DEAD = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = 5200,
    description        = [[Shadowbane Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 600,
    metal              = 3856,
    object             = [[CORSHADB_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
