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
        size               = 4.3,
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
        airdrag            = 1.2,
        colormap           = [[1 0.7 0 .8  1 .55 0.05 .8   .05 .05 .05 .8  	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 4,
        particlelife       = 16,
        particlelifespread = 16,
        particlesize       = 0.6,
        particlesizespread = 6,
        particlespeed      = 2,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r.85]],
        sizemod            = 1.0,
        texture            = [[GenericSmokeCloud1]],
        useairlos          = true,
      },
    },
  },

}

