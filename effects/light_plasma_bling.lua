-- light_plasma_bling


return {
  ["light_plasma_bling"] = {
 usedefaultexplosions = false,
     
       groundflash = {
      circlealpha        = 0.35,
      circlegrowth       = 0.001,
      flashalpha         = 1.5,
      flashsize          = 16,
      ttl                = 16,
      color = {
        [1]  = 0.99599999189377,
        [2]  = 0.98000001907349,
        [3]  = 0.56599998474121,
      },
    },
 foom = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = false,
      unit               = 1,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[dir]],
        size               = 7,
        sizegrowth         = 0.7,
        speed              = [[dir]],
        texture            = [[explo]],
      },
    },
  
     smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.80,
        colormap           = [[1 0.8 0.26 1  0.8 0.6 0 0.8	0.1 0.1 0.1 0.8 0 0 0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 8,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 8,
        particlelife       = 10,
        particlelifespread = 6,
        particlesize       = 8,
        particlesizespread = 1.8,
        particlespeed      = 0.90,
        particlespeedspread = 1.80,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.06,
        sizemod            = 1.0,
        texture            = [[GenericSmokeCloud1]],
      },
    },
    
      spark = {
      air                = false,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      unit               = 1,
      water              = false,
      properties = {
        airdrag            = 1,
        colormap           = [[0.9 0.9 0.5 .01   0.9 0.9 0.5 .01   	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = [[0 r-360 r360]],
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -.15 r0.15 r-1, 0]],
        numparticles       = 4,
        particlelife       = 4.5,
        particlelifespread = 3,
        particlesize       = 4,
        particlesizespread = 2,
        particlespeed      = 4,
        particlespeedspread = 3,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r .05]],
        sizemod            = -1.0,
        texture            = [[Plasma]],
        useairlos          = true,
      },
    },
  },

}

