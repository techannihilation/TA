-- UNITDEF -- CNANOTOWER --
--------------------------------------------------------------------------------

local unitName = "cnanotower"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2394,
  bmcode             = 1,
  brakeRate          = 0.798,
  buildCostEnergy    = 37689.060,
  buildCostMetal     = 1963.575,
  buildDistance      = 1200,
  builder            = true,
  buildTime          = 26677.685,
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
  designation        = [[C-MT1]],
  energyMake         = 10,
  energyStorage      = 200,
  energyUse          = 5,
  explodeAs          = [[LIGHTSHIPBLAST]],
  floater            = true,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Nanolateur stationnaire]],
  frenchname         = [[Tour nanolatique]],
  germandescription  = [[Station�rer Konstruktionshelfer]],
  germanname         = [[Nano Turm]],
  maneuverleashlength = 0,
  mass               = 1000000,
  maxDamage          = 2000.6,
  maxSlope           = 20,
  maxVelocity        = 0.00,
  maxWaterDepth      = 25,
  metalMake          = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  name               = [[Long Range Nanotower]],
  noAutoFire         = false,
  objectName         = [[CNanotower]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[LIGHTSHIPBLAST]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 350,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 1.33,
  unitname           = [[cnanotower]],
  version            = 3.0,
  workerTime         = 750,
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath2]],
    canceldestruct     = [[cancel2]],
    capture            = [[capture1]],
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
      [[vcormove]],
    },
    select = {
      [[vcorsel]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Core Nanotower Remains]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CNanotower_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
