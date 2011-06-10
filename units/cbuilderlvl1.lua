-- UNITDEF -- CBUILDERLVL1 --
--------------------------------------------------------------------------------

local unitName = "cbuilderlvl1"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.0399,
  airHoverFactor     = 0,
  brakeRate          = 1.9285,
  buildCostEnergy    = 2660.895,
  buildCostMetal     = 946.175,
  buildDistance      = 100,
  builder            = true,
  buildTime          = 10207.125,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canReclaim         = true,
  canstop            = 1,
  category           = [[ALL NOTLAND MOBILE NOTSUB ANTIFLAME ANTIGATOR ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP]],
  collide            = false,
  cruiseAlt          = 90,
  description        = [[Combar Engineer]],
  designation        = [[GZ-MCA]],
  dontland           = 1,
  energyMake         = 25,
  energyStorage      = 100,
  energyUse          = 1.1,
  explodeAs          = [[BIG_UNITEX]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[air]],
  maxDamage          = 705.6,
  maxSlope           = 10,
  maxVelocity        = 10.773,
  maxWaterDepth      = 0,
  metalMake          = .2,
  metalStorage       = 50,
  name               = [[kalupper]],
  objectName         = [[CBuilderLvl1.s3o]],
  radarDistance      = 0,
  repairSpeed        = 35,
  selfDestructAs     = [[SMALLSHIP]],
  side               = [[CORE]],
  sightDistance      = 270,
  TEDClass           = [[CNSTR]],
  turnRate           = 353.78,
  unitname           = [[cbuilderlvl1]],
  workerTime         = 150,
  buildoptions = {
    [[corsolar]],
    [[cormex]],
    [[coraap]],
    [[cornanotc]],
    [[coreyes]],
    [[corshroud]],
    [[corfort]],
    [[corarad]],
    [[cormine2]],
    [[hllt]],
    [[corvipe]],
    [[cordoom]],
    [[corboucher]],
    [[cortoast]],
    [[madsam]],
    [[corflak]],
    [[cordl]],
    [[corca]],
    [[corhurc]],
    [[corvamp]],
    [[coraca]],
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
