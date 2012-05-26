-- gantwhitelight
-- webbluelight
-- smallwhitelight
-- whitelight
-- yellowlight
-- bluelight

return {
  ["gantwhitelight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 30,
        heatfalloff        = 0.34,
        maxheat            = 30,
        pos                = [[0, 0.0, 0]],
        size               = [[20.0 r1]],
        sizegrowth         = [[0.09 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[whitelight]],
        useairlos          = false,
      },
    },
  },
  
 

  
  ["smallwhitelight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 25,
        heatfalloff        = 1.14,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[6.0 r1]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[yellowlight]],
        useairlos          = false,
      },
    },
  },

  ["whitelight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 25,
        heatfalloff        = 1.14,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r1]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[WhiteLight]],
        useairlos          = false,
      },
    },
  },

  
  ["yellowlight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 2,
      ground             = true,
      useairlos          = false,
      water              = true,
      properties = {
        heat               = 25,
        heatfalloff        = 0.55,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r1]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[YellowLight]],
        useairlos          = false,
      },
    },
  },
  
    ["yellowmaker"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.2,
      circlegrowth       = 3,
      flashalpha         = 0.5,
      flashsize          = 20,
      ground             = true,
      ttl                = 40,
      water              = true,
      color = {
        [1]  = 0.75,
        [2]  = 0.75,
        [3]  = 0.2,
      },
    },
    heatcloud_newnanoboomarm_fx_main = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
		colormap           = [[0.9 0.9 0.8 0.6      1 1 0.1 0.4]],
        heat               = 20,
        heatfalloff        = 1,
        maxheat            = 20,
        pos                = [[7 r-14, 5.5, 7 r-14]],
        size               = 10,
        sizegrowth         = -0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0, -0.275, 0]],
        texture            = [[genericsmokecloud1]],
      },
    },
    particlesystem_newnanoboomarm_fx01 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 1.0,
        colormap           = [[0.9 0.9 0.8 0.6      1 1 0.1 0.4]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 180,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 220,
        particlelife       = 60,
        particlelifespread = 10,
        particlesize       = 2.2,
        particlesizespread = 1,
        particlespeed      = 3,
        particlespeedspread = 1,
        pos                = [[0, 1.0, 0]],
        sizegrowth         = -0.01,
        sizemod            = 1.0,
        texture            = [[genericsmokecloud1]],
        useairlos          = true,
      },
    },
  },
   ["bluelight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 25,
        heatfalloff        = 1.14,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r1]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[purpleexplowebblue]],
        useairlos          = false,
      },
    },
  },
}

