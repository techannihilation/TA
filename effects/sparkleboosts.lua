return {

  --------------------------------------------------------------------------------
  -- SPEED BOOST EFFECT
  --------------------------------------------------------------------------------
  ["speedboost_effect"] = {
    sparklespawn = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 12,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i0.13 r1]],
        explosiongenerator = [[custom:speedboost_effect_control]],
        pos                = [[-3 r6, 0 r38, -3 r6]],
      },
    },
  },

  ["speedboost_effect_control"] = {
    poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      properties = {
        airdrag            = 0.2,
        alwaysvisible      = false,
        -- A blue-centric colormap
        colormap           = [[0.8 0.9 1.0 0.7   0.3 0.7 1.0 0.11   0.1 0.3 0.7 0.01   0.1 0.1 0.1 0.01]],
        directional        = false,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 20, 0]],
        numparticles       = 1,
        particlelife       = [[4 i0.43 r1]],
        particlelifespread = 16,
        particlesize       = 2.2,
        particlesizespread = 0,
        particlespeed      = 16,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.12,
        sizemod            = 1.0,
        texture            = [[nanonew]],
        useairlos          = false,
      },
    },
  },


  --------------------------------------------------------------------------------
  -- ARMOR BOOST EFFECT
  --------------------------------------------------------------------------------
  ["armorboost_effect"] = {
    sparklespawn = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 12,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i0.13 r1]],
        explosiongenerator = [[custom:armorboost_effect_control]],
        pos                = [[-3 r6, 0 r38, -3 r6]],
      },
    },
  },

  ["armorboost_effect_control"] = {
    poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      properties = {
        airdrag            = 0.2,
        alwaysvisible      = false,
        -- A red-centric colormap
        colormap           = [[1.0 0.4 0.4 0.7   1.0 0.2 0.2 0.11   0.7 0.1 0.1 0.01   0.1 0.1 0.1 0.01]],
        directional        = false,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 20, 0]],
        numparticles       = 1,
        particlelife       = [[4 i0.43 r1]],
        particlelifespread = 16,
        particlesize       = 2.2,
        particlesizespread = 0,
        particlespeed      = 16,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.12,
        sizemod            = 1.0,
        texture            = [[nanonew]],
        useairlos          = false,
      },
    },
  },


  --------------------------------------------------------------------------------
  -- CLOAK EFFECT
  --------------------------------------------------------------------------------
  ["cloak_effect"] = {
    sparklespawn = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 12,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i0.13 r1]],
        explosiongenerator = [[custom:cloak_effect_control]],
        pos                = [[-3 r6, 0 r38, -3 r6]],
      },
    },
  },

  ["cloak_effect_control"] = {
    poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      properties = {
        airdrag            = 0.2,
        alwaysvisible      = false,
        -- A purple-centric colormap
        colormap           = [[0.8 0.3 0.9 0.07   0.6 0.2 0.7 0.011   0.3 0.1 0.4 0.001   0.1 0.1 0.1 0.001]],
        directional        = false,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 20, 0]],
        numparticles       = 1,
        particlelife       = [[4 i0.43 r1]],
        particlelifespread = 16,
        particlesize       = 2.2,
        particlesizespread = 0,
        particlespeed      = 16,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.12,
        sizemod            = 1.0,
        texture            = [[nanonew]],
        useairlos          = false,
      },
    },
  },


 }