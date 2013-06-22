-- exxec

return {
  ["exxec"] = {
    yuped = {
      air                = true,
      class              = [[CSimpleGroundFlash]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        colormap           = [[0.3 0.3 0.8 0.31 	0.2 0.2 0.6 0.31		0.0 0.0 0.0 0.0]],
        size               = 33,
        sizegrowth         = -0.3,
        texture            = [[groundflash]],
        ttl                = 100,
      },
    },
    glow = {
      air                = true,
      count              = 2,
      class              = [[heatcloud]],
      ground             = true,
      water              = true,
      properties = {
        heat               = 20,
        heatfalloff        = 0.70,
        maxheat            = 20,
        pos                = [[0, 0.0, 0]],
        size               = [[4.0 r1]],
        sizegrowth         = [[0.09 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[bluenovaexplo]],
        useairlos          = false,
      },
    },
     spark1 = {
      air                = false,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      water              = false,
      
      unit               = 1,
      
      properties = {
        airdrag            = 0.95,
        colormap           = [[0.3 0.3 0.8 .02   0.3 0.3 0.8 .01   	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = [[r360 r-360 r360]],
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -.25 r0.15 r-1, 0]],
        numparticles       = 18,
        particlelife       = 7,
        particlelifespread = 20,
        particlesize       = 1,
        particlesizespread = 2,
        particlespeed      = 2,
        particlespeedspread = 3,
        pos                = [[0, 3, 0]],
        sizegrowth         = [[0.0 r.05]],
        sizemod            = 1.0,
        texture            = [[Plasma]],
        useairlos          = true,
      },
    },
  },

}

