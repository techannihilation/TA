-- UNITDEF -- ARMUWFUS1 --
--------------------------------------------------------------------------------

local unitName = "armuwfus1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0,
  activateWhenBuilt  = true,
  bmcode             = 0,
  brakeRate          = 0,
  buildAngle         = 8192,
  buildCostEnergy    = 212600,
  buildCostMetal     = 14566,
  builder            = false,
  buildPic           = [[ARMUWFUS.DDS]],
  buildTime          = 225000,
  category           = [[ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR]],
  description        = [[Produces Highly Energy / Storage]],
  energyMake         = 4200,
  energyStorage      = 40000,
  explodeAs          = [[Nuclear_missile]],
  floater            = true,
  footprintX         = 10,
  footprintZ         = 8,
  iconType           = [[building]],
  idleAutoHeal       = 5,
  idleTime           = 1800,
  maxDamage          = 9800,
  maxSlope           = 10,
  maxVelocity        = 0,
  metalStorage       = 0,
  minWaterDepth      = 2,
  name               = [[Advanced Antimater Fusion]],
  noAutoFire         = false,
  objectName         = [[ARMUWFUS1]],
  script             = [[armuwfus1.cob]],
  seismicSignature   = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE1]],
  side               = [[ARM]],
  sightDistance      = 143,
  smoothAnim         = true,
  TEDClass           = [[ENERGY]],
  turnRate           = 0,
  unitname           = [[armuwfus1]],
  waterline          = 20,
  workerTime         = 0,
  yardMap            = [[wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww]],
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
      [[watfusn1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
