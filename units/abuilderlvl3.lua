-- UNITDEF -- ABUILDERLVL3 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl3"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0133,
  airHoverFactor     = 0,
  brakeRate          = 1.9970,
  buildCostEnergy    = 500000.235,
  buildCostMetal     = 24500.7225,
  buildDistance      = 180,
  builder            = true,
  buildTime          = 340000.000,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[BIG UNIT]],
  collide            = false,
  corpse             = [[dead]],
  cruiseAlt          = 180,
  description        = [[cruiser]],
  designation        = [[ARM-SS-SUP]],
  dontland           = 0,
  energyMake         = 50,
  energyStorage      = 750,
  energyUse          = 30,
  explodeAs          = [[SHIPBLAST]],
  footprintX         = 3,
  footprintZ         = 5,
  iconType           = [[air]],
  maxDamage          = 7000.0,
  maxSlope           = 10,
  maxVelocity        = 4.256,
  maxWaterDepth      = 0,
  metalMake          = 3.75,
  metalStorage       = 100,
  name               = [[Builder Level 3]],
  objectName         = [[ABuilderLvl3]],
  radarDistance      = 0,
  selfDestructAs     = [[SHIPBLAST]],
  side               = [[ARM]],
  sightDistance      = 400,
  turnRate           = 199.50,
  unitname           = [[abuilderlvl3]],
  workerTime         = 2000,
  buildoptions = {
    [[afusionplant]],
    [[ametalmakerlvl2]],
    [[ananotower]],
    [[ashipyardlvl3]],
    [[armgate1]],
    [[armbrtha1]],
    [[armvulc1]],
    [[armshltx1]],
    [[armtabi]],
    [[armanni1]],
    [[armfsilo]],
    [[armamd2]],
    [[armmas]],
    [[corpre]],
    [[cadvmsto]],
  },
  sounds = {
    canceldestruct     = [[cancel2]],
    underattack        = [[warning1]],
    arrived = {
      [[armshipstop]],
    },
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
      [[armshipgo]],
    },
    select = {
      [[armselect]],
    },
  },
}


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    blocking           = false,
    category           = [[arm_corpses]],
    damage             = unitDef.maxDamage*0.6,
    description        = [[Reliance Wreck]],
    featurereclamate   = [[smudge01]],
    footprintX         = 4,
    footprintZ         = 8,
    height             = 40,
    hitdensity         = 100,
    metal              = unitDef.buildCostMetal*0.8,
    object             = [[ABuilderLvl3_dead]],
    reclaimable        = true,
    seqnamereclamate   = [[tree1reclamate]],
    world              = [[All Worlds]],
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
