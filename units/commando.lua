-- UNITDEF -- COMMANDO --
--------------------------------------------------------------------------------

local unitName = "commando"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.1,
  badTargetCategory  = [[VTOL]],
  brakeRate          = 0.15,
  buildCostEnergy    = 11040,
  buildCostMetal     = 618,
  buildDistance      = 125,
  builder            = true,
  buildPic           = [[COMMANDO.DDS]],
  buildTime          = 13178,
  canAssist          = false,
  canAttack          = true,
  canCapture         = true,
  canGuard           = false,
  canMove            = true,
  canPatrol          = false,
  canReclaim         = false,
  canRepair          = false,
  canRestore         = false,
  canstop            = 1,
  category           = [[ALL MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  defaultmissiontype = [[Standby]],
  description        = [[Stealthy Capture Kbot]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[SPYBOMBX]],
  firestandorders    = 0,
  footprintX         = 2,
  footprintZ         = 2,
  immunetoparalyzer  = 1,
  maneuverleashlength = 640,
  maxDamage          = 3000,
  maxSlope           = 20,
  maxVelocity        = 1.5,
  maxWaterDepth      = 15,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Commando]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[COMMANDO]],
  radarDistance      = 900,
  seismicSignature   = 64,
  selfDestructAs     = [[SPYBOMBX]],
  side               = [[CORE]],
  sightDistance      = 650,
  smoothAnim         = true,
  standingfireorder  = 0,
  standingmoveorder  = 1,
  stealth            = true,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turnRate           = 1016,
  unitname           = [[commando]],
  upright            = true,
  workerTime         = 2000,
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture2]],
    repair             = [[repair2]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[COMMANDOLAS]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COMMANDOLAS = {
    areaOfEffect       = 192,
    ballistic          = true,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:EMPFLASH192]],
    gravityaffected    = [[true]],
    impulseBoost       = 0,
    impulseFactor      = 0,
    intensity          = 2,
    minbarrelangle     = -35,
    name               = [[EMPBlaster]],
    noSelfDamage       = true,
    paralyzer          = true,
    paralyzeTime       = 20,
    range              = 425,
    reloadtime         = 5,
    renderType         = 4,
    rgbColor           = [[0.7 0.9 0.3]],
    size               = 1.75,
    soundHit           = [[EMGPULS1]],
    soundStart         = [[cannon1]],
    startsmoke         = 1,
    tolerance          = 1000,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 250,
    damage = {
      blackhydra         = 30,
      commanders         = 30,
      default            = 5000,
      krogoth            = 30,
      seadragon          = 30,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
