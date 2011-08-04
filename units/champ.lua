-- UNITDEF -- CHAMP --
--------------------------------------------------------------------------------

local unitName = "champ"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.011,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.026,
  buildCostEnergy    = 22955,
  buildCostMetal     = 2126,
  builder            = false,
  buildTime          = 26678,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Very Heavy Gauss Tank]],
  designation        = [[warpacer@aol.com]],
  downloadable       = 1,
  energyMake         = 5.5,
  energyStorage      = 0,
  energyUse          = 1.0,
  explodeAs          = [[BIG_UNIT]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Char Gauss très lourd]],
  frenchname         = [[Champion]],
  germandescription  = [[Überschwerer Gausspanzer]],
  germanname         = [[Champion]],
  hideDamage         = false,
  immunetoparalyzer  = 1,
  maneuverleashlength = 1200,
  maxDamage          = 22245,
  maxSlope           = 18,
  maxVelocity        = 1,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[htank4]],
  name               = [[Champion]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[champ]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNITEX]],
  shootme            = 0,
  side               = [[CORE]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 244,
  unitname           = [[champ]],
  unitnumber         = 623,
  upright            = false,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[champ_gauss]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  champ_gauss = {
    areaOfEffect       = 35,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 229,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    minbarrelangle     = -15,
    name               = [[Heavy-Gauss]],
    noSelfDamage       = true,
    range              = 750,
    reloadtime         = 1,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy1]],
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 450,
    damage = {
      default            = 250,
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
    description        = [[Champion Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[champ_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
