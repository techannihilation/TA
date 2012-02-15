-- UNITDEF -- TLLRIOT --
--------------------------------------------------------------------------------

local unitName = "tllriot"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.025,
  bmcode             = 1,
  brakeRate          = 0.055,
  buildCostEnergy    = 1450,
  buildCostMetal     = 350,
  builder            = false,
  buildTime          = 5840,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL MEDIUM MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Medium Riot Tank]],
  energyMake         = 0.8,
  energyStorage      = 0,
  energyUse          = 0.8,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[armtank]],
  maneuverleashlength = 640,
  maxDamage          = 1350,
  maxSlope           = 12,
  maxVelocity        = 1.3,
  maxWaterDepth      = 100,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANK2]],
  name               = [[Ruckus]],
  noAutoFire         = false,
  noChaseCategory    = [[SUB VTOL]],
  objectName         = [[tllriot]],
  ovradjust          = 1,
  radarDistance      = 0,
  selfDestructAs     = [[BIG_UNIT]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 260,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 210,
  unitname           = [[tllriot]],
  version            = 1,
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
  weaponDefs = nil,
  weapons = {
    [1]  = {
      onlyTargetCategory = [[NOTVTOL]],
      def = [[TLLRIOT_CANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
	TLLRIOT_CANNON = {
		areaOfEffect = 185,
		burnblow = true,
		coreThickness = 0.5,
		edgeEffectiveness = 0.25,
		energypershot = 15,
		explosionGenerator = [[custom:lightningexplo]],
		fireStarter = 0,
		impulseFactor = 0,
		intensity = 1.5,
		lineOfSight = true,
		minbarrelangle = -25,
		name = [[Riot Cannon]],
		range = 340,
		reloadtime = 1.8,
		renderType = 3,
		rgbColor = [[0.75 0.7 1]],
		size = 2.5,
		soundHit = [[debris4]],
		soundStart = [[sonicwv1]],
		tolerance = 2000,
		turret = true,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			commanders = 20,
			default = 80, --+area damage
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
    damage             = 400,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = 266,
    object             = [[tllriot_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 200,
    description        = [[Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = 193,
    object             = [[2x2d]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
