-- UNITDEF -- ARMCBOMB --
--------------------------------------------------------------------------------

local unitName = "armcbomb"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.60,
  attackrunlength    = 170,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 0.35,
  buildCostEnergy    = 6537,
  buildCostMetal     = 291,
  buildTime          = 17814,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 155,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Fast bomber]],
  designation        = [[ARM-CRPT]],
  energyMake         = 5,
  energyStorage      = 0,
  energyUse          = 5,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Bombardier à haute altitude]],
  frenchname         = [[Stratos]],
  germandescription  = [[Hochfliegender Teppich Bomber]],
  germanname         = [[Stratos]],
  maneuverleashlength = 1280,
  maxDamage          = 592,
  maxSlope           = 10,
  maxVelocity        = 14.0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  moverate1          = 8,
  name               = [[Stratos]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[Armcbomb]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 450,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 390,
  unitname           = [[armcbomb]],
  unitnumber         = 120,
  upright            = true,
  version            = 1.0,
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
      [[vtolarmv]],
    },
    select = {
      [[vtolarac]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_CARPET_BOMB]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_CARPET_BOMB = {
    accuracy           = 500,
    areaOfEffect       = 190,
    avoidFeature       = false,
    burst              = 6,
    burstrate          = 0.28,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    dropped            = true,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    gravityaffected    = [[true]],
    id                 = 17,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    manualBombSettings = true,
    model              = [[bomb]],
    name               = [[Advanced Bombs]],
    noSelfDamage       = true,
    range              = 1280,
    reloadtime         = 5,
    renderType         = 6,
    soundHit           = [[xplomed2]],
    soundStart         = [[bombrel]],
    sprayAngle         = 300,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[AircraftBomb]],
    damage = {
      default            = 260,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
