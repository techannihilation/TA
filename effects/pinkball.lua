-- pinkbolt

return {
  ["pinkbolt"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.3,
      circlegrowth       = 6,
      flashalpha         = 0.9,
      flashsize          = 15,
      ground             = true,
      ttl                = 10,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0,
        [3]  = 0,
      },
    },
    heatcloud = {
      air                = true,
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 20,
        heatfalloff        = 1,
        maxheat            = 25,
        pos                = [[0, 0, 0]],
        size               = 10,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[r-0.25 r0.25, r-0.25 r0.25, r-0.25 r0.25]],
        texture            = [[PINKBALL1]],
      },
    },
  },

}

