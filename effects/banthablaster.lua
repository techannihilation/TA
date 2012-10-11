-- flashbantha
-- banthablaster
-- banthamuzzle

return {
  ["flashbantha"] = {
    groundflash = {
      circlealpha        = 1.3,
      circlegrowth       = 3,
      flashalpha         = 0.9,
      flashsize          = 22,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 1,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 11,
        heatfalloff        = 1.3,
        maxheat            = 15,
        pos                = [[0,0,0]],
        size               = 1.5,
        sizegrowth         = 2,
        speed              = [[0, 1 0, 0]],
        texture            = [[brightblueexplo]],
      },
    },
    splash1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = .96,
        colormap           = [[1 1 1 1    0.2 0.5 0.9 1   0.3 0.6 0.8 0.3   0.4 0.7 0.7 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0,0,0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 10,
        particlelifespread = 0,
        particlesize       = 30,
        particlesizespread = 0,
        particlespeed      = 0,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        size               = 0.2,
        sizegrowth         = -3,
        sizemod            = 1,
        texture            = [[brightblueexplo]],
      },
    },
  },

  ["banthablaster"] = {
    splashes = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      ground             = true,
      properties = {
        airdrag            = .96,
        colormap           = [[0.2 0.5 0.9 1   0.3 0.6 0.8 0.3   0.4 0.7 0.7 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 30,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 1,
        particlelifespread = 1,
        particlesize       = 2,
        particlesizespread = 4,
        particlespeed      = 1,
        particlespeedspread = 2,
        pos                = [[0, 1.0, 0]],
        size               = 0.1,
        sizegrowth         = -.2,
        sizemod            = 1,
        texture            = [[brightblueexplo]],
      },
    },
  },

  ["banthamuzzle"] = {
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 11,
        heatfalloff        = 1.3,
        maxheat            = 15,
        pos                = [[0,0,0]],
        size               = 1.5,
        sizegrowth         = 2,
        speed              = [[0, 1 0, 0]],
        texture            = [[brightblueexplo]],
      },
    },
  },

}

