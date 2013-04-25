-- purplelaser2

return {
  ["purplelaser2"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 0.555,
      circlegrowth       = 3,
      flashalpha         = 3,
      flashsize          = 10.0,
      ttl                = 6,
      color = {
        [1]  = 0.10999999940395,
        [2]  = 0.032999999821186,
        [3]  = 0.5,
      },
    },
    heatcloud = {
      air                = true,
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 15,
        heatfalloff        = 1,
        maxheat            = 15,
        pos                = [[0, -0.55, 0]],
        size               = 1.15,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0, 0.45r, 0]],
      },
    },
    smoke = {
      air                = true,
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.03,
        color              = 5.0,
        pos                = [[0, -2, 0]],
        size               = 1.25,
        sizeexpansion      = 0.4,
        speed              = [[0, 0.33, 0]],
        startsize          = 1.25,
      },
    },
  },

}

