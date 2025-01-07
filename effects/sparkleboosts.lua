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
  -- BUILDPWR EFFECT
  --------------------------------------------------------------------------------
  ["buildpwr_effect"] = {
    sparklespawn = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 12,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i0.13 r1]],
        explosiongenerator = [[custom:buildpwr_effect_control]],
        pos                = [[-3 r6, 0 r38, -3 r6]],
      },
    },
  },

  ["buildpwr_effect_control"] = {
    poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      properties = {
        airdrag            = 0.2,
        alwaysvisible      = false,

        --colormap           = [[0.3 0.9 0.3 0.07   0.2 0.7 0.2 0.011   0.1 0.4 0.1 0.001   0.05 0.15 0.05 0.001]],
        colormap           = [[0.0 1.0 0.5 0.07   0.0 0.8 0.4 0.011   0.0 0.6 0.3 0.001   0.0 0.3 0.1 0.001]],
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
  -- MAGICUPG EFFECT
  --------------------------------------------------------------------------------
  ["magicUpg_effect"] = {
      sparklespawn = {
        air                = true,
        class              = [[CExpGenSpawner]],
        count              = 12,
        ground             = true,
        water              = false,
        properties = {
          delay              = [[0 i0.13 r1]],
          explosiongenerator = [[custom:magicUpg_effect_control]],
          pos                = [[-3 r6, 0 r38, -3 r6]],
        },
      },
    },

  ["magicUpg_effect_control"] = {
    poof01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      properties = {
        airdrag            = 0.5,
        alwaysvisible      = true,
        colormap           = [[
          0.8 0.2 1.0 0.15
          0.4 0.6 1.0 0.12
          0.2 1.0 0.5 0.09
          0.1 0.5 0.8 0.06
          0.0 0.3 0.5 0.03
        ]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 60,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 10, 0]],
        numparticles       = 5,
        particlelife       = [[0.5 i0.5 r0.5]],
        particlelifespread = 8,
        particlesize       = 2.5,
        particlesizespread = 1.5,
        particlespeed      = 20,
        particlespeedspread = 3,
        pos                = [[0, 0, 0]],
        sizegrowth         = -0.35,
        sizemod            = 1.0,
        texture            = [[nanonew]],
        useairlos          = false,
      },
    },
  },

 }