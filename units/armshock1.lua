-- UNITDEF -- ARMSHOCK1 --
--------------------------------------------------------------------------------

local unitName = "armshock1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.023,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.1,
  buildCostEnergy    = 44739,
  buildCostMetal     = 1620,
  builder            = false,
  buildPic           = [[ARMSHOCK.DDS]],
  buildTime          = 38218,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTSUB WEAPON NOTAIR]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Plasma Cannon]],
  explodeAs          = [[SHOCKER]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  highTrajectory     = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  immunetoparalyzer  = 1,
  maneuverleashlength = 640,
  mass               = 200000,
  maxDamage          = 8200,
  maxSlope           = 17,
  maxVelocity        = 0.7,
  maxWaterDepth      = 0,
  mobilestandorders  = 1,
  movementClass      = [[HKBOT4]],
  name               = [[Medium Vanguard]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMSHOCK1]],
  script             = [[armshock.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[SHOCKER]],
  side               = [[ARM]],
  sightDistance      = 625,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  turnRate           = 231,
  unitname           = [[armshock1]],
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOWEAPON]],
      def                = [[SHOCKER1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SHOCKER1 = {
    areaOfEffect       = 196,
    avoidFeature       = false,
    avoidFriendly      = false,
    ballistic          = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    explosionGenerator = [[custom:FLASHSMALLBUILDING]],
    gravityaffected    = [[true]],
    heightBoostFactor  = 1.15,
    impulseBoost       = 0.5,
    impulseFactor      = 0.123,
    minbarrelangle     = -35,
    name               = [[ShockerHeavyCannon]],
    noSelfDamage       = true,
    predictBoost       = 1,
    range              = 900,
    reloadtime         = 5.4,
    renderType         = 4,
    size               = 5,
    soundHit           = [[xplomed2]],
    soundStart         = [[cannhvy5]],
    targetBorder       = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 410,
    damage = {
      default            = 500,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
