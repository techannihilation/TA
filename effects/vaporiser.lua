-- snipelaser4

return {
  ["snipelaser4"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1.0,
      circlegrowth       = 2,
      flashalpha         = 3,
      flashsize          = 15.0,
      ttl                = 24,
      color = {
        [1]  = 0.21999999880791,
        [2]  = 0.065999999642372,
        [3]  = 1,
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
        pos                = [[0, -0.25, 0]],
        size               = 1.15,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0, 0.45r, 0]],
      },
    },
  },

}

