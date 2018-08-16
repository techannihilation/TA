-- trail_large_rocket_tankonator

return {
  ["trail_large_rocket_tankonator"] = {
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.7 0.0 0.01 1.0 0.7 0.0 0.01]],
        dir                = [[dir]],
        frontoffset        = 1,
        fronttexture       = [[none]],
        length             = 8,
        sidetexture        = [[flashside1]],
        size               = 6.3,
        sizegrowth         = 0.9,
        ttl                = 2,
      },
    },
    smoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        airdrag            = 2.2,
        colormap           = [[1 0.7 0 .8  1 .55 0.05 .8   .05 .05 .05 .4  0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 8,
        particlesize       = 4,
        particlesizespread = 2,
        particlespeed      = 0.8,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r0.85]],
        sizemod            = 1,
        texture            = [[GenericSmokeCloud1]],
        useairlos          = true,
      },
    },
  },

}

