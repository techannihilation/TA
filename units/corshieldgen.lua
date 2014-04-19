-- UNITDEF -- CORESHEILDGEN --
--------------------------------------------------------------------------------

local unitName = "corshieldgen"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  activateWhenBuilt  = true,
  bmcode             = 1,
  brakeRate          = 0.15,
  buildCostEnergy    = 9300,
  buildCostMetal     = 2370,
  builder            = false,
  buildPic           = [[corshieldgen.png]],
  buildTime          = 77166,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Shield Kbot]],
  designation        = [[UV-2-AB]],
  energyMake         = 0,
  energyStorage      = 1500,
  energyUse          = 15,
  explodeAs          = [[CRAWL_BLAST]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[shield]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 1555,
  maxSlope           = 32,
  maxVelocity        = 0.80,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HKBOT4]],
  name               = [[Oust]],
  noAutoFire         = false,
  objectName         = [[corshieldgen.3do]],
  onoffable          = true,
  seismicSignature   = 3,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[Core]],
  sightDistance      = 300,
  standingmoveorder  = 1,
  steeringmode       = 1,
  turnRate           = 500,
  unitname           = [[corshieldgen]],
  upright            = true,
  workerTime         = 0,
  weaponDefs = nil,
  weapons = {
    [1]  = {
      def               = [[REPULSOR2]],
    },
  },
}


--------------------------------------------------------------------------------


local weaponDefs = {
	REPULSOR2 = {
		name = [[PlasmaRepulsor]],
		shieldAlpha = 0.3,
		shieldBadColor = [[1 0.2 0.2]],
		shieldEnergyUse = 350,
		shieldForce = 8,
		shieldGoodColor = [[0.2 1 0.2]],
		shieldInterceptType = 1,
		shieldMaxSpeed = 200,
		shieldPower = 2000,
		shieldPowerRegen = 29,
		shieldPowerRegenEnergy = 260.5,
		shieldRadius = 155,
		shieldRepulser = true,
		smartShield = true,
		visibleShield = true,
		visibleShieldRepulse = true,
		weaponType = [[Shield]],
		damage = {
			default = 100,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
		blocking = true,
		category = [[corpses]],
		damage = 0.6000 * unitDef.maxDamage,
		description = unitDef.name .. [[ Wreckage]],
		energy = 0,
		featureDead = [[HEAP]],
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 20,
		hitdensity = 100,
		metal = 0.8000 * unitDef.buildCostMetal,
		object = [[corshieldgen_dead]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
	HEAP = {
		blocking = false,
		category = [[heaps]],
		damage = 0.3600 * unitDef.maxDamage,
		description = unitDef.name .. [[ Heap]],
		energy = 0,
		featurereclamate = [[SMUDGE01]],
		footprintX = 2,
		footprintZ = 2,
		height = 4,
		hitdensity = 100,
		metal = 0.6400 * unitDef.buildCostMetal,
		object = [[2X2E]],
		reclaimable = true,
		seqnamereclamate = [[TREE1RECLAMATE]],
		world = [[All Worlds]],
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
