--flashbigbuilding_buzz

return {
  ["flashbigbuilding_buzz"] = {
    usedefaultexplosions = true,
      fakelight = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[1 1 1 1    1 0.6 0.25 1     0 0 0 0.1]],
        size               = [[120 r-5]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[119 r4 r-4]],
      },
    },
    fakering = {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 4,
      ground             = true,
      water              = false,
      properties = {
        colormap           = [[1 1 0 1  1 0.6 0.25 1     0 0 0 0.1]],
        size               = 5,
        sizegrowth         = [[30 r-3]],
        texture            = [[groundring]],
        ttl                = 22,
      },
    },
  },
}
