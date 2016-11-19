-- tllgen_spark

return {
  ["tllgen_spark"] = {
     teleport_device_spawn = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i0.10 r1]],
        explosiongenerator = [[custom:tllgen_spark_effect]],
        pos                = [[-19 , -19, -20]],
      },
    },
  },
   ["tllgen_spark_effect"] = {
      poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      properties = {
        airdrag            = 0.2,
        alwaysvisible      = false,
        colormap           = [[0.2 0.2 0.9 0.01		0.2 0.2 0.8 0.01				0.1 0.1 0.1 0.01]],
        directional        = false,
        emitrot            = [[0 r3]],
        emitrotspread      = [[0 r3]],
        emitvector         = [[1, 1, 1]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = [[30 i0.43 r1]],
        particlelifespread = 0,
        particlesize       = 6,
        particlesizespread = 0,
        particlespeed      = 16,
        particlespeedspread = 0,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = -1,
        texture            = [[lightningball_new]],
        useairlos          = false,
      },
    },
  },
}

