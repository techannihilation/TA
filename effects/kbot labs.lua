-- nano
-- whitelight

return {
  ["nano"] = {
    useairlos          = false,
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 1.5,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[8.0 r1]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[Light]],
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
  }

