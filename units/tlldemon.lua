-- UNITDEF -- TLLDEMON --
--------------------------------------------------------------------------------

local unitName = "tlldemon"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.6,
  buildCostEnergy    = 8600,
  buildCostMetal     = 1800,
  builder            = false,
  buildTime          = 13000,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Prototype Anti-Kbot Assault Tank]],
  designation        = [[none]],
  energyMake         = 2,
  energyStorage      = 0,
  energyUse          = 2,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  maneuverleashlength = 640,
  maxDamage          = 3800,
  maxSlope           = 10,
  maxVelocity        = 1,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[Demon Slayer Mark II]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[tlldemon]],
  radarDistance      = 0,
  scale              = 1.2,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[BIO]],
  sightDistance      = 350,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 400,
  unitname           = [[tlldemon]],
  unitnumber         = 30001,
  version            = 3.0,
  workerTime         = 0,
  zbuffer            = 1,
  sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:dgunflare]],
		},
	},	
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
      [[tcormove]],
    },
    select = {
      [[tcorsel]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[DSLAYER_CANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  DSLAYER_CANNON = {
    areaOfEffect       = 80,
    ballistic          = true,
    energypershot      = 5,
    explosionGenerator = [[custom:FLASH96]],
    gravityaffected    = [[true]],
    id                 = 229,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    metalpershot       = 1,
    name               = [[Anti-Dreadnaught Heavy Cannon]],
    range              = 520,
    reloadtime         = 1.2,
    renderType         = 4,
    soundHit           = [[xplomed2]],
    soundStart         = [[DemonS_Fire]],
    startsmoke         = 1,
    turret             = true,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponType         = [[Cannon]],
    weaponVelocity     = 264.95281982422,
    damage = {
      commanders             = 85,
      default            = 220,
	  subs = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[armcorpses]],
    damage             = 100,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 1,
    hitdensity         = 23,
    metal              = 1000,
    object             = [[tlldemon_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    catagory           = [[heaps]],
    damage             = 12,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = 800,
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
