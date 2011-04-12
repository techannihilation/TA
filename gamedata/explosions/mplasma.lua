-- mplasma

return {
  ["mplasma"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.3,
      circlegrowth       = 7,
      flashalpha         = 0.9,
      flashsize          = 25,
      ground             = true,
      ttl                = 10,
      water              = true,
      color = {
        [1]  = 0.20000000298023,
        [2]  = 1,
        [3]  = 0.30000001192093,
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
        size               = 6,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[r-0.5 r0.5, r-0.5 r0.5, r-0.5 r0.5]],
        texture            = [[PlasmaHeatG]],
      },
    },
  },

}

