-- trail_dmc_cannon

return {
  ["trail_dmc_cannon"] = {
    usedefaultexplosions = false,
    sparkels = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      water              = false,
      properties = {
        airdrag            = 0.65,
        colormap           = [[1 0.2 0.2 .005   1 0.2 0.2 .005   	0 0 0 0.001]],
        directional        = true,
        emitdir            = [[dir]],
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0.2, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 32,
        particlelife       = 4,
        particlelifespread = 16,
        particlesize       = 0.02,
        particlesizespread = 2,
        particlespeed      = 1,
        particlespeedspread = 1,
        pos                = [[0 r-10 r10, 0 r-10 r10, 0 r-10 r10]],
        sizegrowth         = 0.2,
        sizemod            = 1.0,
        texture            = [[EMG]],
        useairlos          = true,
      },
    },
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.5,
        alphadecay         = 0.18,
        color              = [[1, 0.2, 0.2]],
        dir                = [[-4 r6,-4 r6,-4 r6]],
        length             = 13,
        width              = 23,
      },
    },
  },

}

