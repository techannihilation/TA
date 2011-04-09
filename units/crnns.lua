-- UNITDEF -- CRNNS --
--------------------------------------------------------------------------------

local unitName = "crnns"

--------------------------------------------------------------------------------

local unitDef = {
  activateWhenBuilt  = true,
  bmcode             = 0,
  buildAngle         = 16000,
  buildCostEnergy    = 199618,
  buildCostMetal     = 14318,
  builder            = false,
  buildTime          = 235000,
  category           = [[CORE LEVEL3 NOWEAPON NOTAIR NOTSUB]],
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  damageModifier     = 0.9,
  description        = [[Produces Highly Energy / Storage]],
  designation        = [[AE-CKF]],
  downloadable       = 1,
  energyStorage      = 40000,
  energyUse          = -4200,
  explodeAs          = [[Nuclear_Missile]],
  footprintX         = 10,
  footprintZ         = 8,
  frenchdescription  = [[Produit de l'énergie]],
  frenchname         = [[Réacteur nucléaire NS]],
  germandescription  = [[Liefert Energie]],
  germanname         = [[Fusionreaktor NS]],
  italiandescription = [[Produce energia]],
  italianname        = [[Reattore a Fusione NS]],
  maxDamage          = 10400,
  metalStorage       = 0,
  minWaterDepth      = 15,
  name               = [[Advanced Antimater Fusion]],
  noAutoFire         = false,
  noshadow           = 1,
  objectName         = [[crnns]],
  onoffable          = true,
  radarDistance      = 0,
  selfDestructAs     = [[NUCLEAR_MISSILE1]],
  side               = [[CORE]],
  sightDistance      = 210,
  spanishdescription = [[Genera energía]],
  spanishname        = [[Reactor de Fusión NS]],
  TEDClass           = [[ENERGY]],
  threed             = 1,
  unitname           = [[crnns]],
  unitnumber         = 233,
  version            = 1.2,
  waterline          = 10,
  workerTime         = 0,
  yardMap            = [[wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww]],
  zbuffer            = 1,
  sounds = {
    activate           = [[mohorun1]],
    canceldestruct     = [[cancel2]],
    deactivate         = [[mohooff1]],
    underattack        = [[warning1]],
    working            = [[mohorun1]],
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[twractv2]],
    },
    select = {
      [[mohoon1]],
    },
  },
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
