-- trail_medium_debree

return {
  ["trail_medium_debree"] = {
    fakelight = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[1 1 1 1       0 0 0 0.1]],
        size               = [[5 r-5]],
        sizegrowth         = 0,
        texture            = [[groundflash]],
        ttl                = 3,
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = 0.8,
        colormap           = [[1 0.3 0 .1  1 .2 0.05 .1  .3 .3 .3 .1  	0 0 0 0.01]],
        directional        = true,
        emitdir            = [[dir]],
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0.2, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 8,
        particlelife       = 16,
        particlelifespread = 16,
        particlesize       = 1,
        particlesizespread = 3,
        particlespeed      = 2,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r.65]],
        sizemod            = 1.0,
        texture            = [[Bombsmoke]],
        useairlos          = true,
      },
    },
  },

}

