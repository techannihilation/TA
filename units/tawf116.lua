-- UNITDEF -- TAWF116 --
--------------------------------------------------------------------------------

local unitName = "tawf116"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.20,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.584,
  buildCostEnergy    = 4130,
  buildCostMetal     = 947,
  builder            = false,
  buildTime          = 5700,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[dead]],
  damageModifier     = 0.65,
  defaultmissiontype = [[Standby]],
  description        = [[Extended Armour Assault Vehicle]],
  designation        = [[TAWF-31]],
  energyMake         = 1.2,
  energyStorage      = 0,
  energyUse          = 1.2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Véhicule d'assaut à blindage évolué]],
  frenchname         = [[Seperator]],
  germandescription  = [[Angriffsfahrzeug mit Verb. Panzerung]],
  germanname         = [[Seperator]],
  maneuverleashlength = 640,
  maxDamage          = 2500,
  maxSlope           = 15,
  maxVelocity        = 1.4451,
  maxWaterDepth      = 18,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK3]],
  name               = [[Separator]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TAWF116]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 200,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 330,
  unitname           = [[tawf116]],
  version            = 3.1,
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
      [[tarmmove]],
    },
    select = {
      [[tarmsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_DISINTEGRATORxxx]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_DISINTEGRATORxxx = {
    areaOfEffect       = 48,
	avoidFriendly      = 1,
    beamWeapon         = true,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 400,
    explosionart       = [[explode5]],
    explosiongaf       = [[fx]],
    explosionGenerator = [[custom:PARALYZER_BLUE]],
    fireStarter        = 70,
    id                 = 22,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    model              = [[plasmafire]],
    name               = [[Disintegrator]],
    noExplode          = true,
    range              = 300,
    reloadtime         = 1.5,
    renderType         = 3,
    soundHit           = [[xplomas2]],
    soundStart         = [[disigun1]],
    soundTrigger       = false,
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[DGun]],
    weaponTimer        = 4,
    weaponVelocity     = 200,
    damage = {
      default            = 250,
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
    description        = [[Separator Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[TAWF116_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Separator Heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
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
