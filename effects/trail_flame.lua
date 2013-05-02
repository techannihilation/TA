-- trail_flame

return {
  ["trail_flame"] = {
    fakelight = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[1 0.5 0.25 1     0 0 0 0.1]],
        size               = [[25 r-5]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[9 r4 r-4]],
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = 1,
        colormap           = [[0.7 0.7 1 .01  0.85 0.5 0.73 .01      0.96 .3 0.05 .008  	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 3,
        particlelife       = 8,
        particlelifespread = 4,
        particlesize       = 4,
        particlesizespread = 2,
        particlespeed      = 1.1,
        particlespeedspread = 0.2,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.6 r.35]],
        sizemod            = 1.0,
        texture            = [[flashside2]],
        useairlos          = false,
      },
    },
  },

}

