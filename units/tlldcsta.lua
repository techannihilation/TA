-- UNITDEF -- TLLDCSTA --
--------------------------------------------------------------------------------

local unitName = "tlldcsta"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 558,
  buildCostMetal     = 204,
  builder            = false,
  buildTime          = 4120,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL WEAPON  LEVEL1 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Depth Charge Launcher]],
  designation        = [[TLL-dcs]],
  energyMake         = 0.1,
  energyUse          = 0.1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  maxDamage          = 1650,
  minWaterDepth      = 5,
  name               = [[Depth Charge Station]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[TLLdcsta]],
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  sonarDistance      = 450,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlldcsta]],
  unitnumber         = 879,
  version            = 3.1,
  waterline          = 11,
  workerTime         = 0,
  yardMap            = [[wwww]],
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
      def                = [[COAX_DEPTHCHARGE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COAX_DEPTHCHARGE = {
    avoidFriendly      = false,
    bouncerebound      = 0.6,
    bounceslip         = 0.6,
    burnblow           = true,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    groundbounce       = true,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[depthcharge]],
    name               = [[DepthCharge]],
    noSelfDamage       = true,
    numbounce          = 1,
    propeller          = 1,
    range              = 580,
    reloadtime         = 1.8,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep2]],
    soundStart         = [[torpedo1]],
    startVelocity      = 250,
    tracks             = true,
    turnRate           = 18000,
    turret             = true,
    waterWeapon        = true,
    weaponAcceleration = 25,
    weaponTimer        = 6,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 350,
    damage = {
      commanders         = 500,
      default            = 250,
      dl                 = 5,
      krogoth            = 500,
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
    height             = 12,
    hitdensity         = 103,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlldcsta_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    hitdensity         = 4,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2x2a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
