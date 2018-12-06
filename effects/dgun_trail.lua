--Dgun trail

return {
  ["dgun_trail"] = {
    usedefaultexplosions = false,
     Spawner_dgun_sparkels = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 2, --8
      ground             = true,
      water              = false,
      unit               = true,
      properties = {
        explosiongenerator = [[custom:dgun_trail_sparks]],
        pos                = [[0 r-10 r10, 0 r-10 r10, 0 r-10 r10]],
      },
    },
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.5,
        alphadecay         = 0.18,
        color              = [[1, 0.2, 0.2]],
        dir                = [[-10 r20,-10 r20,-10 r20]],
        length             = 13,
        width              = 23,
      },
    },
  },
   ["dgun_trail_sparks"] = {
    sparkels = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = .25,
        colormap           = [[0.9 0.85 0.77 0.017   0.8 0.55 0.3 0.011   0 0 0 0]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0.2, 0.2, 0.2]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 1,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 1,
        particlespeed      = 10,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = -0.25,
        texture            = [[sparkexplo]],
        useairlos          = true,
      },
    },
  },
}

