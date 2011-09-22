-- UNITDEF -- TLLACID --
--------------------------------------------------------------------------------

local unitName = "tllacid"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.2,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.4,
  buildCostEnergy    = 5000,
  buildCostMetal     = 270,
  builder            = false,
  buildTime          = 12500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[BIO TANK LEVEL2 WEAPON NOTAIR NOTSUB ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Long Range Vertical Missile Vehicle]],
  energyMake         = 1,
  energyStorage      = 500,
  energyUse          = 20,
  explodeAs          = [[MEDIUM_UNIT]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 850,
  maxSlope           = 16,
  maxVelocity        = 0.8,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Acidic Rain]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tllacid]],
  selfDestructAs     = [[MEDIUM_UNIT]],
  shootme            = 1,
  side               = [[BIO]],
  sightDistance      = 390,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 380,
  unitname           = [[tllacid]],
  unitnumber         = 30132,
  version            = 3.0,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORMSHIP_ROCKET]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORMSHIP_ROCKET = {
    areaOfEffect       = 96,
    burnblow           = true,
    craterBoost        = 0,
    craterMult         = 0,
    cruise             = 1,
    explosionGenerator = [[custom:FLASHSMALLUNIT]],
    fireStarter        = 100,
    flightTime         = 15,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[corshiprckt1]],
    name               = [[Rocket]],
    noautorange        = 1,
    noSelfDamage       = true,
    range              = 1550,
    reloadtime         = 8,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed4]],
    soundStart         = [[Rockhvy1]],
    startsmoke         = 1,
    tolerance          = 4000,
    turnRate           = 24384,
    twoPhase           = true,
    vlaunch            = true,
    weaponAcceleration = 80,
    weaponTimer        = 5,
    weaponType         = [[StarburstLauncher]],
    weaponVelocity     = 400,
    damage = {
      commanders         = 500,
      default            = 1100,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 200,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 23,
    metal              = 344,
    object             = [[tllacid_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 34,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 344,
    object             = [[4x4a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
