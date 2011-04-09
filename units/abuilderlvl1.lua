-- UNITDEF -- ABUILDERLVL1 --
--------------------------------------------------------------------------------

local unitName = "abuilderlvl1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0399,
  airHoverFactor     = 0,
  brakeRate          = 1.995,
  buildCostEnergy    = 2595.645,
  buildCostMetal     = 940.700,
  buildDistance      = 100,
  builder            = true,
  buildTime          = 10219.5225,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB ANTIFLAME ANTIGATOR ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  cruiseAlt          = 90,
  description        = [[Combat Engineer]],
  designation        = [[GZ-MCA]],
  dontland           = 1,
  energyMake         = 15,
  energyStorage      = 100,
  energyUse          = 1.1,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[air]],
  maxDamage          = 949.6,
  maxSlope           = 10,
  maxVelocity        = 10.773,
  maxWaterDepth      = 255,
  metalMake          = 0.2,
  metalStorage       = 50,
  name               = [[colipper]],
  objectName         = [[ABuilderLvl1]],
  radarDistance      = 0,
  repairSpeed        = 35,
  selfDestructAs     = [[SMALLSHIP]],
  side               = [[ARM]],
  sightDistance      = 270,
  TEDClass           = [[CNSTR]],
  turnRate           = 513.38,
  unitname           = [[abuilderlvl1]],
  workerTime         = 150,
  buildoptions = {
    [[armsolar]],
    [[armmex]],
    [[armaap]],
    [[armnanotc]],
    [[armeyes]],
    [[armveil]],
    [[armfort]],
    [[armarad]],
    [[armmine2]],
    [[tawf001]],
    [[armpb]],
    [[armanni]],
    [[armamb]],
    [[packo]],
    [[armflak]],
    [[armdl]],
    [[armca]],
    [[armpnix]],
    [[armhawk]],
    [[armaca]],
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
