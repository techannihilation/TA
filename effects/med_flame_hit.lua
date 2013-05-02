-- med_flame_hit

return {
  ["med_flame_hit"] = {
    fakelight = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[1 1 1 1    1 0.5 0.25 1     0 0 0 0.1]],
        size               = [[25 r-5]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[9 r4 r-4]],
      },
    },
    spark = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = 1,
        colormap           = [[1 0.35 0.12 .01   0.96 .3 0.05 .008  	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = [[0 r-360 r360]],
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -.25 r0.25 r-1, 0]],
        numparticles       = 12,
        particlelife       = 10,
        particlelifespread = 50,
        particlesize       = 1,
        particlesizespread = 2,
        particlespeed      = 5,
        particlespeedspread = 3,
        pos                = [[0, 18, 0]],
        sizegrowth         = [[0.0 r.05]],
        sizemod            = 1.0,
        texture            = [[Plasma]],
        useairlos          = true,
      },
    },
  },

}

