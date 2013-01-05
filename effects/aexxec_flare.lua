-- aexxec_flare

return {
  ["aexxec_flare"] = {
    usedefaultexplosions = false,
    spark = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      unit               = 0,
      water              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0.9 0.9 0.9 .02   0.2 0.2 0.4 .01   	0 0 0 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = [[r45 r45 r45]],
        emitvector         = [[0, 0.1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 5.5,
        particlelifespread = 0.51,
        particlesize       = 10,
        particlesizespread = 1,
        particlespeed      = 2,
        particlespeedspread = 1.5,
        pos                = [[0,0,0]],
        sizegrowth         = [[0.0 r .03]],
        sizemod            = 1.0,
        texture            = [[whitelight]],
        useairlos          = true,
      },
    },
    
  },

}

