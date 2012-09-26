-- UNITDEF -- TLLDMC --
--------------------------------------------------------------------------------

local unitName = "tlldmc"

--------------------------------------------------------------------------------

local unitDef = {
  bmcode             = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 963900,
  buildCostMetal     = 11485,
  builder            = false,
  buildPic           = [[tlldmc.png]],
  buildTime          = 92585,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  corpse             = [[armbrtha_dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Dark Matter Cannon]],
  designation        = [[ARM-ERC]],
  energyMake         = 0,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[MEDIUM_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  maxDamage          = 45000,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[DMC]],
  noAutoFire         = true,
  objectName         = [[tlldmc]],
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  sightDistance      = 1500,
  standingfireorder  = 0,
  threed             = 1,
  unitname           = [[tlldmc]],
  unitnumber         = 200000,
  version            = 1,
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooooo ooooo ooooo]],
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[tlldmc]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  tlldmc = {
   		areaOfEffect = 30,
		beamWeapon = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		duration = 0.025,
		energypershot = 90000,
		fireStarter = 90,
		id = 254,
		impactonly = 1,
		impulseBoost = 0,
		impulseFactor = 0,
		intensity = 0.75,
		lineOfSight = true,
		name = [[Dark Matter Cannon]],
		noradar = 1,
		noSelfDamage = true,
		range = 2000,
		reloadtime = 5,
		renderType = 0,
		rgbColor = [[0.9 0.6 1]],
		soundHitDry = [[xplolrg1]],
		soundStart = [[Energy]],
		thickness = 5,
		turret = true,
		weaponType = [[LaserCannon]],
		weaponVelocity = 1000,
		damage = {
			commanders = 2800,
			default = 7000,
			experimental_land = 28000,
			experimental_ships = 28000,
			subs = 5,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  armbrtha_dead = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 2520,
    description        = [[Big Bertha Wreckage]],
    energy             = 0,
    featureDead        = [[armbrtha_heap]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = 2659,
    object             = [[ARMBRTHA_DEAD]],
    reclaimable        = false,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  armbrtha_heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 1260,
    description        = [[Big Bertha Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 4,
    hitdensity         = 100,
    metal              = 1020,
    object             = [[3X3E]],
    reclaimable        = false,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
