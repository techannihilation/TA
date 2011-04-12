-- UNITDEF -- ROCKBLACK --
--------------------------------------------------------------------------------

local unitName = "rockblack"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.027,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.012,
  buildCostEnergy    = 72750,
  buildCostMetal     = 7070,
  builder            = false,
  buildTime          = 21380,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[Standby]],
  description        = [[Crusade Missile Tank]],
  designation        = [[MA-GM2]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Véhicule rocket moyen]],
  frenchname         = [[Aiglon]],
  germandescription  = [[Mittleres Raketenfahrzeug]],
  germanname         = [[Aiglon]],
  maneuverleashlength = 640,
  mass               = 200000,
  maxDamage          = 4750,
  maxSlope           = 16,
  maxVelocity        = 1.05,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[htank4]],
  name               = [[KR 270MS]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[rockblack]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 2100,
  sonarDistance      = 0,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 512,
  unitname           = [[rockblack]],
  unitnumber         = 731982,
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[anti ship missile]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ["anti ship missile"] = {
    areaOfEffect       = 524,
    burnblow           = true,
    cruisealt          = 120,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    fireStarter        = 80,
    flightTime         = 15,
    guidance           = false,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[antishipm]],
    name               = [[Antiship missile]],
    range              = 2250,
    reloadtime         = 27,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.02,
    smokeTrail         = true,
    soundHit           = [[mlrsboom]],
    soundStart         = [[mlrsfireshort]],
    soundTrigger       = true,
    startsmoke         = 1,
    startVelocity      = 150,
    tolerance          = 1000,
    tracks             = false,
    trajectoryHeight   = 2.8,
    turnRate           = 5000,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 120,
    weaponTimer        = 15,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 900,
    damage = {
      default            = 7500,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
