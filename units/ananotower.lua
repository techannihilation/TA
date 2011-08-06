-- UNITDEF -- ANANOTOWER --
--------------------------------------------------------------------------------

local unitName = "ananotower"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2394,
  bmcode             = 1,
  brakeRate          = 0.798,
  buildCostEnergy    = 37362.810,
  buildCostMetal     = 1904.850,
  buildDistance      = 1200,
  builder            = true,
  buildTime          = 26415.380,
  canAssist          = true,
  canGuard           = true,
  canMove            = false,
  canPatrol          = true,
  canreclamate       = 0,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL NOTSUB NOWEAPON SPECIAL NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[patrol]],
  description        = [[stationary nanolathe]],
  designation        = [[A-MT1]],
  energyMake         = 10,
  energyStorage      = 200,
  energyUse          = 5,
  explodeAs          = [[LIGHTSHIPBLAST]],
  floater            = true,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Nanolateur stationnaire]],
  frenchname         = [[Tour nanolatique]],
  germandescription  = [[Nano Turm]],
  germanname         = [[Nano Turm]],
  maneuverleashlength = 0,
  mass               = 1000000,
  maxDamage          = 2000.0,
  maxSlope           = 20,
  maxVelocity        = 0.00,
  maxWaterDepth      = 25,
  metalMake          = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Long Range Nanotower]],
  noAutoFire         = false,
  objectName         = [[ANanotower]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 350,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 1.33,
  unitname           = [[ananotower]],
  version            = 3.0,
  workerTime         = 750,
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
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
      [[varmmove]],
    },
    select = {
      [[varmsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Arm Nanotower Remains]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ANanotower_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
