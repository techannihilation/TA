-- core_howie_rocket

return {
  ["core_howie_rocket"] = {
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.2 0.2 0.01	0.3 0.2 0.1 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[laserend]],
        length             = 19,
        sidetexture        = [[laserend]],
        size               = 4.3,
        sizegrowth         = 0.9,
        ttl                = 2,
      },
    },
    exhale = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.4,
        colormap           = [[1.0 0.2 0.0 0.01 0.1 0.1 0.1 0.2 0.0 0.0 0.0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 20,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 8,
        particlelifespread = 2,
        particlesize       = 3,
        particlesizespread = 1,
        particlespeed      = 1,
        particlespeedspread = 1,
        pos                = [[0, 1, 0]],
        sizegrowth         = 0.3,
        sizemod            = 1.0,
        texture            = [[clouds2]],
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = 0.9,
        colormap           = [[0.1 0.1 0.1 0.2 0.1 0.1 0.1 0.2 0.1 0.1 0.1 0.2 0 0 0 0.001 0 0 0 0.001]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0.01, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 10,
        particlelife       = 8,
        particlelifespread = 8,
        particlesize       = 0.15,
        particlesizespread = 3,
        particlespeed      = 14,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r.65]],
        sizemod            = 1.0,
        texture            = [[smoke]],
        useairlos          = true,
      },
    },
  },

}
