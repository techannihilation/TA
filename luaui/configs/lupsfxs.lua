VFS.Include("LuaRules/Utilities/tablefunctions.lua")

----------------------------------------------------------------------------
-- GROUNDFLASHES -----------------------------------------------------------
----------------------------------------------------------------------------

groundFlashBlue = {
  life       = 20,
  size       = 100,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.5, 0.5, 1.0, 0.3},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.3}, },
  repeatEffect = true,
}

groundFlashBigBlue = {
  life       = 50,
  size       = 160,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.5, 0.5, 1.0, 0.3},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.3}, },
  repeatEffect = true,
}

groundFlashYellow = {
  life       = 50,
  size       = 100,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {1.0, 0.2, 0.2, 0.2},{1.0, 0.2, 0.2, 0.25},{1.0, 0.2, 0.2, 0.25},{1.0, 0.2, 0.2, 0.2}, },
  repeatEffect = true,
}

groundFlashCorestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_corestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.15},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.15}, },
  repeatEffect = true,
}
  
groundFlashArmestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_armestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.2},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.2}, },
  repeatEffect = true,
}

groundFlashCorses = {
  life       = 50,
  size       = 120,
  texture    = "bitmaps/GPL/Lups/gf_corestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.15},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.15}, },
  repeatEffect = true,
}
groundFlashArmses = {
  life       = 50,
  size       = 120,
  texture    = "bitmaps/GPL/Lups/gf_armestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.2},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.2}, },
  repeatEffect = true,
}
groundFlashJuno = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.55,0.55,0.9, 0.1}, {0.55,0.55,0.9, 0.12},{0.55,0.55,0.9, 0.12},{0.55,0.55,0.9, 0.1}, },
  repeatEffect = true,
}
----------------------------------------------------------------------------
-- SHEILDS------------------------------------------------------------------
----------------------------------------------------------------------------

corshieldgenShieldSphere = {
  layer=-35,
  life=20,
  piece="sphere",
  layer=-16,
  size=14,
  colormap1 = { {0,0.65,0, 0.80},{0,0.75,0, 0.8},{0,0.65,0, 0.8},{0,0.75,0, 0.80} },
  colormap2 = { {0.89, 0.99, 0, 0.20},{0.99, 0.89, 0, 0.20},{0.89, 0.99, 0, 0.20},{0.99, 0.89, 0, 0.20} },
  repeatEffect=true
  }

----------------------------------------------------------------------------
-- Fusion ------------------------------------------------------------------
----------------------------------------------------------------------------
  
plasmaball_corfus = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 19,
  sizeSpread   = 10,
  sizeGrowth   = 0.74,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 2,
  repeatEffect = true,
  }
  
plasmaball_corsfus = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 30,
  sizeSpread   = 10,
  sizeGrowth   = 0.74,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 3,
  repeatEffect = true,
  }
  
plasmaball_cafus = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 20,
  sizeSpread   = 10,
  sizeGrowth   = 0.74,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 3,
  repeatEffect = true,
  }
  
plasmaball_crnns = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 24,
  sizeSpread   = 10,
  sizeGrowth   = 0.74,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 3,
  repeatEffect = true,
  }
  
plasmaball_cfusionplant = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {0.1, 0.1, 0.4, 0.008}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.008}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 48,
  sizeSpread   = 10,
  sizeGrowth   = 0.74,
  emitVector   = {0,0,0},
  emitRotSpread = 360,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 5,
  repeatEffect = true,
  }
  
plasmaball_tllmedfusion = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 51,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}, },
  rotSpeed     = 0.2,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  sizeExp      = -2,
  size         = 38,
  sizeSpread   = -10,
  sizeGrowth   = -1,
  emitVector   = {0,0,0},
  emitRotSpread = 360,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 2,
  repeatEffect = true,
  }
  
plasmaball_tllcoldfus = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 51,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}, },
  rotSpeed     = 0.2,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  sizeExp      = -2,
  size         = 45,
  sizeSpread   = -10,
  sizeGrowth   = -1,
  emitVector   = {0,0,0},
  emitRotSpread = 360,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 2,
  repeatEffect = true,
  }
  
plasmaball_tllmegacoldfus = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 51,
  lifeSpread   = 20,
  partpos      = "0,0,0",
  colormap     = { {1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}, },
  rotSpeed     = 0.2,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  sizeExp      = -2,
  size         = 70,
  sizeSpread   = -10,
  sizeGrowth   = -1,
  emitVector   = {0,0,0},
  emitRotSpread = 360,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  count        = 2,
  repeatEffect = true,
  }
----------------------------------------------------------------------------
-- Other -------------------------------------------------------------------
----------------------------------------------------------------------------
junoShieldSphere = {
  layer=-35,
  life=20,
  pos = {0,76,0},
  size=13,
  colormap1 = { {0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8} },
  colormap2 = { {0, 0, 0, 1},{0, 0, 0, 1},{0, 0, 0, 1},{0, 0, 0, 1} },
  repeatEffect=true
}

