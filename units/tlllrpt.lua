-- UNITDEF -- TLLLRPT --
--------------------------------------------------------------------------------

local unitName = "tlllrpt"

--------------------------------------------------------------------------------

local unitDef = {
  badTargetCategory  = [[LEVEL1]],
  bmcode             = 0,
  buildAngle         = 6700,
  buildCostEnergy    = 18951,
  buildCostMetal     = 5142,
  builder            = false,
  buildTime          = 91851,
  canAttack          = true,
  canGuard           = true,
  canstop            = 1,
  category           = [[TLL LEVEL3 WEAPON NOTAIR NOTSUB ]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  corpse             = [[dead]],
  defaultmissiontype = [[GUARD_NOMOVE]],
  description        = [[Long Range Plasma Canon]],
  designation        = [[]],
  energyMake         = 0,
  energyUse          = 0,
  explodeAs          = [[ATOMIC_BLAST]],
  firestandorders    = 1,
  firestate          = 2,
  footprintX         = 4,
  footprintZ         = 4,
  frenchdescription  = [[Canon à plasma de longue portée]],
  germandescription  = [[Langstrecken-Plasmakanone]],
  italiandescription = [[Cannone al plasma a lunga gittata]],
  maxDamage          = 5211,
  maxSlope           = 10,
  maxWaterDepth      = 0,
  name               = [[L.R.P.T.]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[TLLLRPT]],
  onoffable          = true,
  onlyTargetCategory = [[NOTAIR]],
  selfDestructAs     = [[ATOMIC_BLAST]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 210,
  spanishdescription = [[Cañón de plasma de largo alcance]],
  standingfireorder  = 2,
  threed             = 1,
  unitname           = [[tlllrpt]],
  unitnumber         = 820,
  version            = 3.1,
  yardMap            = [[oooooooooooooooo]],
  zbuffer            = 1,
  customparams = {
    canareaattack      = 1,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:berthaflare]],
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
      [[servlrg3]],
    },
    select = {
      [[servlrg3]],
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[ARM_BERTHACANNON]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARM_BERTHACANNON = {
    accuracy           = 300,
    aimrate            = 2500,
    areaOfEffect       = 192,
    ballistic          = true,
    craterBoost        = 0.25,
    craterMult         = 0.25,
    energypershot      = 3000,
    explosionGenerator = [[custom:FLASHBIGBUILDING]],
    gravityaffected    = [[true]],
    holdtime           = 1,
    impulseBoost       = 0.5,
    impulseFactor      = 0.5,
    leadBonus          = 0,
    name               = [[BerthaCannon]],
    noSelfDamage       = true,
    range              = 6200,
    reloadtime         = 11,
    renderType         = 4,
    soundHit           = [[xplonuk1]],
    soundStart         = [[xplonuk4]],
    startsmoke         = 1,
    turret             = true,
    weaponType         = [[Cannon]],
    weaponVelocity     = 1100,
    damage = {
      blackhydra         = 2800,
      default            = 1625,
      flakboats          = 2800,
      jammerboats        = 2800,
      l1subs             = 5,
      l2subs             = 5,
      l3subs             = 5,
      otherboats         = 2800,
      seadragon          = 2800,
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
    footprintZ         = 5,
    height             = 21,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[tlllrpt_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
  heap = {
    blocking           = false,
    category           = [[heaps]],
    damage             = unitDef.maxDamage*0.36,
    description        = [[wreckage]],
    featurereclamate   = [[smudge01]],
    footprintX         = 5,
    footprintZ         = 5,
    height             = 2,
    hitdensity         = 105,
    metal              = unitDef.buildCostMetal*0.64,
    object             = [[3x3D]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
