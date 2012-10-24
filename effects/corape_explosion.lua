-- corape_explosion

return {
  ["corape_explosion"] = {
 usedefaultexplosions = false,
     
       groundflash = {
      circlealpha        = 0.25,
      circlegrowth       = 0.001,
      flashalpha         = 0.82,
      flashsize          = 76,
      ttl                = 16,
      color = {
        [1]  = 0.99599999189377,
        [2]  = 0.23000001907349,
        [3]  = 0.21599998474121,
      },
    },
  
     smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.95,
        colormap           = [[1 0.6 0.4 .01  0.6 0.2 0 0.8	0.1 0.1 0.1 0.8 0 0 0 0.01]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 8,
        emitvector         = [[dir]],
        gravity            = [[0 r0.1, .02, 0]],
        numparticles       = 21,
        particlelife       = 18,
        particlelifespread = 8,
        particlesize       = 7,
        particlesizespread = 15,
        particlespeed      = 0.90,
        particlespeedspread = 1.6,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.46,
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
        colormap           = [[0.9 0.7 0.5 .01   0.9 0.7 0.5 .01   	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = [[0 r-360 r360]],
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -.15 r0.15 r-1, 0]],
        numparticles       = 10,
        particlelife       = 5,
        particlelifespread = 4,
        particlesize       = 6,
        particlesizespread = 4,
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

