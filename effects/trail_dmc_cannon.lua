-- trail_dmc_cannon

return {
  ["trail_dmc_cannon"] = {
    usedefaultexplosions = false,
     Spawner_dmc_sparkels = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 32, --32
      ground             = false,
      water              = false,
      unit               = false,
      properties = {
        explosiongenerator = [[custom:dmc_sparkels]],
        pos                = [[0 r-10 r10, 0 r-10 r10, 0 r-10 r10]],
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
   ["dmc_sparkels"] = {
    sparkels = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      water              = false,
      properties = {
        airdrag            = .75,
        colormap           = [[1 0.8 0.8 .005		1 0.2 0.2 .005      	0 0 0 0.001]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0.2, 0.2, 0.2]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 4,
        particlelifespread = 16,
        particlesize       = 0.02,
        particlesizespread = 2,
        particlespeed      = 1,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.2,
        sizemod            = 1.0,
        texture            = [[EMG]],
        useairlos          = true,
      },
    },
  },
}

