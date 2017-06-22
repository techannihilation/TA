-- note that the order of the MergeTable args matters for nested tables (such as colormaps)!


effectUnitDefs = {
 --// FUSIONS //--------------------------
 corfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,50,-5}, delay=0, lifeSpread=30},plasmaball_corfus)},
    {class='SimpleParticles2', options=MergeTable({pos={0,50,-5}, delay=40, lifeSpread=30},plasmaball_corfus)},
    {class='ShieldJitter',options={life=math.huge, pos={0,50,-5}, size=25, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
 },
 corsfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,100,0}, delay=0, lifeSpread=30},plasmaball_corsfus)},
    {class='SimpleParticles2', options=MergeTable({pos={0,100,0}, delay=40, lifeSpread=30},plasmaball_corsfus)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={0,100.9,0},strength = 0.01, size=32, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },
 cafus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,58.9,-4.5}, delay=0, lifeSpread=30},plasmaball_cafus)},
    {class='SimpleParticles2', options=MergeTable({pos={0,58.9,-4,5}, delay=40, lifeSpread=30},plasmaball_cafus)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={0,58.9,-4.5}, size=24.5, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBlue},
  },
 crnns = {
    {class='SimpleParticles2', options=MergeTable({pos={-9,26.9,0}, delay=0, lifeSpread=30},plasmaball_crnns)},
    {class='SimpleParticles2', options=MergeTable({pos={-9,26.9,0}, delay=40, lifeSpread=30},plasmaball_crnns)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={-9,26.9,0}, size=29, precision=22, repeatEffect=true}},
  },
 cfusionplant = {
    {class='SimpleParticles2', options=MergeTable({pos={0,80.9,-10}, delay=0, lifeSpread=30},plasmaball_cfusionplant)},
    {class='SimpleParticles2', options=MergeTable({pos={0,80.9,-10}, delay=40, lifeSpread=30},plasmaball_cfusionplant)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={0,80.9,-10}, size=45.5, precision=22, repeatEffect=true}},
    {class='GroundFlash',options=groundFlashBigBlue},
  },
 tllmedfusion = {
    {class='SimpleParticles2', options=MergeTable({pos={-20,40,24}, delay=0, lifeSpread=30},plasmaball_tllmedfusion)},
    {class='SimpleParticles2', options=MergeTable({pos={-20,40,24}, delay=40, lifeSpread=30},plasmaball_tllmedfusion)},
    {class='ShieldJitter',options={layer=-16, life=math.huge,  pos={-20,40,24}, size=13.9, precision=22, repeatEffect=true}},
  },
 tllcoldfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,62,0}, delay=0, lifeSpread=30},plasmaball_tllcoldfus)},
    {class='SimpleParticles2', options=MergeTable({pos={0,62,0}, delay=40, lifeSpread=30},plasmaball_tllcoldfus)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={0,62,0}, size=20, precision=22, repeatEffect=true}},
  },
 tllmegacoldfus = {
    {class='SimpleParticles2', options=MergeTable({pos={0,90,0}, delay=0, lifeSpread=30},plasmaball_tllmegacoldfus)},
    {class='SimpleParticles2', options=MergeTable({pos={0,90,0}, delay=40, lifeSpread=30},plasmaball_tllmegacoldfus)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={0,90,0}, size=30.9, precision=22, repeatEffect=true}},
  },
 aafus = {
    {class='SimpleParticles2', options=MergeTable({pos={-38,70,-10}, delay=10, lifeSpread=300},sparks)},
    {class='SimpleParticles2', options=MergeTable({pos={21,70,-10}, delay=60, lifeSpread=300},sparks)},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={-31,55,-10}, size=12, precision=22, repeatEffect=true}},
    {class='ShieldJitter',options={layer=-16, life=math.huge, pos={31,55,-10}, size=12, precision=22, repeatEffect=true}},
  },
  
  --// SHIELDS //--------------------------
  corshieldgen = {
    {class='ShieldSphere',options=corshieldgenShieldSphere},
    {class='SimpleParticles2', options=MergeTable({piece="sphere", delay=20, lifeSpread=300},shield)},
    {class='SimpleParticles2', options=MergeTable({piece="sphere", delay=40, lifeSpread=300},shield)},
    {class='SimpleParticles2', options=MergeTable({piece="sphere", delay=60, lifeSpread=300},shield)},
  },
 
  --// OTHER //--------------------------
 armmex1 = {
    {class='SimpleParticles2', options=MergeTable({pos={-6,15,0}, delay=10, lifeSpread=300},sparks)},
  },
 cormex1 = {
    {class='SimpleParticles2', options=MergeTable({pos={-6,20,0}, delay=20, lifeSpread=300},sparks)},
  },
 tllamex = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,34,0}, delay=10, lifeSpread=300},sparks)},
  },
 armrech3 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr1)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr1)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr1)},
  },
 armrech18 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr2)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr2)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr2)},
  },
 armrech21 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr3)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr3)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr3)},
  },
 corech3 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr1)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr1)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr1)},
  },
 corech18 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr2)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr2)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr2)},
  },
 corech21 = {
    {class='SimpleParticles2', options=MergeTable({pos={-12,60,-37}, delay=15, lifeSpread=30},sparksr3)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,75,-37}, delay=30, lifeSpread=30},sparksr3)},
    {class='SimpleParticles2', options=MergeTable({pos={-12,90,-37}, delay=45, lifeSpread=30},sparksr3)},
  }, 
 cjuno = {
    {class='ShieldSphere',options=junoShieldSphere},
    {class='GroundFlash',options=groundFlashJuno},
  },
 ajuno = {
    {class='ShieldSphere',options=junoShieldSphere},
    {class='GroundFlash',options=groundFlashJuno},
  },
 tlljuno = {
    {class='ShieldSphere',options=tlljunoShieldSphere},
    {class='GroundFlash',options=groundFlashJuno},
  },
  --// ENERGY STORAGE //--------------------
  
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
  
  --// PLANES still need to do work here //----------------------------
  armfig = {
    {class='AirJet',options={color={0.3,0.2,0}, width=6, length=45, piece="rearthrust", onActive=true}},
 },
  armsfig = {
    {class='AirJet',options={color={0.3,0.2,0}, width=6, length=45, piece="thrust", onActive=true}},
 },
  armseap = {
    {class='AirJet',options={color={0.3,0.2,0}, width=6, length=45, piece="thrust", onActive=true}},
 },
  armhawk = {
    {class='AirJet',options={color={0.3,0.1,0}, width=6, length=75, piece="rearthrust", onActive=true}},
  },
  shrike = {
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="lthrust", onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=4, length=75, piece="cthrust", onActive=true}},
  },
  corfink = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=35, piece="thrustb", onActive=true}},
  },
  cortitan = {
    {class='AirJet',options={color={0.3,0.1,0}, width=5, length=65, piece="thrustb", onActive=true}},
  },
  armlance = {
   {class='AirJet',options={color={0.3,0.1,0}, width=5, length=65, piece="thrust", onActive=true}},
  },
  corveng = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrusta1", onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrusta2", onActive=true}},
  },
  corsfig = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust1", onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust2", onActive=true}},
  },
  corseap = {
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust1", onActive=true}},
    {class='AirJet',options={color={0.3,0.1,0}, width=3, length=42, piece="thrust2", onActive=true}},
  },
  corshad = {
    {class='AirJet',options={color={0.6,0.1,0}, width=4, length=52, piece="thrusta1", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=4, length=52, piece="thrusta2", onActive=true}},
  },
  armthund = {
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust1", onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust2", onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust3", onActive=true}},
    {class='ThundAirJet',options={color={0.3,0.1,0}, width=2, length=47, piece="thrust4", onActive=true}},
  },
  corhurc = {
    {class='AirJet',options={color={0.9,0.3,0}, width=10, length=80, piece="thrust", onActive=true}},
  },
  armpnix = {
    {class='AirJet',options={color={0.3,0.5,0}, width=8, length=75, piece="thrust", onActive=true}},
  },
  corvamp = {
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=65, piece="thrustb", onActive=true}},
  },
  corawac = {
    {class='AirJet',options={color={0.8,0.45,0}, width=4, length=50, piece="thrust", onActive=true}},
  },
  corhunt = {
    {class='AirJet',options={color={0.8,0.45,0}, width=4, length=50, piece="thrust", onActive=true}},
  },
 armawac = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=50, piece="thrust", onActive=true}},
  },
 armsehak = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=50, piece="thrust", onActive=true}},
  },
  armcybr = {
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=60, piece="thrust1", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=3.5, length=60, piece="thrust2", onActive=true}},
  },
  armdfly = {
    {class='AirJet',options={color={0.1,0.5,0.3}, width=3.5, length=60, piece="jet1", onActive=true}},
    {class='AirJet',options={color={0.1,0.5,0.3}, width=3.5, length=60, piece="jet2", onActive=true}},
  },
  corsb = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=76, piece="emit1", onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.5, length=76, piece="emit2", onActive=true}},
  },
  abuilderlvl1 = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit1", onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit2", onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=7, length=11, piece="emit3", onActive=true}},
  },
  armsb = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=70, piece="emit1", onActive=true}},
  },
  corgripn = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=60, piece="thrust", onActive=true}},
  },
  blade = {
    {class='AirJet',options={color={0.1,0.5,0.3}, width=3.7, length=28, piece="thrust1", onActive=true}},
  },
  armpers = {
     {class='AirJet',options={color={0.6,0.1,0}, width=5, length=22, piece="rearthrust", onActive=true}},
  },
  airwolf3g = {
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="fum3", onActive=true}},
  },
  shrike = {
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust1", onActive=true}},
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust2", onActive=true}},
     {class='AirJet',options={color={0.6,0.1,0}, width=3.7, length=50, piece="thrust3", onActive=true}},
  },
  blackdawn = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=30, piece="thrust1", onActive=true}},
    {class='AirJet',options={color={0.1,0.4,0.6}, width=3.7, length=30, piece="thrust2", onActive=true}},
  },
 armblz = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="rearthrust", onActive=true}},
  },
   corfiend = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="emit", onActive=true}},
  },
 abuilderlvl2 = {
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="lfthrust", onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="lbthrust", onActive=true}},
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="rfthrust", onActive=true}}, 
    {class='AirJet',options={color={1.0,0.2,0.3}, width=4.7, length=20, emitVector = {0,1,0}, piece="rbthrust", onActive=true}},
 },
  cbuilderlvl2 = {
    {class='AirJet',options={color={1.0,0.1,0.2}, width=4.7, length=15, emitVector = {0,1,0}, piece="thrust", onActive=true}},
    {class='AirJet',options={color={1.0,0.1,0.2}, width=4.7, length=15, emitVector = {0,1,0}, piece="lbthrust", onActive=true}},
    {class='AirJet',options={color={1.0,0.1,0.2}, width=4.7, length=15, emitVector = {0,1,0}, piece="rbthrust", onActive=true}},
 },
  armorion = {
    {class='AirJet',options={color={0.6,0.1,0}, width=7, length=24, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=7, length=24, piece="lthrust", onActive=true}},
 },
  armcyclone = {
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="rrthrust", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="lthrust", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=2.3, length=24, piece="llthrust", onActive=true}},
 },
  coreclipse = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="thrust", onActive=true}},
 }, 
 corfalc = {
    {class='AirJet',options={color={0.6,0.1,0}, width=5.7, length=45, piece="thrust", onActive=true}},
 }, 
 armjade = {
    {class='Ribbon', options={width=1, size=8, piece="ribbon1"}},
    {class='Ribbon', options={width=1, size=8, piece="ribbon2"}},
 }, 
  corsbomb = {
    {class='Ribbon', options={width=1, size=12, piece="ribbon1"}},
    {class='Ribbon', options={width=1, size=12, piece="ribbon2"}},
 }, 
 abuilderlvl3 = {
    {class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust1", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=12, length=15, piece="thrust2", onActive=true}},
 },
   cbuilderlvl1 = {
    {class='AirJet',options={color={0.8,0.1,0.1}, width=3, length=12, piece="engineExR", onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0.1}, width=3, length=12, piece="engineExL", onActive=true}},
 },
 cbuilderlvl3 = {
    {class='AirJet',options={color={0.8,0.1,0.1}, width=12, length=15, piece="thruster1", onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0.1}, width=12, length=15, piece="thruster.55552", onActive=true}},
 },
 tllca = {
    {class='AirJet',options={color={1,1,1}, width=6, length=15, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=6, length=15, piece="lthrust", onActive=true}},
 },
 tllfight = {
    {class='AirJet',options={color={1,1,1}, width=6, length=18, piece="thrust", onActive=true}},
 },
 tllbomber = {
    {class='AirJet',options={color={1,1,1}, width=3, length=18, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=3, length=18, piece="lthrust", onActive=true}},
 },
 tlltorpp = {
    {class='AirJet',options={color={1,1,1}, width=7, length=20, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=7, length=20, piece="lthrust", onActive=true}},
 },
 tlladvfight = {
    {class='AirJet',options={color={0,0,1}, width=5, length=22, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=5, length=22, piece="lthrust", onActive=true}},
 },
 tllseaf = {
    {class='AirJet',options={color={1,1,1}, width=6, length=18, piece="thrust", onActive=true}},
 },
  tllabomber = {
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="rrthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="lthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=24, piece="llthrust", onActive=true}},
 },
 tllshu = {
    {class='AirJet',options={color={0.3,0.1,0}, width=8, length=65, piece="rearthrust", onActive=true}},
 },
 tllnuada = {
    {class='AirJet',options={color={0.1,0.4,0.6}, width=5, length=40, piece="rearthrust", onActive=true}},
 },
 tllanhur = {
    {class='AirJet',options={color={1,1,1}, width=5, length=38, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=5, length=38, piece="lthrust", onActive=true}},
 },
 tllaether = {
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="rrthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="lthrust", onActive=true}},
    {class='AirJet',options={color={0,0,1}, width=3, length=34, piece="llthrust", onActive=true}},
 },
 tllvaliant = {
    {class='AirJet',options={color={0.6,0.1,0}, width=17, length=30, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0.6,0.1,0}, width=17, length=30, piece="lthrust", onActive=true}},
 },
  abroadside = {
    {class='AirJet',options={color={1,1,1}, width=30, length=35, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={1,1,1}, width=30, length=35, piece="lthrust", onActive=true}},
 },
  cdevastator = {
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="rthrust", onActive=true}},
    {class='AirJet',options={color={0.8,0.1,0}, width=30, length=35, piece="lthrust", onActive=true}},
 },
}

 --// COMMANDER XMAS HATS //--------------------------
 effectUnitDefsXmas = {
 armcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 armcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 armcom4 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 armcom5 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 armcom6 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 armcom7 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,4,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=8, piece="head"}},
  },
 corcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 corcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 corcom3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 corcom5 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 corcom6 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 corcom7 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,0,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=16, piece="head"}},
  },
 tllcom = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
 tllcom1 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
 tllcom3 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
 tllcom5 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
 tllcom6 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
 tllcom7 = {
    {class='SantaHat',options={color={1,0.1,0,1}, pos={0,8.8,0.35}, emitVector={0.3,1,0.2}, width=2.7, height=6, ballSize=0.7, piecenum=11, piece="head"}},
  },
}
