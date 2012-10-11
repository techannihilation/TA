-- comgate_teleport
-- comgate_teleport_circle_lightning
-- comgate_teleport_glow
-- comgate
-- gate_circle_flash
-- comgate_teleport_circle_lightning_single

return {
  ["comgate_teleport"] = {
    boom = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 85,
        explosiongenerator = [[custom:GATE_CIRCLE_FLASH]],
        pos                = [[0, 0, 0]],
      },
    },
    ["electric circle0"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[21 r106]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[150 r-300, 0, 150 r-300]],
      },
    },
    ["electric circle1"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 30,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[22 r140]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[100 r-200, 0, 100 r-200]],
      },
    },
    ["electric circle2"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 30,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[6 r162]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[60 r-120, 0, 60 r-120]],
      },
    },
    ["electric circle3"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 60,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 r125]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[72 r-144, 0, 72 r-144]],
      },
    },
    ["electric circle4"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        delay              = 84,
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[20 r-40, 0, 20 r-40]],
      },
    },
    ["electric circle5"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[155 r250]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING]],
        pos                = [[72 r-144, 0, 72 r-144]],
      },
    },
    glow = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i5]],
        explosiongenerator = [[custom:COMGATE_TELEPORT_GLOW]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["comgate_teleport_circle_lightning"] = {
    ["electric circle5"] = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:COMGATE_TELEPORT_CIRCLE_LIGHTNING_SINGLE]],
        pos                = [[26 r-52, 0, 26 r-52]],
      },
    },
  },

  ["comgate_teleport_glow"] = {
    glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0 0 0 0.01   1 1 1 1             0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[-0, 1, 0]],
        gravity            = [[0, 0.00, 0]],
        numparticles       = 1,
        particlelife       = 200,
        particlelifespread = 0,
        particlesize       = 100,
        particlesizespread = 10,
        particlespeed      = 0.1,
        particlespeedspread = 0,
        pos                = [[0, 42, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[circularthingy]],
      },
    },
  },

  ["comgate"] = {
    boom = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:COMGATE_TELEPORT]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["gate_circle_flash"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 0.7,
      circlegrowth       = 25,
      flashalpha         = 1.2,
      flashsize          = 430,
      ttl                = 16,
      color = {
        [1]  = 0.55000001192093,
        [2]  = 0.69999998807907,
        [3]  = 0.89999997615814,
      },
    },
  },

  ["comgate_teleport_circle_lightning_single"] = {
    wezels = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.5,
        colormap           = [[1 1 1 0.01     1 1 1 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0.01 r-0.02, 0.01 r-0.02, 0.01 r-0.01]],
        numparticles       = 1,
        particlelife       = 2,
        particlelifespread = 0,
        particlesize       = 10,
        particlesizespread = 30,
        particlespeed      = 0,
        particlespeedspread = 0,
        pos                = [[0, 1, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[lightb]],
      },
    },
  },

}

