-- UNITDEF -- ARMBLZ --
--------------------------------------------------------------------------------

local unitName = "armblz"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  altfromsealevel    = 1,
  attackrunlength    = 180,
  badTargetCategory  = [[VTOL]],
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 4,
  buildCostEnergy    = 7245,
  buildCostMetal     = 298,
  builder            = false,
  buildTime          = 17064,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 240,
  description        = [[Napalm Bomber]],
  designation        = [[AFD-BLZ]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 1.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Bombardier Napalm]],
  germandescription  = [[Napalm Bomber]],
  maneuverleashlength = 1280,
  maxDamage          = 960,
  maxSlope           = 10,
  maxVelocity        = 8.7,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Blaze]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMBLZ]],
  radarDistance      = 0,
  scale              = 1,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[VTOL]],
  threed             = 1,
  turnRate           = 420,
  unitname           = [[armblz]],
  unitnumber         = 53,
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
      [[vtolarmv]],
    },
    select = {
      [[vtolarac]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[NAPALM]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  NAPALM = {
    accuracy           = 500,
    areaOfEffect       = 180,
    avoidFeature       = false,
    burst              = 6,
    burstrate          = 0.28,
    collideFriendly    = false,
    commandfire        = true,
    craterBoost        = 0,
    craterMult         = 0,
    dropped            = true,
    explosionart       = [[napalm]],
    explosiongaf       = [[napalm_fire]],
    fireStarter        = 100,
    gravityaffected    = [[true]],
    id                 = 254,
    manualBombSettings = true,
    model              = [[bomb]],
    name               = [[Napalm Bombs]],
    noSelfDamage       = true,
    range              = 1280,
    reloadtime         = 5,
    renderType         = 6,
    soundHit           = [[burn02]],
    soundStart         = [[bombrel]],
    sprayAngle         = 300,
    weaponType         = [[AircraftBomb]],
    damage = {
      default            = 280,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
