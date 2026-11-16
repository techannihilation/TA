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
  
  ["lblue_trail_cannon_large"] = {
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
        color              = [[0.6, 1, 1]],
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

  ["lblue_trail_cannon"] = {
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
        color              = [[0.6, 0.6, 1]],
        dir                = [[-4 r6,-4 r6,-4 r6]],
        length             = 6,
        width              = 2,
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

  ["lblue_trail_cannon_med"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1.2,
        alphadecay         = 0.48,
        color              = [[0.5, 0.8, 1]],
        dir                = [[-2 r3,-2 r3,-2 r3]],
        length             = 10,
        width              = 2,
      },
    },
  },

}