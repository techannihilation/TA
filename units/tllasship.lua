-- UNITDEF -- TLLASSHIP --
--------------------------------------------------------------------------------

local unitName = "tllasship"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0105,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.03,
  buildAngle         = 16384,
  buildCostEnergy    = 15112,
  buildCostMetal     = 1126,
  buildTime          = 23300,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Sub Exterminator]],
  designation        = [[TL-ASS]],
  downloadable       = 1,
  energyMake         = 10,
  energyStorage      = 50,
  energyUse          = 2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  floater            = true,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Exterminateur de sous-marins]],
  germandescription  = [[U-boot Vernichter]],
  maneuverleashlength = 640,
  maxDamage          = 1899,
  maxVelocity        = 2.1,
  metalStorage       = 1,
  minWaterDepth      = 30,
  mobilestandorders  = 1,
  movementClass      = [[BOAT4]],
  name               = [[Petrel]],
  noAutoFire         = false,
  objectName         = [[TLLASSHIP]],
  ovradjust          = 1,
  radarDistance      = 0,
  scale              = 10,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 270,
  sonarDistance      = 650,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 85,
  unitname           = [[tllasship]],
  unitnumber         = 945,
  version            = 3.1,
  waterline          = 6,
  wter_badtargetcategory = [[NOTSUB]],
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
      def                = [[TLL_ASEDO]],
    },
   },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  TLL_ASEDO = {
    areaOfEffect       = 16,
    burnblow           = true,
    burst              = 5,
    burstrate          = .2,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    guidance           = true,
    id                 = 221,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[tlltorpedo2]],
    name               = [[guided torpedo pack]],
    propeller          = 1,
    range              = 600,
    reloadtime         = 6,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[splash]],
    soundStart         = [[canlite3]],
    soundTrigger       = true,
    sprayAngle         = 10000,
    startVelocity      = 100,
    tolerance          = 6000,
    tracks             = true,
    turnRate           = 10000,
    turret             = true,
    waterexplosionart  = [[h2oboom2]],
    waterexplosiongaf  = [[CAexp3]],
    waterWeapon        = true,
    weaponAcceleration = 15,
    weaponTimer        = 5,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 135,
    damage = {
      default            = 133,
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
    footprintX         = 4,
    footprintZ         = 4,
    height             = 12,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllASSHIP_dead]],
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
    footprintX         = 4,
    footprintZ         = 4,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3c]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
