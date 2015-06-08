-- UNITDEF -- CORHOWIE --
--------------------------------------------------------------------------------

local unitName = "corhowie"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.108,
  bmcode             = 1,
  brakeRate          = 0.188,
  buildCostEnergy    = 72750,
  buildCostMetal     = 7070,
  builder            = false,
  buildPic           = [[CORHOWIE.png]],
  buildTime          = 21380,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Rocket Kbot]],
  designation        = [[ARM-HA8]],
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[assaultkbot]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  mass               = 3450,
  maxDamage          = 4750,
  maxSlope           = 20,
  maxVelocity        = 1.6,
  maxWaterDepth      = 12,
  mobilestandorders  = 1,
  movementClass      = [[KBOT3]],
  name               = [[Howie]],
  noAutoFire         = false,
  noChaseCategory    = [[SUB VTOL]],
  objectName         = [[CORHOWIE]],
  selfDestructAs     = [[CRAWL_BLASTSML]],
  side               = [[CORE]],
  sightDistance      = 660,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 1.0560001134872,
  turnRate           = 979,
  unitname           = [[corhowie]],
  upright            = true,
  workerTime         = 0,
  customparams = {
		RequireTech = [[Advanced T3 Unit Research Centre]],
	},
 weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[SMALL TINY]],
			def = [[asm]],
			onlyTargetCategory = [[NOTVTOL]],
			},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	asm = {
		areaOfEffect = 300,
		burnblow = true,
		burst = 4,
		cegTag = [[Core_Howie_Rocket]],
		cruisealt = 120,
		explosionGenerator = [[custom:Explosion_VeryHeavy_Rocket-nix]],
		fireStarter = 80,
		flightTime = 15,
		guidance = false,
		lineOfSight = true,
		metalpershot = 0,
		model = [[TAWF114a]],
		name = [[Antiship missile]],
		range = 2090,
		reloadtime = 30,
		renderType = 1,
		selfprop = true,
		smokedelay = 0.02,
		smokeTrail = true,
		soundHitDry = [[mlrsboom]],
		soundStart = [[mlrsfireshort]],
		soundTrigger = true,
		startsmoke = 1,
		startVelocity = 150,
		texture1 = [[null]],
		texture2 = [[null]],
		texture3 = [[null]],
		texture4 = [[null]],
		tolerance = 1000,
		tracks = false,
		trajectoryHeight = 2.8,
		turnRate = 5000,
		turret = true,
		weaponAcceleration = 120,
		weaponTimer = 15,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 900,
		wobble = 1800,
		sprayAngle = 100,
		damage = {
			default = 2500,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = 5100,
    description        = [[Wreckage]],
    energy             = 0,
    featureDead        = [[heap]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 15,
    hitdensity         = 100,
    metal              = 1725,
    object             = [[CORHOWIE_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 5100,
    description        = [[Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 863,
    object             = [[3X3B]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
