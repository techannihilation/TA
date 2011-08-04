-- UNITDEF -- CORGOL1 --
--------------------------------------------------------------------------------

local unitName = "corgol1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0242,
  bmcode             = 1,
  brakeRate          = 0.0495,
  buildCostEnergy    = 22892,
  buildCostMetal     = 2367,
  builder            = false,
  buildPic           = [[CORGOL.DDS]],
  buildTime          = 36125,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  corpse             = [[CORGOL_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Master Assault Tank]],
  energyMake         = 0.5,
  energyStorage      = 0,
  energyUse          = 0.5,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 4,
  footprintZ         = 4,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  leaveTracks        = true,
  maneuverleashlength = 640,
  maxDamage          = 13800,
  maxSlope           = 12,
  maxVelocity        = 1.45,
  maxWaterDepth      = 12,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[HTANK4]],
  name               = [[UPG Goliath]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[CORGOL1]],
  script             = [[corgol.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[CORE]],
  sightDistance      = 395,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  trackOffset        = 8,
  trackStrength      = 10,
  trackStretch       = 1,
  trackType          = [[StdTank]],
  trackWidth         = 49,
  turnRate           = 220,
  unitname           = [[corgol1]],
  workerTime         = 0,
  sfxtypes = {
    explosiongenerators = {
      [[custom:goliathflare]],
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
      def                = [[COR_GOL1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  COR_GOL1 = {
    areaOfEffect       = 372,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH96]],
    gravityaffected    = [[true]],
    impulseBoost       = 0.0,
    impulseFactor      = 0.0,
    name               = [[HeavyCannon]],
    noSelfDamage       = true,
    range              = 800,
    reloadtime         = 4.7,
    renderType         = 4,
    soundHit           = [[xplomed4]],
    soundStart         = [[cannhvy2]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 328.63354492188,
    damage = {
      commanders         = 750,
      default            = 1600,
      gunships           = 55,
      hgunships          = 55,
      l1bombers          = 55,
      l1fighters         = 55,
      l1subs             = 5,
      l2bombers          = 55,
      l2fighters         = 55,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 55,
      vtol               = 55,
      vtrans             = 55,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORGOL_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Goliath Wreckage]],
    energy             = 0,
    featureDead        = [[CORGOL_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[CORGOL_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  CORGOL_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Goliath Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4X4C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
