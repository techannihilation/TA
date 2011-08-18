-- UNITDEF -- TLLMANTA --
--------------------------------------------------------------------------------

local unitName = "tllmanta"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.22,
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 1,
  brakeRate          = 0.22,
  buildCostEnergy    = 5818,
  buildCostMetal     = 1831,
  builder            = false,
  buildTime          = 19250,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL UNDERWATER MOBILE WEAPON NOTLAND NOTAIR]],
  collisionvolumeoffsets = [[0 0 0]],
  collisionvolumescales = [[32 22 62]],
  collisionvolumetest = 0,
  collisionvolumetype = [[Ell]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Submarine Killer]],
  designation        = [[]],
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Destructeur de sous-marins]],
  germandescription  = [[U-Boot Jäger]],
  italiandescription = [[Sottomarino killer]],
  maneuverleashlength = 640,
  maxDamage          = 305,
  maxVelocity        = 2.45,
  minWaterDepth      = 15,
  mobilestandorders  = 1,
  movementClass      = [[UBOAT3]],
  name               = [[Manta]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTSUB]],
  objectName         = [[TLLMANTA]],
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  sonarDistance      = 470,
  spanishdescription = [[Caza submarino]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[tllmanta]],
  unitnumber         = 903,
  upright            = true,
  version            = 3.1,
  waterline          = 30,
  zbuffer            = 1,
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[tllwarning]],
    arrived = {
      [[tllsub2]],
    },
    cant = {
      [[wearoff]],
    },
    count = {
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
      [[tllcount]],
    },
    ok = {
      [[tllsub]],
    },
    select = {
      [[sucorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[NOTSUB]],
      def                = [[ARMSMART_TORPEDO]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMSMART_TORPEDO = {
    areaOfEffect       = 16,
    avoidFriendly      = false,
    burnblow           = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    guidance           = true,
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[torpedo]],
    name               = [[AdvancedTorpedo]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 600,
    reloadtime         = 2,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep1]],
    soundStart         = [[torpedo1]],
    startVelocity      = 120,
    tolerance          = 32767,
    tracks             = true,
    turnRate           = 12000,
    turret             = false,
    waterWeapon        = true,
    weaponAcceleration = 20,
    weaponTimer        = 3,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 200,
    damage = {
      atl                = 375,
      default            = 250,
      krogoth            = 1000,
      l1subs             = 400,
      l2subs             = 400,
      l3subs             = 500,
      tl                 = 375,
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
    height             = 10,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllmanta_dead]],
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
    hitdensity         = 20,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
