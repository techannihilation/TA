-- spiketest

return {
  ["spiketest"] = {
    usedefaultexplosions = true,
      spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 24,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.15,
        color              = [[1.0, 0.5, 0.3]],
        dir                = [[-25 r50,-25 r50,-25 r50]],
        length             = 1,
        width              = 40,
      },
    },
  },
}

