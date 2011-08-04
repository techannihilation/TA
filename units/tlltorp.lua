-- UNITDEF -- TLLTORP --
--------------------------------------------------------------------------------

local unitName = "tlltorp"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  badTargetCategory  = [[NOTSUB]],
  bmcode             = 0,
  buildAngle         = 16384,
  buildCostEnergy    = 1988,
  buildCostMetal     = 324,
  builder            = false,
  buildTime          = 4204,
  canAttack          = true,
  canstop            = 1,
  category           = [[TLL SPECIAL WEAPON  LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Torpedo Launcher]],
  designation        = [[TLL-TL]],
  energyMake         = 0.1,
  energyUse          = 0.1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Lance-torpilles]],
  frenchname         = [[Torpilleur]],
  germandescription  = [[Torpedowerfer]],
  germanname         = [[T. Launcher]],
  italiandescription = [[Lancia-torpedini]],
  italianname        = [[Lancia-torpedini]],
  maxDamage          = 2190,
  minWaterDepth      = 1,
  name               = [[Torpedo Launcher]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  noshadow           = 1,
  objectName         = [[TLLtorp]],
  ovradjust          = 1,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 150,
  sonarDistance      = 450,
  spanishdescription = [[Lanzatorpedos]],
  spanishname        = [[Lanzatorpedos]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlltorp]],
  unitnumber         = 855,
  version            = 3.1,
  waterline          = 6,
  workerTime         = 0,
  yardMap            = [[wwwwwwwww]],
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
      badTargetCategory  = [[NOWEAPON]],
      def                = [[COAX_TORPEDO]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COAX_TORPEDO = {
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
    name               = [[Level1TorpedoLauncher]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 600,
    reloadtime         = 1.9,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep2]],
    soundStart         = [[torpedo1]],
    startVelocity      = 200,
    tracks             = true,
    turnRate           = 2500,
    turret             = true,
    waterWeapon        = true,
    weaponAcceleration = 40,
    weaponTimer        = 3,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 320,
    damage = {
      commanders         = 260,
      default            = 280,
      krogoth            = 260,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlltorp_dead]],
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
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 45,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
