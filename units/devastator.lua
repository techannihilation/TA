-- UNITDEF -- DEVASTATOR --
--------------------------------------------------------------------------------

local unitName = "devastator"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.11,
  badTargetCategory  = [[VTOL]],
  bmcode             = 1,
  brakeRate          = 0.07,
  buildCostEnergy    = 11596,
  buildCostMetal     = 1218,
  builder            = false,
  buildTime          = 27000,
  canAttack          = true,
  canGuard           = true,
  canHover           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  category           = [[ALL HOVER MOBILE WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Mobile Tachyon Hovercraft]],
  designation        = [[ARM-HG]],
  downloadable       = 1,
  energyMake         = 50,
  energyStorage      = 0,
  energyUse          = 51,
  explodeAs          = [[CRAWL_BLASTSML]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hovercraft annihilateur]],
  frenchname         = [[Devastator]],
  germandescription  = [[Annihilator hovercraft]],
  germanname         = [[Devastator]],
  maneuverleashlength = 640,
  maxDamage          = 1950,
  maxSlope           = 10,
  maxVelocity        = 1.47,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  mobilestandorders  = 1,
  movementClass      = [[TANKHOVER3]],
  name               = [[Destruitor]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[Devastator]],
  radarDistance      = 0,
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[ARM]],
  sightDistance      = 660,
  standingfireorder  = 2,
  standingmoveorder  = 1,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 250,
  unitname           = [[devastator]],
  unitnumber         = 01234,
  version            = 1.2,
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
      [[hovmdok1]],
    },
    select = {
      [[hovmdsl1]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ATAM]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 160,
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ATAM = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.3,
    coreThickness      = 0.3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 1000,
    explosionGenerator = [[custom:FLASH3blue]],
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 20,
    lineOfSight        = true,
    name               = [[ATAM]],
    noSelfDamage       = true,
    range              = 850,
    reloadtime         = 5.5,
    renderType         = 0,
    rgbColor           = [[0 0 1]],
    soundHit           = [[xplolrg1]],
    soundStart         = [[annigun1]],
    targetMoveError    = 0.3,
    thickness          = 5.5,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1500,
    damage = {
      blackhydra         = 4000,
      commanders         = 1000,
      default            = 2500,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
      seadragon          = 4000,
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
    description        = [[Destruitor Wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 3,
    footprintZ         = 3,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[armanac_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
