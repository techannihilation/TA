-- UNITDEF -- TLLLMTNS --
--------------------------------------------------------------------------------

local unitName = "tlllmtns"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 0,
  buildAngle         = 32768,
  buildCostEnergy    = 524,
  buildCostMetal     = 134,
  builder            = false,
  buildTime          = 2146,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL WEAPON LEVEL1 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[NS Light Anti-Air Tower]],
  designation        = [[]],
  energyStorage      = 50,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Tourelle lance-missiles NAVY]],
  germandescription  = [[Raketenturm - Marineeinheit]],
  iconType           = [[building]],
  italiandescription = [[Torretta missilistica - Sezione Navale]],
  maxDamage          = 785,
  maxSlope           = 14,
  maxWaterDepth      = 0,
  minWaterDepth      = 2,
  name               = [[NS Besom]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[TLLLMTNS]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 425,
  spanishdescription = [[Torre Lanzamisiles-Serie Naval]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlllmtns]],
  unitnumber         = 888,
  version            = 3.1,
  waterline          = 3,
  yardMap            = [[wwwwwwwww]],
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    cloak              = [[kloak1]],
    uncloak            = [[kloak1un]],
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
      [[servmed2]],
    },
    select = {
      [[servmed2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARMRL_MISSILE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMRL_MISSILE = {
    areaOfEffect       = 48,
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    flightTime         = 1.5,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[Missiles]],
    noSelfDamage       = true,
    range              = 765,
    reloadtime         = 1.7,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplomed2]],
    soundStart         = [[rockhvy2]],
    startsmoke         = 1,
    startVelocity      = 400,
    texture2           = [[armsmoketrail]],
    toAirWeapon        = true,
    tolerance          = 10000,
    tracks             = true,
    turnRate           = 63000,
    turret             = true,
    weaponAcceleration = 150,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 750,
    damage = {
      default            = 113,
      gunships           = 84,
      hgunships          = 84,
      l1subs             = 5,
      l2bombers          = 300,
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlllmtns_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3e]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
