-- CORE_FUSION_EXPLO_480
return {
  ["core_fusion_explo_480"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 4,
      circlegrowth       = 22,
      flashalpha         = 2.4,
      flashsize          = 480,
      ttl                = 15,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
    fakelight = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[0.9 0.9 1 1    0.8 0.8 1 1  1 0.8 0.15 1     0 0 0 0.1]],
        size               = [[120 r5]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[100 r4 r-4]],
      },
    },
    fakering = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[0.9 0.8 1 1      0 0 0 0.1]],
        size               = 54,
        sizegrowth         = [[3 r-3]],
        texture            = [[groundring]],
        ttl                = 65,
      },
    },
   glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0.8 0.8 1 0.9    0.8 0.8 1 0.9              0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.00, 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 0,
        particlesize       = 250,
        particlesizespread = 10,
        particlespeed      = 1,
        particlespeedspread = 0,
        pos                = [[0, 2, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[diamondstar1]],
      },
    },
    windsphere_slow = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.22,
        color              = [[1, 1, 1]],
        expansionspeed     = [[10 r4]],
        ttl                = 19,
      },
    },
     WaterSplash = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:Watersplash_large]],
        pos                = [[0, 0, 0]],
      },
    },
   SmokeySpawner = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 60,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[15 i1]],
        explosiongenerator = [[custom:Smoke_fus_480]],
        pos                = [[-50 r100, 40 ,-50 r100]],
      },
    },
     FireballSpawner = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:fireball_expl_fus_480]],
        pos                = [[0, 0, 0]],
      },
    },
     SpikeSpawner = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0]],
        explosiongenerator = [[custom:fus_spike_480]],
        pos                = [[0, 0, 0]],
      },
    },
     trails = {
      air                = false,
      class              = [[CExpGenSpawner]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:Fusion_Explo_Trail_480]],
        pos                = [[0,0,0]],
      },
    },
  },
  
   ["Fusion_Explo_Trail_480"] = {
    Spark = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.89,
        colormap           = [[0 0 0 0  0.6 0.6 1 .001     0.7 .7 0.95 .001  	0 0 0 0.01]],
        directional        = true,
        emitrot            = [[0 r360]],
        emitrotspread      = [[0 r-360 r360]],
        emitvector         = [[0, 0.1, 0]],
        gravity            = [[0, 0 , 0]],
        numparticles       = 2,
        particlelife       = 20,
        particlelifespread = 10,
        particlesize       = 300,
        particlesizespread = 8,
        particlespeed      = 0,
        particlespeedspread = 0,
        pos                = [[0, 0 ,0]],
        sizegrowth         = [[0.50 r1.6 r-1.6]],
        sizemod            = -1.0,
        texture            = [[lightningball_new]],
        useairlos          = true,
      },
    },
  },
   
  ["fus_spike_480"] = {
    spikesofhell1 = {
      air                = true,
      class              = [[explspike]],
      count              = 30,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.05,
        color              = [[0.9, 0.9, 1.0]],
        dir                = [[-25 r50,-25 r50,-25 r50]],
        length             = 1,
        width              = 40,
      },
    },
},

  ["Smoke_fus_480"] = {
     smokecloud = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 0,
      water              = true,
      properties = {
        airdrag            = 0.97,
        colormap           = [[0 0 0 0.00 0.1 0.1 0.1 0.4		0.1 0.1 0.1 0.3		0.1 0.1 0.1 0.4		0.1 0.1 0.1 0.3	 0 0 0 0.00]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 360,
        emitvector         = [[0,1,0]],
        gravity            = [[0 , 0.001, 0]],
        numparticles       = 1,
        particlelife       = 60,
        particlelifespread = 50,
        particlesize       = 14,
        particlesizespread = 25,
        particlespeed      = [[2 i0.25]],
        particlespeedspread = 2.2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.95,
        sizemod            = 1.0,
        texture            = [[smoke]],
        useairlos          = true,
      },
    },
},
    
  ["fireball_heat_480"] = {
    rocks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.97,
        colormap           = [[1 1 1 .2    1 1 1 0.5	0.6 0.3 0 .1	 0.1 0.1 0.1 0.3	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 360,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0.001 r-0.002, 0.01 r-0.02, 0.001 r-0.002]],
        numparticles       = 3,
        particlelife       = 65,
        particlelifespread = 5,
        particlesize       = 10,
        particlesizespread = 30,
        particlespeed      = 1.2,
        particlespeedspread = 1.2,
        pos                = [[-10 r20, -10 r20,-10 r20]],
        sizegrowth         = 0.04,
        sizemod            = 1.0,
        texture            = [[smokeorange]],
      },
    },
  },

  ["fireball_smoke_480"] = {
    rocks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.90,
        colormap           = [[0.1 0.1 0.1 0.5		0.1 0.1 0.1 0.4		0.1 0.1 0.1 0.5		0.1 0.1 0.1 0.3		 0 0 0 0.00]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 360,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0.001 r-0.002, 0.002, 0.001 r-0.002]],
        numparticles       = 1,
        particlelife       = 80,
        particlelifespread = 15,
        particlesize       = 25,
        particlesizespread = 10,
        particlespeed      = 5,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.55,
        sizemod            = 1.0,
        texture            = [[smokeorange]],
      },
    },
  },
  
  ["fireball_expl_fus_480"] = {
    usedefaultexplosions = true,
    fwoosh = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 35,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[30  i1]],
        explosiongenerator = [[custom:fireball_smoke_480]],
        pos                = [[-50 r100,0 r50, -50 r100]],
      },
    },
    fireball = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 50,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[30  i1]],
        explosiongenerator = [[custom:fireball_heat_480]],
        pos                = [[-50 r100,0 r50, -50 r100]],
      },
    },
  },
}


