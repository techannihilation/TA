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
  
 ["webbluelight"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        heat               = 35,
        heatfalloff        = 0.54,
        maxheat            = 35,
        pos                = [[0, 0.0, 0]],
        size               = [[15.0 r1]],
        sizegrowth         = [[0.09 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.04 r-0.1, 0.04 r-0.1, 0.04 r-0.1]],
        texture            = [[blueexploredexplo]],
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

