-- emgtrail
-- vtol_emgtrail
-- weaver_emgtrail

return {
  ["emgtrail"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.5,
        color              = [[1.0, 0.7, 0.2]],
        dir                = [[-1 r2,-1 r2,-1 r2]],
        length             = 4,
        width              = 4,
      },
    },
  },

  ["vtol_emgtrail"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.5,
        color              = [[1.0, 0.4, 0.2]],
        dir                = [[-1 r3,-1 r3,-1 r3]],
        length             = 5,
        width              = 5,
      },
    },
  },

  ["weaver_emgtrail"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.5,
        color              = [[0.5, 0.5, 1]],
        dir                = [[-1 r3,-1 r3,-1 r3]],
        length             = 5,
        width              = 5,
      },
    },
  },

}

