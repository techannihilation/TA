-- uw_laser_burn

return {
  ["uw_laser_burn"] = {
    usedefaultexplosions = false,
    burnpop = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, r0 r1, r-2 r2]],
        size               = 2,
        sizegrowth         = 0.1,
        speed              = [[0, 0, 0]],
        texture            = [[brightblueexplo]],
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.9,
      flashsize          = 9,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 0.80000001192093,
        [3]  = 0.69999998807907,
      },
    },
    searingflame = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      underwater         = 0,
      unit               = 1,
      properties = {
        airdrag            = 0.8,
        alwaysvisible      = false,
        colormap           = [[1 1 1 0.04	0.6 0.6 0.8 0.01	0.3 0.3 0.6 0.01]],
        directional        = true,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.01, 0]],
        numparticles       = 1,
        particlelife       = 1,
        particlelifespread = 3,
        particlesize       = 7,
        particlesizespread = 0,
        particlespeed      = 3,
        particlespeedspread = 3,
        pos                = [[0, 2, 0]],
        sizegrowth         = 1,
        sizemod            = 0.5,
        texture            = [[gunshot]],
        useairlos          = false,
      },
    },
  },

}

