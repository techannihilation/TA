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
  noIconDraw = true,
  priority   = 3,
}

groundFlashBigBlue = {
  life       = 50,
  size       = 160,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.5, 0.5, 1.0, 0.3},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.4},{0.5, 0.5, 1.0, 0.3}, },
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
}

groundFlashYellow = {
  life       = 50,
  size       = 100,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {1.0, 0.2, 0.2, 0.2},{1.0, 0.2, 0.2, 0.25},{1.0, 0.2, 0.2, 0.25},{1.0, 0.2, 0.2, 0.2}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}

groundFlashCorestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_corestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.15},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.15}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}
  
groundFlashArmestor = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/gf_armestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.2},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.2}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}

groundFlashCorses = {
  life       = 50,
  size       = 120,
  texture    = "bitmaps/GPL/Lups/gf_corestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.15},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.20},{0.9, 0.9, 0.0, 0.15}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}
groundFlashArmses = {
  life       = 50,
  size       = 120,
  texture    = "bitmaps/GPL/Lups/gf_armestor.png",
  colormap   = { {0.9, 0.9, 0.0, 0.2},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.3},{0.9, 0.9, 0.0, 0.2}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}
groundFlashJuno = {
  life       = 50,
  size       = 80,
  texture    = "bitmaps/GPL/Lups/groundflash.png",
  colormap   = { {0.55,0.55,0.9, 0.1}, {0.55,0.55,0.9, 0.12},{0.55,0.55,0.9, 0.12},{0.55,0.55,0.9, 0.1}, },
  repeatEffect = true,
  noIconDraw = true,
  priority = 3,
}
----------------------------------------------------------------------------
-- Lights ------------------------------------------------------------------
----------------------------------------------------------------------------

cmetelmakerlvl3Effect = {
  life       = math.huge,
  pos        = {0,160,0},
  size       = 120,
  sizeSpread = 10,
  colormap   = { {0.3, 0.3, 0.8, 0.01} },
  onActive   = true,
  texture    = 'bitmaps/flare.TGA',
  }

----------------------------------------------------------------------------
-- SHEILDS------------------------------------------------------------------
----------------------------------------------------------------------------

corshieldgenShieldSphere = {
  layer=-30,
  life=20,
  piece="shield_pos",
  size=14,
  colormap1 = { {0,0.65,0, 0.80},{0,0.75,0, 0.8},{0,0.65,0, 0.8},{0,0.75,0, 0.80} },
  colormap2 = { {0.89, 0.99, 0, 0.20},{0.99, 0.89, 0, 0.20},{0.89, 0.99, 0, 0.20},{0.99, 0.89, 0, 0.20} },
  repeatEffect=true
}
corsfusBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 180,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.45, 0.2, 1, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority  = 3,
  count      = 2,
}
exoarmBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 350,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.1, 0.55, 1, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 4,
}

armsmcBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 230,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 2,
}

armpraetBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 230,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 2,
}

monkeylordBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 230,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 2,
}

irritatorBursts = {
  layer      = -35,
  life       = math.huge,
  piece      = "shield_pos",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 230,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 2,
}

shieldBursts100 = {
  layer      = -35,
  life       = math.huge,
  piece      = "pelvis",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 100,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 1,
}

shieldBursts150 = {
  layer      = -35,
  life       = math.huge,
  piece      = "pelvis",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 150,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 2,
}

shieldBursts200 = {
  layer      = -35,
  life       = math.huge,
  piece      = "pelvis",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 200,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 3,
}

shieldBursts250 = {
  layer      = -35,
  life       = math.huge,
  piece      = "sphere",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 250,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 4,
}

shieldBursts340 = {
  layer      = -35,
  life       = math.huge,
  piece      = "base",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 340,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 8,
}

shieldBursts400 = {
  layer      = -35,
  life       = math.huge,
  piece      = "base",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 400,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 8,
}

shieldBursts1000 = {
  layer      = -35,
  life       = math.huge,
  piece      = "base",
  rotSpeed   = 0.50,
  rotSpread  = 0,
  arc        = 50,
  arcSpread  = 0,
  size       = 600,
  sizeSpread = 50,
  texture    = "bitmaps/GPL/Lups/shieldbursts5.png",
  colormap   = {{0.2, 1, 0.2, 0.1}, {1, 0.2, 0.2, 0.1}},
  directional= true,
  repeatEffect = true,
  noIconDraw = true,
  priority   = 3,
  count      = 10,
}

----------------------------------------------------------------------------
-- Fusion ------------------------------------------------------------------
----------------------------------------------------------------------------
plasmaball_fusion = {
  speed        = 0,
  speedSpread  = 0,
  layer        = -36,
  life         = 60,
  lifeSpread   = 30,
  partpos      = "0,0,0",
  rotSpeed     = 0.2,
  rotFactor    = 1.0,
  rotFactorSpread = -2.0,
  rotairdrag   = 0.99,
  rotSpread    = 360,
  sizeExp      = -2,
  sizeSpread   = -10,
  sizeGrowth   = -1,
  emitVector   = {0,0,0},
  emitRotSpread = 360,
  texture      = 'bitmaps/techa_artwork/lightningball.png',
  repeatEffect = true,
  noIconDraw = true,
  priority   = 1,
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
  noIconDraw = true,
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
  noIconDraw = true,
  priority   = 1,
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
  noIconDraw = true,
  priority   = 1,
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
  noIconDraw = true,
  priority   = 1,
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
  noIconDraw = true,
  priority   = 1,
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
  noIconDraw = true,
  priority   = 1,
  }
  
shield = {
  speed        = 0.2,
  speedSpread  = 0,
  life         = 300,
  lifeSpread   = 50,
  partpos      = "0,0,0",
  colormap     = { {0.0, 0.2, 0.0, 0.01}, {0.0, 0.07, 0.0, 0.00}, {0, 0.02, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, {0, 0, 0, 0.0}, },
  rotSpread    = 0,
  size         = 12,
  sizeSpread   = 0,
  sizeGrowth   = 0.4,
  emitVector   = {0,0,0},
  emitRotSpread = 70,
  texture      = 'bitmaps/ring.tga',
  count        = 6,
  repeatEffect = true,
  noIconDraw = true,
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
  noIconDraw = true,
  priority   = 1,
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
