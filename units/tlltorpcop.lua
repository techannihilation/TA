-- UNITDEF -- TLLTORPCOP --
--------------------------------------------------------------------------------

local unitName = "tlltorpcop"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.08,
  altfromsealevel    = 10,
  amphibious         = 1,
  attackrunlength    = 250,
  bmcode             = 1,
  brakeRate          = 1,
  buildCostEnergy    = 6850,
  buildCostMetal     = 395,
  builder            = false,
  buildTime          = 14850,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL LEVEL2 WEAPON TORP BOMB NOTSUB NOTSTRUCTURE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 55,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Anti Sub Copter]],
  designation        = [[TL-TCop]],
  energyMake         = 0.5,
  energyUse          = 1.2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  hoverAttack        = true,
  maneuverleashlength = 580,
  maxDamage          = 392,
  maxSlope           = 10,
  maxVelocity        = 9,
  maxWaterDepth      = 255,
  mobilestandorders  = 1,
  name               = [[Fisher]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tlltorpcop]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[tll]],
  sightDistance      = 350,
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 885,
  unitname           = [[tlltorpcop]],
  unitnumber         = 885,
  version            = 3.1,
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
      [[vtolcrmv]],
    },
    select = {
      [[vtolcrac]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[TLLAIR_TORPEDO]],
      onlyTargetCategory = [[UNDERWATER]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLLAIR_TORPEDO = {
    areaOfEffect       = 24,
    burnblow           = true,
    burst              = 3,
    burstrate          = .2,
    canattackground    = false,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    guidance           = true,
    id                 = 140,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[tlltorpedo]],
    name               = [[Torpedo Launcher]],
    propeller          = 1,
    range              = 450,
    reloadtime         = 10,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[splash]],
    soundStart         = [[bombrel]],
    sprayAngle         = 3250,
    startVelocity      = 100,
    tolerance          = 6000,
    tracks             = true,
    turnRate           = 15000,
    turret             = false,
    waterexplosionart  = [[h2oboom3]],
    waterexplosiongaf  = [[CAexp3]],
    waterWeapon        = true,
    weaponAcceleration = 15,
    weaponTimer        = 5.5,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 100,
    damage = {
      default            = 250,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
