-- UNITDEF -- TLLLONGSHOT --
--------------------------------------------------------------------------------

local unitName = "tllongshot"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.5,
  buildCostEnergy    = 2800,
  buildCostMetal     = 800,
  builder            = false,
  buildTime          = 5500,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[BIO TANK LEVEL2 WEAPON NOTAIR NOTSUB ]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Artillary Assault Tank]],
  designation        = [[none]],
  energyMake         = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 2400,
  maxSlope           = 25,
  maxVelocity        = 1.2,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Longshot]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tlllongshot]],
  radarDistance      = 0,
  scale              = 1.2,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[BIO]],
  sightDistance      = 370,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  TEDClass           = [[TANK]],
  threed             = 1,
  turnRate           = 325,
  unitname           = [[tlllongshot]],
  unitnumber         = 30119,
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORE_ARTILLERY]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORE_ARTILLERY = {
    accuracy           = 960,
    areaOfEffect       = 129,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.5,
    explosionGenerator = [[custom:FLASH4]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    minbarrelangle     = -10,
    name               = [[PlasmaCannon]],
    noSelfDamage       = true,
    range              = 905,
    reloadtime         = 3,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 349.53540039062,
    damage = {
      default            = 190,
      gunships           = 17,
      hgunships          = 17,
      l1bombers          = 17,
      l1fighters         = 17,
      l1subs             = 5,
      l2bombers          = 17,
      l2fighters         = 17,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 17,
      vtol               = 17,
      vtrans             = 17,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 15,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 1,
    hitdensity         = 23,
    metal              = 200,
    object             = [[tlllongshot_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 11,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 4,
    metal              = 100,
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
