-- UNITDEF -- CORBOUCHER --
--------------------------------------------------------------------------------

local unitName = "corboucher"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 120687,
  buildCostMetal     = 21746,
  builder            = false,
  buildTime          = 231000,
  canAttack          = true,
  canstop            = 1,
  category           = [[CORE LEVEL2 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Heavy Anti T3/T4 laser cannon]],
  designation        = [[BOUCHER-GUARD]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 6,
  footprintZ         = 6,
  frenchdescription  = [[Batterie à Laser stationnaire]],
  frenchname         = [[Le Boucher]],
  germandescription  = [[Laser Batterie]],
  germanname         = [[Omega]],
  maxDamage          = 80000,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[The Bucher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[corboucher]],
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 2000,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[corboucher]],
  unitnumber         = 731989,
  version            = 3,
  workerTime         = 0,
  yardMap            = [[oooooo oooooo oooooo oooooo oooooo oooooo]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak1]],
    uncloak            = [[kloak1un]],
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
      [[twrturn3]],
    },
    select = {
      [[twrturn3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORE_BOUCHER]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_BOUCHER = {
    areaOfEffect       = 30,
    beamWeapon         = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 0.0025,
    energypershot      = 4000,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    fireStarter        = 90,
    id                 = 134,
    impactonly         = 1,
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 0.75,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    name               = [[Cartouche Aluminium]],
    noradar            = 1,
    noSelfDamage       = true,
    range              = 2000,
    reloadtime         = 5,
    renderType         = 0,
    rgbColor           = [[1 1 0]],
    soundHit           = [[xplolrg1]],
    soundStart         = [[Energy]],
    thickness          = 0.5,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[LaserCannon]],
    weaponVelocity     = 4000,
    damage = {
      commanders         = 2200,
      default            = 2500,
      t3mechs            = 32000,
      t4mechs            = 42000,
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
    description        = [[Boucher Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[corboucher_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Boucher Heap]],
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
