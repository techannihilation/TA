-- UNITDEF -- TLLVISITOR --
--------------------------------------------------------------------------------

local unitName = "tllvisitor"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.012,
  badTargetCategory  = [[UNDERWATER]],
  bmcode             = 1,
  brakeRate          = 0.02,
  buildCostEnergy    = 8054,
  buildCostMetal     = 2485,
  builder            = false,
  buildTime          = 22754,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.5,
  defaultmissiontype = [[Standby]],
  description        = [[Missile Ship]],
  designation        = [[]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 6,
  footprintZ         = 6,
  frenchdescription  = [[Navire lance-missiles]],
  germandescription  = [[Raketenkreuzer]],
  italiandescription = [[Nave lanciamissili]],
  maneuverleashlength = 640,
  maxDamage          = 1310,
  maxVelocity        = 0.95,
  minWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[DBOAT6]],
  name               = [[Visitor]],
  noAutoFire         = false,
  noChaseCategory    = [[UNDERWATER]],
  objectName         = [[TLLVISITOR]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 245,
  spanishdescription = [[Buque Lanzamisiles]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  TEDClass           = [[SHIP]],
  threed             = 1,
  turnRate           = 142,
  unitname           = [[tllvisitor]],
  unitnumber         = 901,
  version            = 3.1,
  waterline          = 6,
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
      [[sharmmov]],
    },
    select = {
      [[sharmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTSTRUCTURE]],
      def                = [[VISITOR_VPULSE]],
      onlyTargetCategory = [[NOTAIR]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  VISITOR_VPULSE = {
    areaOfEffect       = 126,
    explosionart       = [[lrptexplo]],
    explosiongaf       = [[lrptexplo]],
    fireStarter        = 100,
    flightTime         = 10,
    guidance           = true,
    id                 = 242,
    lavaexplosionart   = [[lavasplashlg]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[vpulse]],
    name               = [[Vpulse2]],
    noautorange        = 1,
    range              = 1300,
    reloadtime         = 5.5,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .5,
    smokeTrail         = true,
    soundHit           = [[vpulsehit]],
    soundStart         = [[vpulsefire]],
    startsmoke         = 1,
    tolerance          = 4000,
    turnRate           = 24384,
    twoPhase           = true,
    vlaunch            = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 40,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 400,
    damage = {
      default            = 250,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 785,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 20,
    hitdensity         = 100,
    metal              = 1585,
    object             = [[tllvisitor_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 401,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 6,
    footprintZ         = 6,
    height             = 4,
    hitdensity         = 100,
    metal              = 609,
    object             = [[4x4c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
