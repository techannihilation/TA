-- UNITDEF -- TLLOBLITERATOR --
--------------------------------------------------------------------------------

local unitName = "tllobliterator"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  buildAngle         = 4096,
  buildCostEnergy    = 18025,
  buildCostMetal     = 3456,
  builder            = false,
  buildTime          = 52513,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  damageModifier     = 0.2,
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Energy weapon]],
  designation        = [[]],
  energyStorage      = 120,
  energyUse          = 150,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 4,
  frenchdescription  = [[Canon à énergie]],
  germandescription  = [[Feuert Energiegeschosse]],
  italiandescription = [[Arma energetica]],
  maxDamage          = 16685,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[Obliterator]],
  noAutoFire         = false,
  objectName         = [[TLLOBLITERATOR]],
  onoffable          = true,
  radarDistance      = 650,
  selfDestructAs     = [[CRAWL_BLASTSML]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 680,
  spanishdescription = [[Arma de Energía]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tllobliterator]],
  unitnumber         = 813,
  version            = 1,
  yardMap            = [[ooooo ooooo ooooo ooooo]],
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
      [[anni]],
    },
    select = {
      [[anni]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ATADR]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ATADR = {
    areaOfEffect       = 12,
    beamlaser          = 1,
    beamTime           = 0.9,
    coreThickness      = 0.3,
    craterBoost        = 0,
    craterMult         = 0,
    energypershot      = 1000,
    explosionGenerator = [[custom:FLASH3blue]],
    impactonly         = 1,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    laserFlareSize     = 22,
    lineOfSight        = true,
    name               = [[ATAD]],
    noSelfDamage       = true,
    range              = 1200,
    reloadtime         = 8.5,
    renderType         = 0,
    rgbColor           = [[0 0 1]],
    soundHit           = [[xplosml3]],
    soundStart         = [[annigun1]],
    targetMoveError    = 0.3,
    thickness          = 5.5,
    tolerance          = 10000,
    turret             = true,
    weaponType         = [[BeamLaser]],
    weaponVelocity     = 1500,
    damage = {
      blackhydra         = 7500,
      commanders         = 999,
      default            = 7600,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
      seadragon          = 7500,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = true,
    category           = [[tll_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[wreckage]],
    featureDead        = [[heap]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tllobliterator_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featureDead        = [[heap2]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 4,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[4x4C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap2 = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.216,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 4,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.512,
    object             = [[3x3C]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
