-- UNITDEF -- CORACSUB --
--------------------------------------------------------------------------------

local unitName = "coracsub"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.035,
  bmcode             = 1,
  brakeRate          = 0.212,
  buildCostEnergy    = 37911,
  buildCostMetal     = 3190,
  buildDistance      = 300,
  builder            = true,
  buildPic           = [[CORACSUB.DDS]],
  buildTime          = 57228,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL UNDERWATER MOBILE NOTLAND NOWEAPON NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[33 13 83]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  corpse             = [[1_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Tech Level 2]],
  energyMake         = 30,
  energyStorage      = 150,
  energyUse          = 30,
  explodeAs          = [[SMALL_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[sea]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 3700,
  maxVelocity        = 2.07,
  metalMake          = 0.3,
  metalStorage       = 150,
  minWaterDepth      = 20,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT3]],
  name               = [[Advanced Construction Sub]],
  noAutoFire         = false,
  objectName         = [[CORACSUB]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  side               = [[core]],
  sightDistance      = 156,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 900,
  turnRate           = 364,
  unitname           = [[coracsub]],
  waterline          = 30,
  workerTime         = 1300,
  buildoptions = {
    [[coruwfus]],
    [[crnns]],
    [[coruwmme]],
    [[coruwmmm]],
    [[coruwadves]],
    [[coruwadvms]],
    [[corfatf]],
    [[corplat]],
    [[corasy]],
    [[csubpen]],
    [[corason]],
    [[corenaa]],
    [[coratl]],
    [[corflshd]],
    [[coresy]],
    [[corech18]],
  },
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
    repair             = [[repair1]],
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
      [[sucormov]],
    },
    select = {
      [[sucorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  ["1_DEAD"] = {
    blocking           = false,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Advanced Construction Sub Wreckage]],
    energy             = 0,
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORACSUB_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
