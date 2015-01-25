-- launchnuke
-- launchnuke_small

return {
  ["launchnuke"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    spawner_smoke = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i6]],
        explosiongenerator = [[custom:LingeringSmoke]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["lingeringsmoke"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    initialblastwave = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.95,
        colormap           = [[0.7 0.5 0.2 0.1 0.18 0.18 0.18 0.2 0.15 0.15 0.15 0.2 0.0 0.0 0.0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 5,
        emitvector         = [[0.2, 1, 0.2]],
        gravity            = [[0, -0.1, 0]],
        numparticles       = 120,
        particlelife       = 50,
        particlelifespread = 1,
        particlesize       = 16,
        particlesizespread = 2,
        particlespeed      = 12,
        particlespeedspread = -12,
        pos                = [[0, 1, 0]],
        sizegrowth         = 1,
        sizemod            = 1.0,
        texture            = [[smoke]],
      },
    },
  },
   ["launchnuke_small"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    spawner_smoke = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i6]],
        explosiongenerator = [[custom:LingeringSmoke_small]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["lingeringsmoke_small"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    initialblastwave = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.90,
        colormap           = [[0.7 0.5 0.2 0.1 0.18 0.18 0.18 0.2 0.15 0.15 0.15 0.2 0.0 0.0 0.0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 5,
        emitvector         = [[0.2, 1, 0.2]],
        gravity            = [[0, -0.1, 0]],
        numparticles       = 120,
        particlelife       = 50,
        particlelifespread = 1,
        particlesize       = 16,
        particlesizespread = 2,
        particlespeed      = 12,
        particlespeedspread = -12,
        pos                = [[0, 1, 0]],
        sizegrowth         = 1,
        sizemod            = 1.0,
        texture            = [[smoke]],
      },
    },
  },
}

