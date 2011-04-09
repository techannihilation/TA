-- UNITDEF -- CORHURC --
--------------------------------------------------------------------------------

local unitName = "corhurc"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.06,
  altfromsealevel    = 1,
  attackrunlength    = 300,
  badTargetCategory  = [[MOBILE]],
  bmcode             = 1,
  brakeRate          = 0.625,
  buildCostEnergy    = 14365,
  buildCostMetal     = 313,
  builder            = false,
  buildPic           = [[CORHURC.DDS]],
  buildTime          = 34461,
  canAttack          = true,
  canFly             = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[CORE VTOL MOBILE WEAPON NOTSUB NOTSHIP ANTIEMG ANTIGATOR ANTILASER ANTIFLAME LEVEL2 NOTLAND ALL]],
  collide            = false,
  cruiseAlt          = 220,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Heavy Strategic Bomber]],
  energyMake         = 0.6,
  energyStorage      = 0,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[air]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 1380,
  maxDamage          = 1371,
  maxSlope           = 10,
  maxVelocity        = 9.03,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Hurricane]],
  noAutoFire         = true,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORHURC]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 221,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  turnRate           = 220,
  unitname           = [[corhurc]],
  workerTime         = 0,
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
      badTargetCategory  = [[MOBILE]],
      def                = [[CORADVBOMB]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORADVBOMB = {
    areaOfEffect       = 220,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    dropped            = true,
    edgeEffectiveness  = 0.7,
    explosionGenerator = [[custom:CORE_BIGBOMB_EXPLOSION]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    model              = [[bomb]],
    name               = [[AdvancedBombs]],
    noSelfDamage       = true,
    range              = 1280,
    reloadtime         = 0.14,
    renderType         = 6,
    soundHit           = [[xplomed2]],
    soundStart         = [[bombrel]],
    weaponType         = [[AircraftBomb]],
    damage = {
      antibomber         = 120,
      default            = 287,
      l1bombers          = 5,
      l1subs             = 5,
      l2bombers          = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