tlljunoShieldSphere = {
  layer=-35,
  life=20,
  pos = {0,60,0},
  size=10,
  colormap1 = { {0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8},{0.55,0.55,0.9, 0.8} },
  colormap2 = { {0, 0, 0, 1},{0, 0, 0, 1},{0, 0, 0, 1},{0, 0, 0, 1} },
  repeatEffect=true
}
roostDirt = {
  layer        = 10,
  speed        = 0,
  speedSpread  = 0.45,
  life         = 170,
  lifeSpread   = 10,
  partpos      = "x,0,z | alpha=(i/6)*pi*2, r=5+rand()*10, x=r*cos(alpha),z=r*sin(alpha)",
  colormap     = { {0, 0, 0, 0.02}, {0.28, 0.30, 0.30, 0.5}, {0.25, 0.25, 0.30, 0.5}, {0, 0, 0, 0.02} },
  rotSpeed     = 0.3,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 30,
  sizeSpread   = 10,
  sizeGrowth   = 0.08,
  emitVector   = {0,1,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/GPL/smoke_orange.png',
  count        = 5,
  repeatEffect = true,
  }

sparks = {
  speed        = 0,
  speedSpread  = 0,
  life         = 90,
  lifeSpread   = 10,
  partpos      = "x,0,0 | if(rand()*2>1) then x=0 else x=20 end",
  colormap     = { {0.8, 0.8, 0.8, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 10,
  sizeSpread   = 12,
  sizeGrowth   = 0.4,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/PD/Lightningball.TGA',
  count        = 6,
  repeatEffect = true,
  }
  
sparks1 = {
  speed        = 0,
  speedSpread  = 0,
  life         = 20,
  lifeSpread   = 20,
  partpos      = "5-rand()*10, 5-rand()*10, 5-rand()*10 ",
  --partpos      = "0,0,0",
  colormap     = { {0.8, 0.8, 0.2, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 10,
  sizeSpread   = 12,
  sizeGrowth   = 0.4,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/PD/Lightningball.TGA',
  count        = 6,
  repeatEffect = true,
  }
  
sparksr1 = {
  speed        = 0,
  speedSpread  = 0,
  life         = 35,
  lifeSpread   = 20,
  partpos      = "5-rand()*10, 5-rand()*10, 5-rand()*10 ",
  --partpos      = "0,0,0",
  colormap     = { {0.4, 0.4, 0.4, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 10,
  sizeSpread   = 6,
  sizeGrowth   = 0.4,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/PD/Lightningball.TGA',
  count        = 6,
  repeatEffect = true,
  }
  
sparksr2 = {
  speed        = 0,
  speedSpread  = 0,
  life         = 43,
  lifeSpread   = 20,
  partpos      = "5-rand()*10, 5-rand()*10, 5-rand()*10 ",
  --partpos      = "0,0,0",
  colormap     = { {0.6, 0.6, 0.6, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 10,
  sizeSpread   = 12,
  sizeGrowth   = 0.4,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/PD/Lightningball.TGA',
  count        = 6,
  repeatEffect = true,
  }
  
sparksr3 = {
  speed        = 0,
  speedSpread  = 0,
  life         = 50,
  lifeSpread   = 20,
  partpos      = "5-rand()*10, 5-rand()*10, 5-rand()*10 ",
  partpos      = "0,24,0",
  colormap     = { {0.8, 0.8, 0.8, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 12,
  sizeSpread   = 12,
  sizeGrowth   = 0.5,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/PD/Lightningball.TGA',
  count        = 8,
  repeatEffect = true,
  }
  
shield = {
  speed        = 0.6,
  speedSpread  = 0,
  life         = 60,
  lifeSpread   = 10,
  partpos      = "0,0,0",
  colormap     = { {0.0, 0.2, 0.0, 0.01}, {0.0, 0.07, 0.0, 0.00}, {0, 0.02, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpread    = 0,
  size         = 12,
  sizeSpread   = 0,
  sizeGrowth   = 2,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/ring.tga',
  count        = 6,
  repeatEffect = true,
  }
  
corgensparks = {
  speed        = 0,
  speedSpread  = 0,
  life         = 30,
  lifeSpread   = 20,
  partpos      = "0,24,0",
  colormap     = { {0.6, 0.6, 0.0, 0.01}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpeed     = 0.1,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  size         = 13,
  sizeSpread   = 12,
  sizeGrowth   = 0.5,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/Emg.tga',
  count        = 8,
  repeatEffect = true,
  }
  
armamakerEffect = {
  life       = math.huge,
  pos        = {0,24,0},
  size       = 30,
  sizeSpread = 7,
  colormap   = { {0.8, 0.8, 0.4, 0.01} },
  onActive   = true,
  texture    = 'bitmaps/flash1.TGA',
  }

armgenEffect = {
  life       = math.huge,
  pos        = {-2,33,2},
  size       = 12,
  sizeSpread = 7,
  colormap   = { {0.9, 0.9, 0.5, 0.01} },
  onActive   = true,
  texture    = 'bitmaps/flare.TGA',
  }