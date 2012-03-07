-- UNITDEF -- CORMINE7 --
--------------------------------------------------------------------------------

local unitName = "cormine7"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = false,
  bmcode             = 0,
  brakeRate          = 0,
  buildCostEnergy    = 1250,
  buildCostMetal     = 30,
  builder            = false,
  buildPic           = [[CORMINE7.png]],
  buildTime          = 125,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 0,
  category = [[ALL MINE NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  cloakCost          = 1.5,
  defaultmissiontype = [[Standby_Mine]],
  description        = [[Very Heavy Mine]],
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
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
  name               = [[Deployed Roach]],
  noAutoFire         = false,
  objectName         = [[ARMMINE6]],
  onoffable          = false,
  seismicSignature   = 0,
  selfDestructAs     = [[CRAWL_BLAST]],
  selfDestructCountdown = 0,
  side               = [[CORE]],
  sightDistance      = 83.2,
  smoothAnim         = true,
  standingfireorder  = 2,
  stealth            = true,
  TEDClass           = [[SPECIAL]],
  turnRate           = 0,
  unitname           = [[cormine7]],
  workerTime         = 0,
  yardMap            = [[o]],
  customparams = {
     RequireTech = [[Advanced T3 Unit Research Centre]],
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
      [[servsml6]],
    },
    select = {
      [[minesel1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
