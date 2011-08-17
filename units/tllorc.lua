-- UNITDEF -- TLLORC --
--------------------------------------------------------------------------------

local unitName = "tllorc"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.04,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.019,
  buildCostEnergy    = 21407,
  buildCostMetal     = 4100,
  builder            = false,
  buildTime          = 41765,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL UNDERWATER MOBILE WEAPON NOTLAND NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[44 24 74]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Battle Sub]],
  designation        = [[]],
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Sous-marin évolué]],
  germandescription  = [[Schweres Angriffs-U-Boot]],
  italiandescription = [[Sottomarino]],
  maneuverleashlength = 640,
  maxDamage          = 3388,
  maxVelocity        = 1.95,
  minWaterDepth      = 25,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT4]],
  name               = [[Orc]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTSUB]],
  objectName         = [[TLLORC]],
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 190,
  sonarDistance      = 720,
  spanishdescription = [[Submarino de Combate]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 95,
  unitname           = [[tllorc]],
  unitnumber         = 905,
  upright            = true,
  version            = 3.1,
  waterline          = 30,
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
      [[sucormov]],
    },
    select = {
      [[sucorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTSUB]],
      def                = [[CORSSUB_WEAPON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORSSUB_WEAPON = {
    areaOfEffect       = 16,
    avoidFriendly      = false,
    burnblow           = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH3]],
    guidance           = true,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[advtorpedo]],
    name               = [[advTorpedo]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 690,
    reloadtime         = 1.5,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep1]],
    soundStart         = [[torpedo1]],
    startVelocity      = 150,
    tolerance          = 32767,
    tracks             = true,
    turnRate           = 1500,
    turret             = true,
    waterWeapon        = true,
    weaponAcceleration = 25,
    weaponTimer        = 4,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 220,
    damage = {
      atl                = 750,
      default            = 500,
      krogoth            = 1500,
      l1subs             = 250,
      l2subs             = 150,
      l3subs             = 250,
      tl                 = 750,
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
    height             = 10,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllorc_dead]],
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
    hitdensity         = 20,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
