-- UNITDEF -- TLLFIRERAISER --
--------------------------------------------------------------------------------

local unitName = "tllfireraiser"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 841,
  buildCostMetal     = 135,
  builder            = false,
  buildTime          = 1924,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL LEVEL1 WEAPON NOTAIR NOTSUB MOBILE  ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Rocket Kbot]],
  designation        = [[]],
  energyMake         = 0.6,
  energyUse          = 0.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  frenchdescription  = [[Kbot lance-roquettes]],
  germandescription  = [[Raketen-Kbot]],
  italiandescription = [[Kbot lanciarazzi]],
  maneuverleashlength = 640,
  maxDamage          = 823,
  maxSlope           = 14,
  maxVelocity        = 1.70,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[Fireraiser]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLFIRERAISER]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 400,
--  smoothAnim         = true,
  spanishdescription = [[Kbot Lanzacohetes]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  threed             = 1,
  turnRate           = 1005,
  unitname           = [[tllfireraiser]],
  unitnumber         = 821,
  upright            = true,
  version            = 3.1,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[TLL_KBOT_ROCKET]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_KBOT_ROCKET = {
    areaOfEffect       = 48,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:VSMLMISSILE_EXPLOSION]],
    fireStarter        = 70,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Rockets]],
    noSelfDamage       = true,
    range              = 485,
    reloadtime         = 3.8,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[rocklit1]],
    startsmoke         = 1,
    startVelocity      = 190,
    texture2           = [[coresmoketrail]],
    turret             = true,
    weaponAcceleration = 120,
    weaponTimer        = 2,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 190,
    damage = {
      default            = 144,
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
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllfireraiser_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
