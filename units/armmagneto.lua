-- UNITDEF -- ARMMAGNETO --
--------------------------------------------------------------------------------

local unitName = "armmagneto"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildCostEnergy    = 40236,
  buildCostMetal     = 1980,
  builder            = false,
  buildTime          = 34000,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[ARM WEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[FerroMagnet Paralyzer]],
  designation        = [[Ferro-Magnetic Polarizor]],
  energyMake         = 8,
  energyStorage      = 500,
  energyUse          = 30,
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Paralyseur ferro-magnetique]],
  frenchname         = [[Magnetosphere]],
  germandescription  = [[Magnetischer Paralysierer]],
  germanname         = [[Magnetosphere]],
  maxDamage          = 3600,
  maxSlope           = 50,
  maxWaterDepth      = 255,
  metalStorage       = 500,
  name               = [[Magnetosphere]],
  noAutoFire         = true,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMMAGNETO]],
  onoffable          = true,
  radarDistance      = 600,
  selfDestructAs     = [[CRAWL_BLAST]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 1000,
  sonarDistance      = 500,
  standingfireorder  = 2,
  TEDClass           = [[FORT]],
  threed             = 1,
  unitname           = [[armmagneto]],
  unitnumber         = 163463878543677545,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooo ooo ooo]],
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
      def                = [[SPHERE]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SPHERE = {
    areaOfEffect       = 200,
    beamWeapon         = true,
    color              = 96,
    color2             = 98,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 1,
    energypershot      = 900,
    explosionart       = [[rock04rec]],
    explosiongaf       = [[moonrocks]],
    fireStarter        = 100,
    id                 = 221,
    impulseBoost       = 0,
    impulseFactor      = 0,
    lavaexplosionart   = [[rock04rec]],
    lavaexplosiongaf   = [[moonrocks]],
    lineOfSight        = true,
    name               = [[Ferro-Magnet]],
    noExplode          = true,
    noSelfDamage       = true,
    paralyzer          = true,
    paralyzertime      = 35,
    range              = 1400,
    reloadtime         = 14,
    renderType         = 7,
    soundHit           = [[xplomed4]],
    soundStart         = [[charge]],
    turret             = true,
    waterexplosionart  = [[rock04rec]],
    waterexplosiongaf  = [[moonrocks]],
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 850,
    damage = {
      commanders         = 200,
      default            = 9999,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
