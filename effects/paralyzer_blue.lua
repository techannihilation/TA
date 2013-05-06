-- paralyzer_blue

return {
  ["paralyzer_blue"] = {
    usedefaultexplosions = false,
    bluespark = {
      air                = true,
      class              = [[dirt]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        color              = [[0.2, 0.06, 0.9]],
        pos                = [[1, 0, 0]],
        size               = [[0.1 r0.9 d0.02]],
        sizeexpansion      = 0.5,
        slowdown           = 0,
      },
    },
    groundflash = {
      circlealpha        = 0.555,
      circlegrowth       = 3,
      flashalpha         = 3,
      flashsize          = 5.0,
      ttl                = 6,
      color = {
        [1]  = 0.10000000149012,
        [2]  = 0.059999998658895,
        [3]  = 0.89999997615814,
      },
    },
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 5,
        heatfalloff        = 1,
        maxheat            = 5,
        pos                = [[0, -0.15, 0]],
        size               = 0.55,
        sizegrowth         = 0.25,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0, 0.10r, 0]],
      },
    },
    smoke = {
      air                = true,
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.03,
        color              = 0.0,
        pos                = [[0, 0, 0]],
        size               = 0.2,
        sizeexpansion      = 0.1,
        speed              = [[0, 0.6, 0.0]],
        startsize          = 0.1,
      },
    },
  },

}

