-- UNITDEF -- ARMZEUS1 --
--------------------------------------------------------------------------------

local unitName = "armzeus1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.12,
  bmcode             = 1,
  brakeRate          = 0.25,
  buildCostEnergy    = 5668,
  buildCostMetal     = 429,
  builder            = false,
  buildPic           = [[ARMZEUS.DDS]],
  buildTime          = 7252,
  canAttack          = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ARM KBOT MOBILE WEAPON NOTAIR NOTSUB NOTSHIP LEVEL2 ALL]],
  corpse             = [[ARMZEUS_DEAD]],
  defaultmissiontype = [[Standby]],
  description        = [[Heavy Assault Kbot]],
  energyMake         = 1.1,
  energyStorage      = 0,
  energyUse          = 1.1,
  explodeAs          = [[BIG_UNITEX]],
  firestandorders    = 1,
  footprintX         = 2,
  footprintZ         = 2,
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maneuverleashlength = 640,
  maxDamage          = 4975,
  maxSlope           = 15,
  maxVelocity        = 1.98,
  maxWaterDepth      = 23,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[KBOT2]],
  name               = [[UPG Zeus]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[ARMZEUS1]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIG_UNIT]],
  side               = [[ARM]],
  sightDistance      = 331.5,
  smoothAnim         = true,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 2,
  turnRate           = 1056,
  unitname           = [[armzeus1]],
  upright            = true,
  workerTime         = 0,
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
      [[kbarmmov]],
    },
    select = {
      [[kbarmsel]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[LIGHTNING1]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  LIGHTNING1 = {
    areaOfEffect       = 8,
    beamWeapon         = true,
    color              = 128,
    color2             = 130,
    craterBoost        = 0,
    craterMult         = 0,
    duration           = 10,
    explosionGenerator = [[custom:ZEUS_FLASH]],
    fireStarter        = 50,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    intensity          = 12,
    lineOfSight        = true,
    name               = [[LightningGun]],
    noSelfDamage       = true,
    range              = 400,
    reloadtime         = 1.4,
    renderType         = 7,
    rgbColor           = [[0.5 0.5 1]],
    soundHit           = [[xplomed3]],
    soundStart         = [[lghthvy1]],
    soundTrigger       = true,
    startsmoke         = 1,
    targetMoveError    = 0.3,
    texture1           = [[lightning]],
    thickness          = 10,
    turret             = true,
    weaponType         = [[LightningCannon]],
    weaponVelocity     = 400,
    damage = {
      default            = 320,
      gunships           = 65,
      hgunships          = 65,
      l1bombers          = 65,
      l1fighters         = 65,
      l1subs             = 5,
      l2bombers          = 65,
      l2fighters         = 65,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 65,
      vtol               = 65,
      vtrans             = 65,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  ARMZEUS_DEAD = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Zeus Wreckage]],
    energy             = 0,
    featureDead        = [[ARMZEUS_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ARMZEUS_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  ARMZEUS_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Zeus Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 2,
    footprintZ         = 2,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[2X2E]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
