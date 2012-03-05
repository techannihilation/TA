-- UNITDEF -- CORMINE6 --
--------------------------------------------------------------------------------

local unitName = "cormine6"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = false,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 625,
  buildCostMetal     = 20,
  builder            = false,
  buildPic           = [[CORMINE6.png]],
  buildTime          = 125,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 0,
  category = [[ALL MINE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  cloakCost          = 1.5,
  defaultmissiontype = [[Standby_Mine]],
  description        = [[Camouflaged medium-scale Nuke warhead]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[CORMINE6]],
  firestandorders    = 1,
  footprintX         = 1,
  footprintZ         = 1,
  iconType           = [[building]],
  idleAutoHeal       = 10,
  idleTime           = 300,
  initCloaked        = true,
  kamikaze           = true,
  kamikazeDistance   = 64,
  maxDamage          = 10,
  maxSlope           = 40,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  minCloakDistance   = 8,
  name               = [[Deployed Skuttle]],
  noAutoFire         = false,
  objectName         = [[CORMINE6]],
  onoffable          = false,
  seismicSignature   = 0,
  selfDestructAs     = [[CORMINE6]],
  selfDestructCountdown = 0,
  side               = [[CORE]],
  sightDistance      = 83.2,
  smoothAnim         = true,
  standingfireorder  = 2,
  stealth            = true,
  TEDClass           = [[SPECIAL]],
  turnRate           = 0,
  unitname           = [[cormine6]],
  workerTime         = 0,
  yardMap            = [[o]],
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
      [[servsml6]],
    },
    select = {
      [[minesel2]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
