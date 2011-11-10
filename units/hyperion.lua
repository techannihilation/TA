-- UNITDEF -- HYPERION --
--------------------------------------------------------------------------------

local unitName = "hyperion"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.08,
  bmcode             = 1,
  brakeRate          = 0.024,
  buildCostEnergy    = 110000,
  buildCostMetal     = 66400,
  builder            = false,
  buildTime          = 1212470,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  cantBeTransported  = true,
  category           = [[ALL HUGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[hyperion_dead]],
  damageModifier     = 0.5,
  defaultmissiontype = [[Standby]],
  description        = [[Gigantic Siege Kbot]],
  designation        = [[CORE-EX1292]],
  downloadable       = 1,
  energyMake         = 0,
  energyStorage      = 20000,
  energyUse          = 0,
  explodeAs          = [[CRAWL_BLAST]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  maneuverleashlength = 640,
  maxDamage          = 162000,
  maxSlope           = 17,
  maxVelocity        = 1.9,
  maxWaterDepth      = 12,
  metalMake          = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[VKBOT5]],
  name               = [[Hyperion]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[hyperion]],
  radarDistance      = 2100,
  selfDestructAs     = [[CRAWL_BLAST]],
  shootme            = 1,
  sightDistance      = 700,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  TEDClass           = [[KBOT]],
  threed             = 1,
  turnRate           = 480,
  unitname           = [[hyperion]],
  unitnumber         = 764,
  upright            = true,
  version            = 3,
  workerTime         = 0,
  zbuffer            = 1,
    sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:bluemuzzle]],
		},
	},	
  weapons = {
    [1]  = {
      onlyTargetCategory = [[NOTVTOL]],
      def                = [[KARGANETH_CANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  KARGANETH_CANNON = {
    accuracy           = 500,
    areaOfEffect       = 290,
    avoidFeature       = true,
    avoidFriendly      = true,
    cegTag             = [[bluelight]],
	craterBoost = 0,
	craterMult = 0.10,
    edgeEffectiveness  = 0.01,
    energypershot      = 15000,
    explosionGenerator = [[custom:bigparticleboom]],
    fireStarter        = 100,
    gravityaffected    = 1,
    id                 = 97,
    model              = [[g_cannon_siege]],
    name               = [[Karganeth Siege Cannon]],
    range              = 750,
    reloadtime         = 0.52,
    renderType         = 1,
    soundHit           = [[dichit]],
    soundStart         = [[dicfire]],
    startsmoke         = 1,
    tolerance          = 500,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1000,
    damage = {
          default = 5000,
			subs = 5,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  hyperion_dead = {
    blocking           = false,
    category           = [[corpses]],
    damage             = 0.6000 * unitDef.maxDamage,
    description        = [[Karganeth Wreckage]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 40,
    hitdensity         = 100,
    metal              = 0.8000 * unitDef.buildCostMetal,
    object             = [[HYPERION_DEAD]],
    reclaimable        = false,
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
