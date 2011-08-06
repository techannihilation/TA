-- UNITDEF -- CORBHMTH1 --
--------------------------------------------------------------------------------

local unitName = "corbhmth1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  badTargetCategory  = [[VTOL]],
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 52428,
  buildCostMetal     = 3949,
  builder            = false,
  buildPic           = [[CORBHMTH.DDS]],
  buildTime          = 59640,
  canAttack          = true,
  canstop            = 1,
  category           = [[ALL NOTLAND NOTSUB WEAPON NOTSHIP NOTAIR]],
  corpse             = [[corbhmth_dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Geothermal Long Range Plasma Battery]],
  energyMake         = 600,
  energyStorage      = 500,
  explodeAs          = [[LARGE_BUILDINGEX]],
  firestandorders    = 1,
  footprintX         = 5,
  footprintZ         = 5,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 7500,
  maxSlope           = 10,
  maxVelocity        = 0,
  maxWaterDepth      = 0,
  metalStorage       = 0,
  name               = [[LR Behemoth]],
  noAutoFire         = false,
  noChaseCategory    = [[MOBILE]],
  objectName         = [[CORBHMTH]],
  onoffable          = false,
  seismicSignature   = 0,
  selfDestructAs     = [[ESTOR_BUILDING]],
  side               = [[CORE]],
  sightDistance      = 650,
  smoothAnim         = true,
  standingfireorder  = 2,
  turnRate           = 0,
  unitname           = [[corbhmth1]],
  workerTime         = 0,
  yardMap            = [[ooooo ooooo ooGoo ooooo ooooo]],
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    select = {
      [[geothrm2]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[CORBHMTH_WEAPON2]],
      onlyTargetCategory = [[NOTAIR]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  CORBHMTH_WEAPON2 = {
    accuracy           = 780,
    areaOfEffect       = 192,
    ballistic          = true,
    craterBoost        = 0,
    craterMult         = 0,
    edgeEffectiveness  = 0.7,
    energypershot      = 200,
    explosionGenerator = [[custom:FLASHSMALLBUILDINGEX]],
    fireStarter        = 99,
    gravityaffected    = [[true]],
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    name               = [[PlasmaBattery]],
    noSelfDamage       = true,
    range              = 4000,
    reloadtime         = 1,
    renderType         = 4,
    soundHit           = [[xplolrg3]],
    soundStart         = [[xplonuk3]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 820,
    damage = {
      blackhydra         = 1350,
      commanders         = 900,
      default            = 1100,
      flakboats          = 1350,
      gunships           = 110,
      hgunships          = 110,
      jammerboats        = 1350,
      l1bombers          = 110,
      l1fighters         = 110,
      l1subs             = 5,
      l2bombers          = 110,
      l2fighters         = 110,
      l2subs             = 5,
      l3subs             = 5,
      otherboats         = 1350,
      seadragon          = 1350,
      vradar             = 110,
      vtol               = 110,
      vtrans             = 110,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  CORBHMTH_HEAP = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Behemoth Heap]],
    energy             = 0,
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 4,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[5X5C]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
  corbhmth_dead = {
    blocking           = true,
    category           = [[corpses]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[Behemoth Wreckage]],
    energy             = 0,
    featureDead        = [[CORBHMTH_HEAP]],
    featurereclamate   = [[SMUDGE01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 20,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[CORBHMTH_DEAD]],
    reclaimable        = true,
    seqnamereclamate   = [[TREE1RECLAMATE]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
