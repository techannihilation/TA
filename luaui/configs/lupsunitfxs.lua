-- note that the order of the MergeTable args matters for nested tables (such as colormaps)!


effectUnitDefs = {
 ---- FUSIONS ----------------------------

--GOK
gok_meteor = {
  {class='AirJet',options={color={0.9,0.15,0.75}, emitVector = {0,-1,0}, width=10, length=10000, piece="light", noIconDraw = true, priority=1, onActive=true}},
},
gok_meteor2 = {
  {class='AirJet',options={color={0.9,0.15,0.75}, emitVector = {0,-1,0}, width=12, length=10000, piece="light", noIconDraw = true, priority=1, onActive=true}},
},
gok_meteor1 = {
  {class='AirJet',options={color={0.9,0.15,0.75}, emitVector = {0,-1,0}, width=15, length=10000, piece="light", noIconDraw = true, priority=1, onActive=true}},
},
 gok_gen = {
 {class='SimpleParticles2', options=MergeTable({pos={0,12.5,0}, delay=0, count=10, colormap={{0.78, 0.08, 0.52, 0.005}, {0.5, 0.05, 0.38, 0.01}, {0.2, 0.0, 0.09, 0.005}}},goklight_gen)},
 {class='AirJet',options={color={0.78,0.08,0.55}, emitVector = {0,-1,0}, width=14, length=40, piece="base", noIconDraw = true, priority=2}},
},
gok_fusion = {
  {class='SimpleParticles2', options=MergeTable({pos={0,25,0}, delay=0, count=10, colormap={{0.68, 0.06, 0.46, 0.005}, {0.5, 0.05, 0.38, 0.01}, {0.2, 0.0, 0.09, 0.005}}},goklight_gen)},
  {class='AirJet',options={color={0.78,0.08,0.55}, emitVector = {0,-1,0}, width=22, length=85, piece="base", noIconDraw = true, priority=2}},
},
gok_sfusion = {
  {class='SimpleParticles2', options=MergeTable({pos={0,50,0}, delay=0, size=10, count=10, colormap={{0.68, 0.06, 0.46, 0.005}, {0.5, 0.05, 0.38, 0.01}, {0.2, 0.0, 0.09, 0.005}}},goklight_fusion)},
  {class='AirJet',options={color={0.78,0.08,0.55}, emitVector = {0,-1,0}, width=26, length=100, piece="base", noIconDraw = true, priority=2}},
},
gok_efusion = {
{class='SimpleParticles2', options=MergeTable({pos={0,90,0}, delay=0, count=10, colormap={{0.68, 0.06, 0.46, 0.005}, {0.5, 0.05, 0.38, 0.01}, {0.2, 0.0, 0.09, 0.005}}},goklight_fusion)},
{class='AirJet',options={color={0.78,0.08,0.55}, emitVector = {0,-1,0}, width=32, length=200, piece="base", noIconDraw = true, priority=2}},
},
gok_ufusion = {
{class='SimpleParticles2', options=MergeTable({pos={0,125,0}, delay=0, count=12, colormap={{0.68, 0.06, 0.46, 0.005}, {0.5, 0.05, 0.38, 0.01}, {0.2, 0.0, 0.09, 0.005}}},goklight_advfusion)},
{class='AirJet',options={color={0.78,0.08,0.55}, emitVector = {0,-1,0}, width=48, length=350, piece="base", noIconDraw = true, priority=2}},
},
--TALON
talon_gen = {
	{class='SimpleParticles2', options=MergeTable({pos={0,28,0}, delay=0, size=15, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_gen)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,28,0}, size=6, precision=22, repeatEffect=true}},
},
  talon_ckfus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,40,6}, delay=0, size=60, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,40,6}, size=16, precision=22, repeatEffect=true}},
},
talon_uwfus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,60,6}, delay=0, size=45, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,60,6}, size=12, precision=22, repeatEffect=true}},
},
talon_uwefus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,80,0}, delay=0, size=80, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,60,6}, size=12, precision=22, repeatEffect=true}},
},
talon_afus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,55,10}, delay=0, size=80, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={0,55,10}, delay=60, size=55, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,55,10}, size=20, precision=22, repeatEffect=true}},
},
talon_sfus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,55,0}, delay=0, size=80, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={0,55,0}, delay=60, size=50, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,55,10}, size=18, precision=22, repeatEffect=true}},
},
talon_efus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,60,0}, delay=0, size=150, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={0,60,0}, delay=60, size=90, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,60,0}, size=35, precision=22, repeatEffect=true}},
},

