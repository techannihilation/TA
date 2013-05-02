-- trail_cannon_large
-- trail_cannon
-- trail_cannon_med

return {
  ["trail_cannon_large"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.48,
        color              = [[1.0, 0.8, 0.2]],
        dir                = [[-12 r6,-12 r6,-12 r6]],
        length             = 10.2,
        width              = 10,
      },
    },
  },

  ["trail_cannon"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.48,
        color              = [[1.0, 0.8, 0.2]],
        dir                = [[-4 r6,-4 r6,-4 r6]],
        length             = 2.2,
        width              = 3,
      },
    },
  },

  ["trail_cannon_med"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.48,
        color              = [[1.0, 0.8, 0.2]],
        dir                = [[-7 r3,-7 r3,-7 r3]],
        length             = 4.2,
        width              = 4,
      },
    },
  },

}

