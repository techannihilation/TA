-- dguntrace

return {
  ["dguntrace"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 0.35,
      circlegrowth       = 0.001,
      flashalpha         = 3.5,
      flashsize          = 20,
      ttl                = 80,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0.20000000298023,
      },
    },
    heatcloud = {
      air                = true,
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        color              = [[0.0, 1, 0.5]],
        heat               = 15,
        heatfalloff        = 1,
        maxheat            = 15,
        pos                = [[0, 1, 0]],
        size               = 3.75,
        sizegrowth         = -2.25,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0, 0, 0]],
      },
    },
    smoke = {
      air                = true,
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.0075,
        color              = 1.1,
        pos                = [[0, 0, 0]],
        size               = 2.25,
        sizeexpansion      = 0.1,
        sizegrowth         = 0.2,
        speed              = [[0, 0.33, 0]],
        startsize          = 2.25,
      },
    },
  },

}

