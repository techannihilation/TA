-- UNITDEF -- HELEPOLIS --
--------------------------------------------------------------------------------

local unitName = "helepolis"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.2,
  bmcode             = 1,
  brakeRate          = 1.0,
  buildCostEnergy    = 100000,
  buildCostMetal     = 12000,
  builder            = false,
  buildPic           = [[helepolis.DDS]],
  buildTime          = 68000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = false,
  category           = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[43 28 43]],
  collisionvolumetest = 0,
  collisionvolumetype = [[box]],
  corpse             = [[core_Juggernaught_dead]],
  defaultmissiontype = [[Standby]],
  description        = [[- Mini Mobile Fortress]],
  designation        = [[KG-EHL]],
  downloadable       = 1,
  energyMake         = 2.8,
  energyStorage      = 500,
  energyUse          = 2.8,
  explodeAs          = [[NUCLEAR_MISSILE2]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  healtime           = 30,
  maneuverleashlength = 640,
  maxDamage          = 50000,
  maxSlope           = 14,
  maxVelocity        = 0.75,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[VKBOT5]],
  name               = [[helepolis]],
  noAutoFire         = false,
  noChaseCategory    = [[SUB VTOL]],
  objectName         = [[helepolis.3do]],
  pieceTrailCEGRange = 4,
  pieceTrailCEGTag   = [[Debree]],
  radarDistance      = 0,
  selfDestructAs     = [[CRBLMSSL1]],
  shootme            = 1,
  side               = [[Core]],
  sightDistance      = 580,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 600,
  unitname           = [[helepolis]],
  unitnumber         = 269,
  upright            = false,
  version            = 1.2,
  workerTime         = 0,
  zbuffer            = 1,
  customparams = {
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:greenflare]],
      [[custom:unitfire]],
    },
  },
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
      [[kbcormov]],
    },
    select = {
      [[kbcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORE_JUGGINGCAN]],
    },
    [2]  = {
      def                = [[Core_GaatMOBILELaserJUG]],
    },
    [3]  = {
      def                = [[Core_GaatMOBILELaserJUG]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_JUGGINGCAN = {
    alphaDecay         = -0.01,
    areaOfEffect       = 48,
    avoidFeature       = false,
    avoidFriendly      = false,
    ballistic          = true,
    cegTag             = [[MAVWICK]],
    collideFriendly    = false,
    explosionGenerator = [[custom:KBOTROCKETHIT]],
    gravityaffected    = [[true]],
    id                 = 46,
    minbarrelangle     = -55,
    name               = [[Plasma Cannon]],
    noGap              = true,
    range              = 1050,
    reloadtime         = 3.00,
    renderType         = 4,
    rgbColor           = [[0.9 0.66 0.3]],
    separation         = 0.5,
    size               = 1.15,
    sizeDecay          = -0.2,
    soundHit           = [[xplomed3]],
    soundStart         = [[cannon1]],
    stages             = 10,
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 512,
    damage = {
      default            = 575,
      subs               = 5,
    },
  },
  Core_GaatMOBILELaserJUG = {
    areaOfEffect       = 64,
    avoidFeature       = false,
    avoidFriendly      = false,
    burnblow           = true,
    cegTag             = [[CoreBlueLaser]],
    collideFriendly    = false,
    energypershot      = 100,
    explosionGenerator = [[custom:BlueLaserBigHit]],
    fireStarter        = 75,
    guidance           = true,
    id                 = 111,
    lineOfSight        = true,
    name               = [[Commander - Laser Cannon]],
    range              = 570,
    reloadtime         = 1,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[LasrHit1]],
    soundStart         = [[LasrHvy3]],
    soundwater         = [[Splosh_Small]],
    tolerance          = 1000,
    tracks             = true,
    turnRate           = 1000,
    turret             = true,
    weaponTimer        = 1,
    weaponType         = [[Cannon]],
    weaponVelocity     = 800,
    damage = {
      default            = 580,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
