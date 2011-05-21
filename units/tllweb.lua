-- UNITDEF -- TLLWEB --
--------------------------------------------------------------------------------

local unitName = "tllweb"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[NOWEAPON]],
  bmcode             = 0,
  buildAngle         = 4768,
  buildCostEnergy    = 2533,
  buildCostMetal     = 132,
  builder            = false,
  buildTime          = 4812,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL WEAPON LEVEL1 NOTAIR NOTSUB CTRL_L]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Lightning Tower]],
  designation        = [[]],
  energyMake         = 6,
  energyStorage      = 200,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[building]],
  maxDamage          = 650,
  maxSlope           = 14,
  maxWaterDepth      = 0,
  name               = [[Tesla]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTAIR]],
  objectName         = [[TLLweb]],
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  standingfireorder  = 2,
  TEDClass           = [[FORT]],
  threed             = 1,
  unitname           = [[tllweb]],
  unitnumber         = 80802,
  version            = 1,
  yardMap            = [[oooo]],
  zbuffer            = 1,
  sfxtypes = {
    explosiongenerators = {
      [[custom:webbluelight]],
    },
  },
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
      def                = [[SPRAY_LIGHTNING]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  SPRAY_LIGHTNING = {
    areaOfEffect       = 17,
    beamWeapon         = true,
    color              = 128,
    color2             = 130,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 1.9,
    energypershot      = 100,
    explosionGenerator = [[custom:LIGHTNING_FLASH]],
    fireStarter        = 85,
    id                 = 225,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    name               = [[Spray Lightning]],
    noSelfDamage       = true,
    range              = 470,
    reloadtime         = 1,
    renderType         = 7,
    soundHit           = [[lashit2]],
    soundStart         = [[Lghthvy1]],
    tolerance          = 600,
    turret             = true,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    weaponTimer        = 1,
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 860,
    damage = {
      commanders         = 340,
      default            = 260,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = 1600,
    description        = [[Wreckage]],
    featureDead        = [[tlllft_heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 250,
    metal              = 85,
    object             = [[tllweb_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  tlllft_heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1300,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = 33,
    object             = [[2x2b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
