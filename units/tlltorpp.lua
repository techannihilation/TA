-- UNITDEF -- TLLTORPP --
--------------------------------------------------------------------------------

local unitName = "tlltorpp"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.25,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 6.5,
  buildCostEnergy    = 1858,
  buildCostMetal     = 594,
  builder            = false,
  buildTime          = 15227,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL VTOL CTRL_V LEVEL2 WEAPON TORP  NOTSUB CTRL_W CTRL_P]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 150,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Torpedo Bomber]],
  designation        = [[TL-TP]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Bombardier-torpilleur]],
  germandescription  = [[Torpedo-Bomber]],
  italiandescription = [[Bombardiere lancia-torpedini]],
  maneuverleashlength = 1280,
  maxDamage          = 2381,
  maxSlope           = 10,
  maxVelocity        = 9.65,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Trawler]],
  noAutoFire         = false,
  objectName         = [[TLLTORPP]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Bombardero torpedero]],
  standingfireorder  = 0,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 590,
  unitname           = [[tlltorpp]],
  unitnumber         = 929,
  version            = 3.1,
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
      [[vtolcrmv]],
    },
    select = {
      [[vtolcrac]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[ARMAIR_TORPEDO]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMAIR_TORPEDO = {
    areaOfEffect       = 16,
    avoidFriendly      = false,
    burnblow           = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    guidance           = true,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[torpedo]],
    name               = [[TorpedoLauncher]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 500,
    reloadtime         = 8,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep2]],
    soundStart         = [[bombrel]],
    startVelocity      = 100,
    tolerance          = 6000,
    tracks             = true,
    turnRate           = 15000,
    turret             = false,
    waterWeapon        = true,
    weaponAcceleration = 15,
    weaponTimer        = 5,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 100,
    damage = {
      default            = 1500,
      krogoth            = 3000,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