talon_ufus = {
	{class='SimpleParticles2', options=MergeTable({pos={0,240,0}, delay=0, size=180, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={0,240,0}, delay=60, size=120, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,240,0}, size=40, precision=22, repeatEffect=true}},
	--1
	{class='SimpleParticles2', options=MergeTable({pos={0,105,135}, delay=0, size=100, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={0,105,135}, delay=60, size=60, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,105,135}, size=20, precision=22, repeatEffect=true}},
	--2
	{class='SimpleParticles2', options=MergeTable({pos={105,105,-60}, delay=0, size=100, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={105,105,-60}, delay=60, size=60, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={105,105,-60}, size=20, precision=22, repeatEffect=true}},
	--3
	{class='SimpleParticles2', options=MergeTable({pos={-105,105,-60}, delay=0, size=100, count=3, colormap={{0.1, 0.9, 1.0, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='SimpleParticles2', options=MergeTable({pos={-105,105,-60}, delay=60, size=60, count=2, colormap={{0.6, 1.0, 0.70, 0.005}, {0.2, 0.55, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},sunlight_fusion)},
	{class='ShieldJitter',options={life=math.huge, priority=2, pos={-105,105,-60}, size=20, precision=22, repeatEffect=true}},
},
portal = { --pos={0,75,-65}
  {class='SimpleParticles2', options=MergeTable({pos={0,0,-55}, piece="teleport3", onoff=true, delay=0, size=130, count=2, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.4, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
  {class='SimpleParticles2', options=MergeTable({pos={0,0,-55},piece="teleport3", onoff=true, delay=40, size=130, count=2, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.3, 0.6, 0.01}, {0.4, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
  {class='ShieldJitter',options={life=math.huge, priority=1, onoff=true, pos={0,0,-55},piece="teleport3", size=50, precision=22, repeatEffect=true}},
  {class='GroundFlash',options=groundFlashBigBlue},
},
cafus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,58.9,-4.5}, priority=1, delay=0, size=85, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,58.9,-4,5}, priority=1, delay=25, size=50, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={priority=2,layer=-16, life=math.huge, pos={0,58.9,-4.5}, size=24.5, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },

  corgen = {
    {class='SimpleParticles2', options=MergeTable({pos={0,25,0}, delay=0, size=30, count=2, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,25,0}, size=10, precision=20, repeatEffect=true}},
    --{class='GroundFlash',options=groundFlashBlue},
  },
  corfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,50,-5}, delay=0, size=70, count=2, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,50,-5}, delay=40, size=70, count=2, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=1, pos={0,50,-5}, size=25, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },
  crnns = {
    {class='SimpleParticles2', options=MergeTable({pos={-9,26.9,0}, delay=0, size=75, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={-9,26.9,0}, delay=40, size=75, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-9,26.9,0}, size=29, precision=22, repeatEffect=true}},
  },
  corefus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,120,0}, delay=0, size=140, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,120,0}, delay=40, size=140, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,120,0}, size=44, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },
  cfusionplant = {
    {class='SimpleParticles2', options=MergeTable({pos={0,60,0}, delay=0, size=100, count=5, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,60,0}, delay=40, size=100, count=5, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,60,0}, size=28, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBigBlue},
  },
  corufus = {
    {class='StaticParticles',options=cmetelmakerlvl3Effect},
    {class='SimpleParticles2', options=MergeTable({pos={0,340,-30}, delay=0, size=280, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,340,-30}, delay=40, size=280, count=3, colormap={{0.1, 0.1, 0.4, 0.005}, {0.2, 0.2, 0.6, 0.01}, {0.1, 0.1, 0.4, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,340,-30}, size=150, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },
  tllmedfusion = {
    {class='SimpleParticles2', options=MergeTable({pos={-20,40,24}, delay=0, size=38, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={-20,40,24}, delay=40, size=38, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-20,40,24}, size=13.9, precision=22, repeatEffect=true}},
  },
  tllcoldfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,62,0}, delay=0, size=45, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,62,0}, delay=40, size=45, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,62,0}, size=20, precision=22, repeatEffect=true}},
  },
  tllefus = {
    {class='SimpleParticles2', options=MergeTable({piece="emit1", delay=0, size=80, count=1, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({piece="emit1", delay=40, size=80, count=1, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, piece="emit1", size=50, precision=22, repeatEffect=true}},
    {class='SimpleParticles2', options=MergeTable({piece="emit2", delay=0, size=112, count=1, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({piece="emit2", delay=40, size=112, count=1, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, piece="emit2", size=50, precision=22, repeatEffect=true}},
  },
  tllmegacoldfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,90,0}, delay=0, size=70, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,90,0}, delay=40, size=70, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,90,0}, size=30.9, precision=22, repeatEffect=true}},
  },
  tllufus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,180,0}, delay=0, size=160, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='SimpleParticles2', options=MergeTable({pos={0,180,0}, delay=40, size=160, count=2, colormap={{1.0, 0.1, 0.1, 0.005}, {0.9, 0.5, 0.2, 0.01}, {1.0, 0.1, 0.1, 0.005}}},plasmaball_fusion)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,180,0}, size=75, precision=22, repeatEffect=true}},
  },
  aafus = {
    {class='SimpleParticles2', options=MergeTable({pos={-38,70,-10}, delay=10, lifeSpread=300},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={21,70,-10}, delay=60, lifeSpread=300},sparks)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-31,55,-10}, size=12, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={31,55,-10}, size=12, precision=22, repeatEffect=true}},
  },
  afusionplant = {
    {class='SimpleParticles2', options=MergeTable({pos={-8,80,35}, delay=10, lifeSpread=400},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={-8,80,-35}, delay=70, lifeSpread=400},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={48,80,-5}, delay=40, lifeSpread=400},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={-70,80,-5}, delay=100, lifeSpread=400},sparks)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={2,68,37}, size=12, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={2,68,-32}, size=12, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={63,68,0}, size=12, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-60,68,0}, size=12, precision=22, repeatEffect=true}},
  },
  armefus = {
    {class='SimpleParticles2', options=MergeTable({pos={-67.2,112,32}, delay=10, lifeSpread=300},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={44.8,112,32}, delay=10, lifeSpread=300},sparks)},
	  {class='SimpleParticles2', options=MergeTable({pos={-19.2,128,-65.28}, delay=10, lifeSpread=300},sparks)},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-56,104,32}, size=18, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={56,104,32}, size=18, precision=22, repeatEffect=true}},
	  {class='ShieldJitter',options={life=math.huge, priority=2, pos={0,104,-64}, size=18, precision=22, repeatEffect=true}},
  },
  armufus = {
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={80,220,80}, size=35, precision=20, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={80,220,-80}, size=35, precision=20, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-80,220,-80}, size=35, precision=20, repeatEffect=true}},
    {class='ShieldJitter',options={life=math.huge, priority=2, pos={-80,220,80}, size=35, precision=20, repeatEffect=true}},
  },

  ---- SHIELDS ----------------------------
  corshieldgen = {
    {class='ShieldSphere',options=corshieldgenShieldSphere},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
   armshieldgen = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_shieldgen = {
   {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllmako = {
     {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
 },
 gok_valefor = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
},
 gok_bats = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
},
  tllgorgon = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,22,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corsingularity = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,22,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armbeetle = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,22,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_seth = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,22,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armexo = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_mythril = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_repentance = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_satan = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_azaroth = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armpraet = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=230, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_boxer = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=230, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_archon = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=230, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  cormonkeylord = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=230, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corcrab = {
    {class='ShieldSphere',options=corcrabSphere},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=180, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_gala = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=180, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_mcv2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_ucp = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=180, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllirritator = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=230, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T1 Gate
  armgate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corgate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllgate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_gate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_gate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_gate2 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=300, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  -- T2 GATE
  rumad_gate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_gate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_gate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T2 SEA GATE
  tllfgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_fgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_fgate = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armflosh = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corflshd = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=400, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T3 GATE
  armgate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corgate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllgate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_gate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_gate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_gate4 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T3 SEA GATE
  armfgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corfgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllfgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_fgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_fgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=700, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T4 GATE
  armgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllgate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_gate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_gate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_gate1 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  --T5 GATE
  armgate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={30,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  corgate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={-30,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  tllgate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_gate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_gate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  rumad_gate3 = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,0,0}, size=2200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  -- Special Blue Shied
  talon_obelisk = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=350, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  talon_pyramid = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,5,0.0}, size=1000, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_satan = {
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_eck = {
   {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
   },
   gok_antichrist = {
      {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  armvengence = {
     {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
   },

  ---- OTHER ----------------------------
 cjuno = {
    {class='ShieldSphere',options=junoShieldSphere, priority=1},
    {class='GroundFlash',options=groundFlashJuno},
  },
 ajuno = {
    {class='ShieldSphere',options=junoShieldSphere, priority=1},
    {class='GroundFlash',options=groundFlashJuno},
  },
 tlljuno = {
    {class='ShieldSphere',options=tlljunoShieldSphere, priority=1},
    {class='GroundFlash',options=groundFlashJuno},
  },
 talon_juno = {
    {class='ShieldSphere',options=tlljunoShieldSphere, priority=1},
    {class='GroundFlash',options=groundFlashJuno},
  },

  ---- ENERGY STORAGE ----------------------

 corestor = {
    {class='GroundFlash',options=groundFlashCorestor},
  },
 armestor = {
    {class='GroundFlash',options=groundFlashArmestor},
  },
 corses = {
    {class='GroundFlash',options=groundFlashCorses},
  },
 armses = {
    {class='GroundFlash',options=groundFlashArmses},
  },

  -- PLANES
  gok_angel = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=3, length=28, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=3, length=28, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_sucub = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=2, length=24, piece="thrust1a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=2, length=24, piece="thrust2a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=2, length=24, piece="thrust1b", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=2, length=24, piece="thrust2b", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_wraith  = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=4, length=36, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=4, length=36, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_zakul  = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=6, length=42, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_dirgesinger = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=5, length=36, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_hookah = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=6, length=45, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  gok_nurgle = {
    {class='AirJet',options={color={0.78, 0.08, 0.52}, width=8, length=54, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armatlas = {
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet3", noIconDraw = true, priority=3, onActive=true}},
  },
  armlift = {
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer4", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer5", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=8, length=50, emitVector = {0,1,0}, piece="flamer6", noIconDraw = true, priority=3, onActive=true}},
  },
  armnomad = {
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame4", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame5", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.8,0.2,0}, width=10, length=40, emitVector = {0,1,0}, piece="flame6", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_research_lvl1 = {
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="fthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="bthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_thirdeye = {
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="fthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=50, emitVector = {0,1,0}, piece="bthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_ap = {
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_ca = {
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2.5, length=25, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_aca = {
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust11", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust12", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust21", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust22", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_engineera = {
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_eca = {
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust11", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust12", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust21", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust22", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=30, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_builderlvl5 = {
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust1a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust1b", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust2a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust2b", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust3a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust3b", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust4a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=35, emitVector = {0,1,0}, piece="thrust4b", noIconDraw = true, priority=3, onActive=true}},
  },
  rumad_overlord = {
    {class='AirJet',options={color={1,1,1}, width=2, length=15, emitVector = {0,0,1}, piece="thrust11", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2, length=15, emitVector = {0,0,1}, piece="thrust12", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2, length=15, emitVector = {0,0,1}, piece="thrust21", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=2, length=15, emitVector = {0,0,1}, piece="thrust22", noIconDraw = true, priority=3, onActive=true}},
  },
  corseahook = {
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=6, length=20, emitVector = {0,1,0}, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=6, length=20, emitVector = {0,1,0}, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=6, length=20, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=6, length=20, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },

  talon_rukh = {
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=5, length=20, emitVector = {0,1,0}, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=5, length=20, emitVector = {0,1,0}, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=5, length=20, emitVector = {0,1,0}, piece="jet3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=5, length=20, emitVector = {0,1,0}, piece="jet4", noIconDraw = true, priority=3, onActive=true}},
  },
talon_tau = {
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=8, length=35, emitVector = {0,1,0}, piece="eng1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=8, length=35, emitVector = {0,1,0}, piece="eng2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=6, length=30, emitVector = {0,1,0}, piece="eng3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=6, length=30, emitVector = {0,1,0}, piece="eng4", noIconDraw = true, priority=3, onActive=true}},
  },
talon_plutor = {
      {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=16, length=55, emitVector = {0,0,-1}, piece="rengine", noIconDraw = true, priority=3, onActive=true}},
      {class='ThundAirJet',options={color={0.2,0.9,1.0}, width=16, length=55, emitVector = {0,0,-1}, piece="lengine", noIconDraw = true, priority=3, onActive=true}},
    },

talon_ca = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=20, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=20, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
  },
talon_medic = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=20, piece="emit", noIconDraw = true, priority=3, onActive=true}},
  },
talon_aca = {
    {class='AirJet',options={color={0.2,0.9,1}, width=4, length=17, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.2,0.9,1}, width=4, length=17, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
  },
talon_eca = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=20, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.2,0.9,1}, width=4, length=17, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.2,0.9,1}, width=4, length=17, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
  },
talon_wyvern = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3.25, length=25, piece="emit", noIconDraw = true, priority=3, onActive=true}},
  },
talon_token = {
    {class='AirJet',options={color={0.2,0.9,1}, width=2, length=23, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.2,0.9,1}, width=2, length=23, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
  },
talon_echelon = {
    {class='AirJet',options={color={0.2,0.9,1}, width=2, length=30, piece="emit", noIconDraw = true, priority=3, onActive=true}},
  },
talon_hornet = {
    {class='AirJet',options={color={0.2,0.9,1}, width=2, length=30, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.2,0.9,1}, width=2, length=30, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.2,0.9,1}, width=2, length=30, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.2,0.9,1}, width=2, length=30, piece="emit4", noIconDraw = true, priority=3, onActive=true}},
  },
talon_shade = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=30, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=30, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=3, length=30, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=3, length=30, piece="emit4", noIconDraw = true, priority=3, onActive=true}},
  },
talon_eclipse = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3.5, length=35, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3.5, length=35, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=3.5, length=35, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=3.5, length=35, piece="emit4", noIconDraw = true, priority=3, onActive=true}},
  },
