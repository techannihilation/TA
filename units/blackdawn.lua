-- UNITDEF -- BLACKDAWN --
--------------------------------------------------------------------------------

local unitName = "blackdawn"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1121,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 2.11,
  buildCostEnergy    = 8276,
  buildCostMetal     = 3289,
  builder            = false,
  buildPic           = [[blackdawn.pcx]],
  buildTime          = 18657,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL]],
  collide            = false,
  cruiseAlt          = 55,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Advanced Gunship [Anti T3/T4]],
  designation        = [[A1-AA-VTOL]],
  downloadable       = 1,
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.9,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Black Dawn, Advanced Sabot VTOL]],
  frenchname         = [[Black Dawn]],
  germandescription  = [[Black Dawn, Advanced Sabot VTOL]],
  germanname         = [[Black Dawn]],
  hoverAttack        = true,
  italiandescription = [[Black Dawn, Advanced Sabot VTOL]],
  italianname        = [[Black Dawn]],
  maneuverleashlength = 2350,
  maxDamage          = 6092,
  maxSlope           = 10,
  maxVelocity        = 4.7823,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[BlackDawn]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[BLACKDAWN]],
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 480,
  spanishdescription = [[Amanecer Negro, VTOL Avanzado de armamento Sabot]],
  spanishname        = [[Amanecer negro]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 590,
  unitname           = [[blackdawn]],
  unitnumber         = 8387,
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
      badTargetCategory  = [[VTOL]],
      def                = [[Vtol_Sabot5]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  Vtol_Sabot5 = {
    areaOfEffect       = 130,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2nd]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 221,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[Sabot5]],
    name               = [[Sabot rocket]],
    noSelfDamage       = true,
    range              = 510,
    reloadtime         = 1.25,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[SabotHit]],
    soundStart         = [[SabotFire]],
    startsmoke         = 1,
    startVelocity      = 700,
    targetMoveError    = 0.2,
    tolerance          = 14000,
    tracks             = true,
    turnRate           = 6000,
    weaponAcceleration = 300,
    weaponTimer        = 3,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 1000,
    damage = {
      commanders         = 0.1,
      default            = 0.1,
      t3mechs            = 1100,
      t4mechs            = 1600,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
