-- napalmfireball_piece
-- napalmfireball_piece3
-- napalmfireball_piece2
-- napalm_expl

return {
  ["napalmfireball_piece"] = {
    rocks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.97,
        colormap           = [[0 0 0 0.01   0.9 0.9 .9 0.5     0.9 0.9 .9 0.5    0.9 0.9 .9 0.5   0 0 0 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0.001 r-0.002, 0.01 r-0.02, 0.001 r-0.002]],
        numparticles       = 1,
        particlelife       = 20,
        particlelifespread = 5,
        particlesize       = 30,
        particlesizespread = 30,
        particlespeed      = 1.2,
        particlespeedspread = 1.2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.04,
        sizemod            = 1.0,
        texture            = [[flame]],
      },
    },
  },

  ["napalmfireball_piece3"] = {
    smoke1 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.050,
        color              = [[0.5 r0.1]],
        pos                = [[r10 r-20, -50 r-10, r10 r-20]],
        size               = 15,
        sizeexpansion      = [[2 r3]],
        sizegrowth         = 1,
        speed              = [[2 r-4, 1 r-1, 2 r-4]],
        startsize          = 5,
      },
    },
  },

  ["napalmfireball_piece2"] = {
    rocks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.90,
        colormap           = [[0 0 0  0.01   0.9 0.9 0.9 0.5  0.9 0.9 0.9 0.5  0.9 0.9 0.9 0.5     0.9 0.9 0.9 0.5     0.9 0.9 .5 0.5       0.9 0.9 0.5 0.5       0.9 0.9 0.5 0.5      0.9 0.9 0.5 0.5   0.9 0.5 0.0 0.5   0.9 0.5 0.0 0.5    0.9 0.5 0.0 0.3   0 0 0 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0.001 r-0.002, 0.0, 0.001 r-0.002]],
        numparticles       = 1,
        particlelife       = 40,
        particlelifespread = 5,
        particlesize       = 30,
        particlesizespread = 10,
        particlespeed      = 5,
        particlespeedspread = 2,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.05,
        sizemod            = 1.0,
        texture            = [[flame]],
      },
    },
  },

  ["napalm_expl"] = {
    usedefaultexplosions = true,
    fwoosh = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:NAPALMFIREBALL_piece2]],
        pos                = [[0, 10, 0]],
      },
    },
    groundflash = {
      flashalpha         = 2.2,
      flashsize          = 280,
      ttl                = 20,
      color = {
        [1]  = 1,
        [2]  = 0.60000002384186,
        [3]  = 0,
      },
    },
    ploom = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 20,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0  i2]],
        explosiongenerator = [[custom:NAPALMFIREBALL_piece]],
        pos                = [[10 r20, i1, -10 r20]],
      },
    },
  },

}

