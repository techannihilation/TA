-- trail_medium_rocket

return {
  ["trail_medium_rocket"] = {
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.8 0.2 0.01		1.0 0.2 0.1 0.01	0.6 0.1 0.1 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[none]],
        length             = 8,
        sidetexture        = [[flashside1]],
        size               = 4.3,
        sizegrowth         = 2.9,
        ttl                = 2,
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
        colormap           = [[1 0.3 0 .01     	0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = [[0 r360]],
        emitvector         = [[1, 0, 1]],
        gravity            = [[0, 0, 0]],
        numparticles       = 6,
        particlelife       = 1,
        particlelifespread = 4,
        particlesize       = 1,
        particlesizespread = 2,
        particlespeed      = 3,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = [[0.0 r.05]],
        sizemod            = 1.0,
        texture            = [[NarrowBoltNoisy]],
        useairlos          = true,
      },
    },
  },

}

