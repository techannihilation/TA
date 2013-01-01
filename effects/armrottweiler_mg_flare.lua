-- armrottweiler_mg_flare

return {
  ["armrottweiler_mg_flare"] = {
    usedefaultexplosions = false,
     spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.32,
        alphadecay         = 0.08,
        color              = [[1 0.9 0.4]],
        dir                = [[-2 r5,-2 r5,-2 r5]],
        length             = 0.00001,
        width              = 1,
      },
    },
     muzzle_puff_ring_1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.80,
        colormap           = [[1 0.9 0.4 0.01 0.1 0.1 0.1 0.2 0.1 0.1 0.1 0.2 0 0 0 0.001 0 0 0 0.001]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 8,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 3,
        particlelife       = 10,
        particlelifespread = 6,
        particlesize       = 4,
        particlesizespread = 1.8,
        particlespeed      = 0.90,
        particlespeedspread = 1.80,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.03,
        sizemod            = 1.0,
        texture            = [[smoke]],
      },
    },
    windsphere = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.10,
        color              = [[1.0, 1.0, 1.0]],
        expansionspeed     = [[0.1 0.4]],
        ttl                = 12,
      },
    },
  },

}

