-- trail_emg
-- trail_emg_upg

return {
  ["trail_emg"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.26,
        color              = [[1.0, 0.8, 0.2]],
        dir                = [[-2 r4,-2 r4,-2 r4]],
        length             = 1,
        width              = 2,
      },
    },
  },

  ["trail_emg_upg"] = {
    usedefaultexplosions = false,
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.26,
        color              = [[1.0, 0.8, 0.2]],
        dir                = [[-2 r4,-2 r4,-2 r4]],
        length             = 1.25,
        width              = 2.5,
      },
    },
  },

}

