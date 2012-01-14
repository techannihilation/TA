-- UNITDEF -- TLLDB --
--------------------------------------------------------------------------------

local unitName = "tlldb"

--------------------------------------------------------------------------------

local unitDef = {
  airsightdistance   = 1450,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 0,
  buildAngle         = 9814,
  buildCostEnergy    = 54000,
  buildCostMetal     = 10800,
  builder            = false,
  buildTime          = 262240,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL NOTHOVERNOTVTOL NOTMOBILE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Very Heavy Anti-Air Hybrid Gun]],
  designation        = [[MG-DCA]],
  downloadable       = 1,
  energyStorage      = 0,
  energyUse          = 0,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  maxDamage          = 9500,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[Dragons Breath]],
  noAutoFire         = false,
  objectName         = [[TLLDB]],
  radarDistance      = 0,
  selfDestructAs     = [[MEDIUM_BUILDING]],
  shootme            = 1,
  side               = [[CORE]],
  sightDistance      = 400,
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlldb]],
  unitnumber         = 13250,
  version            = 3.1,
  workerTime         = 0,
  yardMap            = [[ooooooooo]],
  zbuffer            = 1,
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
      [[twrturn3]],
    },
    select = {
      [[twrturn3]],
    },
  },
  
  weapons = {
		[1] = {
			def                = [[DRAGON_BREATH_GUN]],
			onlyTargetCategory = [[VTOL]],
		},
		[2] = {
			badTargetCategory  = [[MEDIUMVTOL SMALLVTOL TINYVTOL]],
			def                = [[DRAGON_BREATH_MISSILE]],
			onlyTargetCategory = [[VTOL SUPERSHIP]],
		},
		[3] = {
			badTargetCategory  = [[MEDIUMVTOL SMALLVTOL TINYVTOL]],
			def                = [[DRAGON_BREATH_MISSILE]],
			onlyTargetCategory = [[VTOL SUPERSHIP]],
		},
	},

}


--------------------------------------------------------------------------------

local weaponDefs = {
  	DRAGON_BREATH_GUN = {
		accuracy = 1000,
		areaOfEffect = 192,
		ballistic = true,
		burnblow = true,
		canattackground = false,
		cegTag = [[tllflak-fx]],
		color = 1,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0.85,
		explosionGenerator = [[custom:FLASH3]],
		gravityaffected = [[true]],
		impulseBoost = 0,
		impulseFactor = 0,
		minbarrelangle = -24,
		name = [[Dragon Breath Flak Cannon]],
		noSelfDamage = true,
		range = 1150,
		reloadtime = 0.4,
		renderType = 4,
		size = 5,
		soundHit = [[flakhit]],
		soundStart = [[flakfire]],
		startsmoke = 1,
		toAirWeapon = true,
		turret = true,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 2250,
		damage = {
			bombers = 600,
			default = 5,
			fighters = 600,
			flak_resistant = 200,
			unclassed_air = 600,
		},
	},
  DRAGON_BREATH_MISSILE = {
    areaOfEffect       = 140,
    cegTag             = [[RAVENTRAIL]],
    canattackground    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
    flightTime         = 1.3,
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    metalpershot       = 25,
    model              = [[quadmissile3g]],
    name               = [[Dragons Breath Missile]],
    noSelfDamage       = true,
    range              = 1800,
    reloadtime         = 1.7,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .001,
    smokeTrail         = true,
    soundHit           = [[explode]],
    soundStart         = [[rocklit3]],
    startsmoke         = 1,
    startVelocity      = 750,
    toAirWeapon        = true,
    tolerance          = 8500,
    tracks             = true,
    turnRate           = 50000,
    turret             = true,
    weaponAcceleration = 450,
    weaponTimer        = 15,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 1750,
    damage = {
      bombers = 2200,
			default = 5,
			fighters = 1700,
			flak_resistant = 2200,
			unclassed_air = 1400,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    catagory           = [[corcorpses]],
    damage             = 1545,
    description        = [[Wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 10,
    hitdensity         = 23,
    metal              = 914,
    object             = [[tlldb_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = 340,
    description        = [[Metal Shards]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    hitdensity         = 4,
    metal              = 298,
    object             = [[3x3b]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[all]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
