-- UNITDEF -- CSLICER --
--------------------------------------------------------------------------------

local unitName = "cslicer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  ai_limit           = [[limit cslicer 5]],
  ai_weight          = [[weight cslicer 5]],
  bmcode             = 1,
  brakeRate          = 0.19,
  buildCostEnergy    = 2567,
  buildCostMetal     = 190,
  builder            = false,
  buildTime          = 2017,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTAIR]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Fast Assault Tank]],
  designation        = [[TB-LG]],
  downloadable       = 1,
  energyMake         = 0.3,
  energyStorage      = 0,
  energyUse          = 0.3,
  explodeAs          = [[SMALL_UNIT]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Char d'assaut rapide]],
  frenchname         = [[Slicer]],
  germandescription  = [[Schneller Gefechtspanzer]],
  germanname         = [[Slicer]],
  maneuverleashlength = 640,
  maxDamage          = 1300,
  maxSlope           = 17,
  maxVelocity        = 2.5,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Slicer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CSLICER]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 320,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 220,
  unitname           = [[cslicer]],
  unitnumber         = 905,
  version            = 1.2,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[EMG5]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  EMG5 = {
    areaOfEffect       = 8,
    burst              = 3,
    burstrate          = .1,
    color              = 2,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    id                 = 16,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[plasma11]],
    name               = [[E.M.G.]],
    range              = 180,
    reloadtime         = .4,
    renderType         = 4,
    soundHit           = [[lasrhit1]],
    soundStart         = [[armsml2]],
    soundTrigger       = true,
    sprayAngle         = 1024,
    startsmoke         = 1,
    tolerance          = 6000,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponTimer        = 1,
    weaponType         = [[EmgCannon]],
    weaponVelocity     = 300,
    damage = {
      default            = 18,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[core_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Slicer Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[cslicer_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Slicer Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
