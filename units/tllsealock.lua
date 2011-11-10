-- UNITDEF -- TLLSEALOCK --
--------------------------------------------------------------------------------

local unitName = "tllsealock"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 0,
  buildCostEnergy    = 19378,
  buildCostMetal     = 4371,
  builder            = false,
  buildTime          = 21563,
  canAttack          = true,
  canstop            = 1,
  category           = [[ARM SPECIAL WEAPON TORP LEVEL2 NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[tllsealock_dead]],
  collisionvolumeoffsets = "0 -46 0",
  collisionvolumescales = "232 122 32",
  collisionvolumetest = 1,
  collisionvolumetype = "Box",
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Floating Gate With Light Defenses]],
  designation        = [[Sea Lock]],
  downloadable       = 1,
  energyMake         = 0.1,
  energyStorage      = 0,
  energyUse          = 0.1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 15,
  footprintZ         = 3,
  maxDamage          = 14000,
  metalStorage       = 0,
  minWaterDepth      = 40,
  mobilestandorders  = 1,
  name               = [[Sea Lock]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[tllsealock]],
  onoffable          = true,
  radarDistance      = 700,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  sightDistance      = 350,
  sonarDistance      = 500,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  threed             = 1,
  unitname           = [[tllsealock]],
  unitnumber         = 4050,
  version            = 1,
  waterline          = 1,
  workerTime         = 0,
  yardMap            = [[wwwYYYYYYYYYwww wwwCCCCCCCCCwww wwwYYYYYYYYYwww]],
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
      def                = [[COAX_TORPEDO]],
    },
    [2]  = {
      def                = [[CORRL_MISSILE]],
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
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    model              = [[torpedo]],
    name               = [[Level1TorpedoLauncher]],
    noSelfDamage       = true,
    propeller          = 1,
    range              = 550,
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
      commanders         = 560,
      default            = 280,
      krogoth            = 560,
    },
  },
  CORRL_MISSILE = {
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
    texture2           = [[coresmoketrail]],
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
      l2subs             = 5,
      l3subs             = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  tllsealock_dead = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Sea Gate Wreckage]],
    energy             = 0,
    footprintX         = 15,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[TLLSEALOCK_DEAD]],
    reclaimable        = false,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
