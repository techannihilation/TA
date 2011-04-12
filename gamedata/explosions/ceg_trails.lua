-- coresmalltrail0

return {
  ["coresmalltrail0"] = {
    smoketrail = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.5,
        colormap           = [[0 0 0 0.001   0 0 0 0.4   0.1 0.1 0.1 0.2   0 0 0 0.05   0 0 0 0]],
        delay              = 1,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 20,
        particlelifespread = 15,
        particlesize       = 3,
        particlesizespread = 0,
        particlespeed      = 0,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.10,
        sizemod            = 1.0,
        texture            = [[graysmoke]],
      },
    },
  },

}

