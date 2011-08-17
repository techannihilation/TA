-- UNITDEF -- TLLEQUALIZER --
--------------------------------------------------------------------------------

local unitName = "tllequalizer"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.015,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.05,
  buildAngle         = 16384,
  buildCostEnergy    = 8805,
  buildCostMetal     = 1745,
  builder            = false,
  buildTime          = 19901,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Cruiser]],
  designation        = [[]],
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 5,
  footprintZ         = 5,
  frenchdescription  = [[Croiseur]],
  germandescription  = [[Schwerer Kreuzer]],
  italiandescription = [[Incrociatore]],
  maneuverleashlength = 640,
  maxDamage          = 4310,
  maxVelocity        = 2.45,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  movementClass      = [[BOAT5]],
  name               = [[Equalizer]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLEQUALIZER]],
  scale              = 0.5,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 210,
  sonarDistance      = 435,
  spanishdescription = [[Crucero]],
  standingfireorder  = 2,
  standingmoveorder  = 0,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 128,
  unitname           = [[tllequalizer]],
  unitnumber         = 896,
  version            = 3.1,
  waterline          = 10,
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
      badTargetCategory  = [[VTOL]],
      def                = [[COR_CRUS]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COR_CRUS = {
    areaOfEffect       = 8,
    beamlaser          = 1,
    beamTime           = 0.15,
    coreThickness      = 0.2,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 50,
    explosionGenerator = [[custom:FLASH1]],
    fireStarter        = 90,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    name               = [[HighEnergyLaser]],
    noSelfDamage       = true,
    range              = 785,
    reloadtime         = 0.9,
    renderType         = 0,
    rgbColor           = [[0 1 0]],
    soundHit           = [[lasrhit1]],
    soundStart         = [[Lasrmas2]],
    targetMoveError    = 0.175,
    thickness          = 3,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 700,
    damage = {
      default            = 180,
      gunships           = 44,
      hgunships          = 44,
      l1bombers          = 44,
      l1fighters         = 44,
      l1subs             = 5,
      l2bombers          = 44,
      l2fighters         = 44,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 44,
      vtol               = 44,
      vtrans             = 44,
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
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllequalizer_dead]],
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
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
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
