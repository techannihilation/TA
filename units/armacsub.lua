-- UNITDEF -- ARMACSUB --
--------------------------------------------------------------------------------

local unitName = "armacsub"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.038,
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 37568,
  buildCostMetal     = 3195,
  buildDistance      = 300,
  builder            = true,
  buildPic           = [[ARMACSUB.DDS]],
  buildTime          = 56565,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canreclamate       = 1,
  canstop            = 1,
  category           = [[ALL UNDERWATER NOTLAND MOBILE NOWEAPON NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[49 19 69]],
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
  maxDamage          = 3600,
  maxVelocity        = 2.3,
  metalMake          = 0.3,
  metalStorage       = 150,
  minWaterDepth      = 20,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT3]],
  name               = [[Advanced Construction Sub]],
  noAutoFire         = false,
  objectName         = [[ARMACSUB]],
  radarDistance      = 50,
  seismicSignature   = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  side               = [[arm]],
  sightDistance      = 156,
  smoothAnim         = true,
  standingmoveorder  = 1,
  steeringmode       = 1,
  terraformSpeed     = 900,
  turnRate           = 382,
  unitname           = [[armacsub]],
  waterline          = 30,
  workerTime         = 1300,
  buildoptions = {
    [[armuwfus]],
    [[armuwfus1]],
    [[armfus]],
    [[armuwmme]],
    [[armuwmmm]],
    [[armuwadvms]],
    [[armfatf]],
    [[armplat]],
    [[armsy]],
    [[armasy]],
    [[asubpen]],
    [[armason]],
    [[armfflak]],
    [[armatl]],
    [[armflosh]],
    [[armesy]],
    [[armrech18]],
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
      [[suarmmov]],
    },
    select = {
      [[suarmsel]],
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
    object             = [[ARMACSUB_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