talon_handgod = {
    {class='AirJet',options={color={0.3,0.1,0}, width=5, length=40, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=5, length=40, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=5, length=40, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.3,0.1,0}, width=5, length=40, piece="emit4", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.2,0.9,1}, width=3, length=30, piece="emit5", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.2,0.9,1}, width=3, length=30, piece="emit6", noIconDraw = true, priority=3, onActive=true}},
  },
  armor = {
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet4", noIconDraw = true, priority=3, onActive=true}},
  },
  corbtrans = {
    {class='ThundAirJet',options={color={0.9,0.3,0}, width=7, length=35, emitVector = {0,1,0}, piece="flthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.9,0.3,0}, width=7, length=35, emitVector = {0,1,0}, piece="frthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.9,0.3,0}, width=7, length=35, emitVector = {0,1,0}, piece="blthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.9,0.3,0}, width=7, length=35, emitVector = {0,1,0}, piece="brthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  corvalk = {
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=20, emitVector = {0,1,0}, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=20, emitVector = {0,1,0}, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=20, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=20, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },
  corfalc = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  tllrobber = {
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.2,0}, width=7, length=25, emitVector = {0,1,0}, piece="jet4", noIconDraw = true, priority=3, onActive=true}},
  },
  tlltplane = {
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.1,0.4,0.6}, width=7, length=35, emitVector = {0,1,0}, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=1.5, length=15, piece="jet3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=1.5, length=15, piece="jet4", noIconDraw = true, priority=3, onActive=true}},
  },
  armfig = {
    {class='AirJet',options={color={0.3,0.2,0}, width=6, length=45, piece="rearthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armseap = {
    {class='AirJet',options={color={0.3,0.2,0}, width=6, length=45, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armhawk = {
    {class='AirJet',options={color={0.3,0.1,0}, width=6, length=75, piece="rearthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  corshrike = {
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="cthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  corfink = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=35, piece="thrustb", noIconDraw = true, priority=3, onActive=true}},
  },
  cortitan = {
    {class='AirJet',options={color={0.3,0.1,0}, width=5, length=65, piece="thrustb", noIconDraw = true, priority=3, onActive=true}},
  },
  armlance = {
   {class='AirJet',options={color={0.3,0.1,0}, width=5, length=65, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  corveng = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrusta1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrusta2", noIconDraw = true, priority=3, onActive=true}},
  },
  corseap = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
  },
  corshad = {
    {class='AirJet',options={color={0.6,0.1,0}, width=4, length=52, piece="thrusta1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=4, length=52, piece="thrusta2", noIconDraw = true, priority=3, onActive=true}},
  },
  armthund = {
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
  },
  corhurc = {
    {class='AirJet',options={color={0.9,0.3,0}, width=10, length=80, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armpnix = {
    {class='AirJet',options={color={0.3,0.5,0}, width=8, length=75, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  corshock = {
    {class='AirJet',options={color={0.8,0.1,0}, width=10, length=30, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=10, length=30, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
  },
  corvamp = {
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=65, piece="thrustb", noIconDraw = true, priority=3, onActive=true}},
  },
  corawac = {
    {class='AirJet',options={color={0.8,0.45,0}, width=4, length=50, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armawac = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=50, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armsehak = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=50, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armcybr = {
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=60, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=60, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
  },
  armdfly = {
    {class='AirJet',options={color={0.1,0.5,0.3}, width=3.5, length=60, piece="jet1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.5,0.3}, width=3.5, length=60, piece="jet2", noIconDraw = true, priority=3, onActive=true}},
  },
  abuilderlvl1 = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
  },
  armeca = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=13, piece="emit1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=13, piece="emit2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=13, piece="emit3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=13, piece="emit4", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit5", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit6", noIconDraw = true, priority=3, onActive=true}},

  },
  armgripn = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=60, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armpers = {
     {class='AirJet',options={color={0.6,0.1,0}, width=5, length=22, piece="rearthrust", noIconDraw = true, priority=3, onActive=true}},
  },
  armwolf = {
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="fum3", noIconDraw = true, priority=3, onActive=true}},
  },
  corshrike = {
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
  },
  corblackdawn = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=30, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=30, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
  },

-- Construction Aircraft
abuilderlvl3 = {
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=25, emitVector = {0,1,0}, piece="thrust11", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust12", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust21", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust22", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
},
abuilderlvl4 = {
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust11", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust12", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust21", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust22", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1.0,0.2,0.3}, width=6.5, length=25, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
},
abuilderlvl5 = {
	{class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
},
cbuilderlvl1 = {
	{class='AirJet',options={color={0.8,0.1,0.1}, width=3, length=12, piece="engineExR", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=3, length=12, piece="engineExL", noIconDraw = true, priority=3, onActive=true}},
},
cbuilderlvl3 = {
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
},
cbuilderlvl4 = {
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine4", noIconDraw = true, priority=3, onActive=true}},
},
coreca = {
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine3", noIconDraw = true, priority=3, onActive=true}},
	{class='AirJet',options={color={0.8,0.1,0.1}, width=4, length=14, piece="engine4", noIconDraw = true, priority=3, onActive=true}},
},
 cbuilderlvl5 = {
 	{class='AirJet',options={color={0.8,0.1,0.1}, width=12, length=15, piece="thruster1", noIconDraw = true, priority=3, onActive=true}},
 	{class='AirJet',options={color={0.8,0.1,0.1}, width=12, length=15, piece="thruster.55552", noIconDraw = true, priority=3, onActive=true}},
},
 tllbuilderlvl3 = {
 	{class='AirJet',options={color={1,1,1}, width=10, length=35, piece="thruster", noIconDraw = true, priority=3, onActive=true}},
},
 armorion = {
    {class='AirJet',options={color={0.6,0.1,0}, width=7, length=24, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=7, length=24, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 armstratus = {
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_a", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_b", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_c", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_d", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_e", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_f", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_g", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=5, length=24, piece="engine_h", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=8, length=32, piece="engine", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=8, length=32, piece="engine_up", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=8, length=32, piece="engine_down", noIconDraw = true, priority=4, onActive=true}},
 },
 armsr71 = {
    {class='AirJet',options={color={0.6,0.4,0}, width=4, length=24, piece="wingthrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.4,0}, width=4, length=24, piece="wingthrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=6, length=48, piece="wingthrust3", noIconDraw = true, priority=3, onActive=true}},
 },
 armcyclone = {
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="rrthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="llthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 coreclipse = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
 },
 armjade = {
    {class='Ribbon', options={width=1, size=8, piece="ribbon1", priority=3, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=8, piece="ribbon2", priority=3, noIconDraw = true}},
 },
 corbladew = {
    {class='Ribbon', options={width=1, size=8, piece="lribbon", priority=4, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=8, piece="rribbon", priority=4, noIconDraw = true}},
 },
 corsbomb = {
    {class='Ribbon', options={width=1, size=12, piece="ribbon1", priority=3, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=12, piece="ribbon2", priority=3, noIconDraw = true}},
 },
 talon_spirit = {
    {class='Ribbon', options={width=1, size=12, piece="ribbon1", priority=3, noIconDraw = true}},
    {class='Ribbon', options={width=1, size=12, piece="ribbon2", priority=3, noIconDraw = true}},
 },
 tllca = {
    {class='AirJet',options={color={1,1,1}, width=6, length=15, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=6, length=15, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllfight = {
    {class='AirJet',options={color={1,1,1}, width=6, length=18, piece="thrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllbomber = {
    {class='AirJet',options={color={1,1,1}, width=3, length=18, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=18, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tlltorpp = {
    {class='AirJet',options={color={1,1,1}, width=7, length=20, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=7, length=20, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tlladvfight = {
    {class='AirJet',options={color={0,0,1}, width=5, length=22, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=5, length=22, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllpterodactyl = {
    {class='AirJet',options={color={0,0,1}, width=2, length=18, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=2, length=18, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=2, length=18, piece="thrust3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=20, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=20, piece="thrust5", noIconDraw = true, priority=3, onActive=true}},
 },
 tllabomber = {
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="rrthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="llthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllshu = {
    {class='AirJet',options={color={0.3,0.1,0}, width=8, length=65, piece="rearthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllcondor = {
    {class='AirJet',options={color={0.3,0.1,0}, width=10, length=85, piece="thrusta1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=10, length=85, piece="thrusta2", noIconDraw = true, priority=3, onActive=true}},
 },
 tllnuada = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=5, length=40, piece="rearthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllanhur = {
    {class='AirJet',options={color={1,1,1}, width=5, length=38, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=38, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllaether = {
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="rrthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="llthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 tllvaliant = {
    {class='AirJet',options={color={0.6,0.1,0}, width=17, length=30, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=17, length=30, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 arm_broadside = {
    {class='AirJet',options={color={1,1,1}, width=30, length=35, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=30, length=35, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=30, length=35, piece="mthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 armarch = {
    {class='AirJet',options={color={0.8,0.8,1}, width=30, length=35, piece="enginea", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.8,1}, width=30, length=35, piece="engineb", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.8,1}, width=45, length=40, piece="enginec", noIconDraw = true, priority=3, onActive=true}},
 },
 cdevastator = {
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="rthrust", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="lthrust", noIconDraw = true, priority=3, onActive=true}},
 },
 rumad_jafa = {
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
 },
 rumad_lago = {
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="thrust2", noIconDraw = true, priority=3, onActive=true}},
 },
cordust = {
{class='ShieldJitter',options={life=math.huge, priority=2, pos={0,67,-148}, size=27, precision=22, repeatEffect=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r1", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r2", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r3", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r4", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r5", noIconDraw = true, priority=3, onActive=true}},
{class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="r6", noIconDraw = true, priority=3, onActive=true}},
},
tllzeppelin = {
    {class='AirJet',options={color={1,0.4,0.4}, width=30, length=35, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=30, length=35, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.9,0.9}, width=15, length=45, piece="engine3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.9,0.9}, width=15, length=45, piece="engine4", noIconDraw = true, priority=3, onActive=true}},
},
tllbarbarus = {
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust2", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust3", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust4", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust5", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="thrust6", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=20, length=25, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=20, length=25, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
},
corlift = {
    {class='AirJet',options={color={1.0,0.2,0.3}, width=9, length=40, emitVector = {0,1,0}, piece="flamer1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=9, length=40, emitVector = {0,1,0}, piece="flamer2", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=9, length=40, emitVector = {0,1,0}, piece="flamer3", noIconDraw = true, priority=4, onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=9, length=40, emitVector = {0,1,0}, piece="flamer4", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine1", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine2", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine3", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine4", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine5", noIconDraw = true, priority=3, onActive=true}},
    {class='AirJet',options={color={1,0.4,0.4}, width=5, length=30, piece="engine6", noIconDraw = true, priority=3, onActive=true}},
},

}

 ---- COMMANDER XMAS HATS ----------------------------

 effectUnitDefsXmas = {
-- Special units
 corkrog = {
    {class='SantaHat',options={color={1,0,0}, pos={0,16.0,0.0}, emitVector={0.05,1,0}, width=10, height=24, ballSize=4, piecenum=11, piece="head"}},
  },
-- Commanders
 armcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=3, height=7, ballSize=0.9, piecenum=8, piece="head"}},
  },
 armcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=8, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 armcom2 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,5,0.35}, emitVector={0.3,1,0.2}, width=4, height=9, ballSize=1.3, piecenum=8, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 armcom3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,6,2}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=8, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 corcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=3, height=7, ballSize=0.9, piecenum=16, piece="head"}},
  },
 corcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=16, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 corcom2 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2},width=4, height=9, ballSize=1.3, piecenum=16, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 corcom3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=16, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 tllcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=3, height=7, ballSize=0.9, piecenum=11, piece="head"}},
  },
 tllcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 tllcom2 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=4, height=9, ballSize=1.3, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 tllcom3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 talon_com = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,7,2}, emitVector={0.1,1,0}, width=3, height=7, ballSize=0.9, piecenum=11, piece="head"}},
  },
 talon_com1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,7,2}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 talon_com2 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,7,2}, emitVector={0.3,1,0.2}, width=4, height=9, ballSize=1.3, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
 talon_com3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,7,2}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=11, piece="head"}},
    {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
  },
  gok_com = {
     {class='SantaHat',options={color={1,0.1,0,1}, pos={0,9,2}, emitVector={0.1,1,0}, width=3, height=7, ballSize=0.9, piecenum=11, piece="head"}},
   },
  gok_com1 = {
     {class='SantaHat',options={color={1,0.1,0,1}, pos={0,9,2}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=11, piece="head"}},
     {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
   },
  gok_com2 = {
     {class='SantaHat',options={color={1,0.1,0,1}, pos={0,10,2}, emitVector={0.3,1,0.2}, width=4, height=9, ballSize=1.3, piecenum=11, piece="head"}},
     {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
   },
  gok_com3 = {
     {class='SantaHat',options={color={1,0.1,0,1}, pos={0,11,2}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=11, piece="head"}},
     {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
   },
  rumad_king = {
      {class='SantaHat',options={color={1,0.1,0,1}, pos={0,9,2}, emitVector={0.1,1,0}, width=3, height=7, ballSize=0.9, piecenum=11, piece="head"}},
    },
  rumad_king1 = {
      {class='SantaHat',options={color={1,0.1,0,1}, pos={0,9,2}, emitVector={0.3,1,0.2}, width=3.5, height=8, ballSize=1.15, piecenum=11, piece="head"}},
      {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=100, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
    },
  rumad_king2 = {
      {class='SantaHat',options={color={1,0.1,0,1}, pos={0,10,2}, emitVector={0.3,1,0.2}, width=4, height=9, ballSize=1.3, piecenum=11, piece="head"}},
      {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=150, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
    },
  rumad_king3 = {
      {class='SantaHat',options={color={1,0.1,0,1}, pos={0,11,2}, emitVector={0.3,1,0.2}, width=6, height=14, ballSize=1.6, piecenum=11, piece="head"}},
      {class='ShieldJitter', options={delay=0,life=math.huge, priority=2, pos={0,20,0.0}, size=200, precision=0, noIconDraw = true, strength = 0.001, repeatEffect=true}},
    },
}
