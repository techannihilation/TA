-- UNITDEF -- ARMTABI --
--------------------------------------------------------------------------------

local unitName = "armtabi"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 1448222,
  buildCostMetal     = 389868,
  builder            = false,
  buildTime          = 898527,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[ARM NOTAIR NOTSUB NOTSHIP]],
  collisionSphereScale = .7,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Total Annihilation TSAR bomber (ARMS)]],
  designation        = [[ARM-LRNC]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_NUKE1]],
  firestandorders    = 1,
  firestate          = 0,
  flankingBonusDir   = [[0 1 0 ]],
  flankingBonusMax   = 1.1,
  flankingBonusMin   = .8,
  flankingBonusMode  = 3,
  footprintX         = 10,
  footprintZ         = 10,
  frenchdescription  = [[Canon à nuclear de longue portée]],
  frenchname         = [[Tabitha]],
  germandescription  = [[Langstrecken-Nuclear-Plasmakanone]],
  germanname         = [[Tabitha]],
  iconType           = [[bigstar]],
  idleAutoHeal       = 2,
  idleTime           = 2200,
  maxDamage          = 16500,
  maxSlope           = 16,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Tabitha]],
  objectName         = [[ARMTABI]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_NUKE2]],
  selfDestructCountdown = 10,
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 275,
  standingfireorder  = 2,
  TEDClass           = [[FORT]],
  threed             = 1,
  unitname           = [[armtabi]],
  unitnumber         = 16,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]],
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_TABITHACANNON]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_TABITHACANNON = {
    accuracy           = 120,
    aimrate            = 2500,
    areaOfEffect       = 4360,
    avoidFriendly      = false,
    ballistic          = true,
    collideFriendly    = false,
    comandfire         = 1,
    energypershot      = 19720000,
    explosionGenerator = [[custom:ARGHNUKE_FX1]],
    fireStarter        = 75,
    gravityaffected    = [[true]],
    holdtime           = 10,
    id                 = 125,
    metalpershot       = 160000,
    model              = [[obusnuke]],
    name               = [[Tabitha Cannon]],
    range              = 8550,
    reloadtime         = 2,
    renderType         = 4,
    soundHit           = [[bignuke]],
    soundStart         = [[xplomas2]],
    startsmoke         = 1,
    stockpile          = true,
    stockpiletime      = 400,
    tolerance          = 300,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1380,
    damage = {
      default            = 700200,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
