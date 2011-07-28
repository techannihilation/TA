-- UNITDEF -- NSAATORPH --
--------------------------------------------------------------------------------

local unitName = "nsaatorph"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = .04,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = .08,
  buildCostEnergy    = 2575,
  buildCostMetal     = 358,
  builder            = false,
  buildTime          = 7504,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1998 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Anti-Submarine HoverCraft]],
  designation        = [[NSA-ATORPH]],
  downloadable       = 1,
  energyMake         = 5.6,
  energyStorage      = 0,
  energyUse          = 5.6,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft anti-sous-marin]],
  frenchname         = [[Undertow]],
  germaname          = [[Undertow]],
  germandescription  = [[U-Boot Jäger Hovercraft]],
  italiandescription = [[Anti-Submarine HoverCraft]],
  italianname        = [[Undertow]],
  maneuverleashlength = 640,
  maxDamage          = 708,
  maxSlope           = 16,
  maxVelocity        = 2.8,
  maxWaterDepth      = 255,
  metalStorage       = 0,
  mobilestanorders   = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Undertow]],
  noAutoFire         = false,
  objectName         = [[NSAATORPH]],
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 280,
  sonarDistance      = 305,
  spanishdescription = [[Anti-Submarine HoverCraft]],
  spanishname        = [[Undertow]],
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 230,
  unitname           = [[nsaatorph]],
  unitnumber         = 1403,
  version            = 1.0,
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
      [[hovmdok1]],
    },
    select = {
      [[hovmdsl1]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[ARMHEAVYDEPTHCHARGE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMHEAVYDEPTHCHARGE = {
    areaOfEffect       = 16,
    burnblow           = true,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    guidance           = true,
    id                 = 17,
    lavaexplosionart   = [[lavasplashsm]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[DEPTHCHARGE]],
    name               = [[Depth Charge]],
    propeller          = 1,
    range              = 210,
    reloadtime         = 1,
    renderType         = 1,
    selfprop           = true,
    soundHit           = [[xplodep2]],
    soundStart         = [[torpedo1]],
    startVelocity      = 100,
    tolerance          = 32767,
    tracks             = true,
    turnRate           = 10000,
    turret             = false,
    waterexplosionart  = [[h2oboom1]],
    waterexplosiongaf  = [[fx]],
    waterWeapon        = true,
    weaponAcceleration = 15,
    weaponTimer        = 3,
    weaponType         = [[TorpedoLauncher]],
    weaponVelocity     = 110,
    damage = {
      default            = 70,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Undertown Wreckage]],
    featureDead        = [[heap]],
    featurereclaimate  = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 60,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[nsaatorph_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Undertown Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 5,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3a]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
