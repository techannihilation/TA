-- zeus_flash_sub
-- claw_flash_sub

return {
  ["zeus_flash_sub"] = {
    unit_sparkles = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 3,
      ground             = true,
      unit               = 1,
      water              = true,
      properties = {
        airdrag            = 0.95,
        colormap           = [[0 0 0 0	0.5 0.5 0.5 0.2	  0.8 0.8 0.8 0.4	  0.3 0.3 0.3 0.2	  0.1 0.1 0.1 0.1	  0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 270,
        emitvector         = [[0, -1, 0]],
        gravity            = [[0,0,0]],
        numparticles       = 1,
        particlelife       = 6,
        particlelifespread = 8,
        particlesize       = 10,
        particlesizespread = 20,
        particlespeed      = 2,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1.25,
        sizemod            = 1.0,
        texture            = [[lightb2]],
      },
    },
  },

  ["claw_flash_sub"] = {
    unit_sparkles = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      unit               = 1,
      water              = true,
      properties = {
        airdrag            = 0.95,
        colormap           = [[0 0 0 0	0.5 0.5 0.5 0.2	  0.8 0.8 0.8 0.4	  0.3 0.3 0.3 0.2	  0.1 0.1 0.1 0.1	  0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 270,
        emitvector         = [[0, -1, 0]],
        gravity            = [[0,0,0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 8,
        particlesize       = 5,
        particlesizespread = 10,
        particlespeed      = 2,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1.25,
        sizemod            = 1.0,
        texture            = [[lightb2]],
      },
    },
  },

}

