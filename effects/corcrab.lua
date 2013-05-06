-- hplasma
-- laser6

return {
  ["hplasma"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.3,
      circlegrowth       = 8,
      flashalpha         = 0.9,
      flashsize          = 35,
      ground             = true,
      ttl                = 10,
      water              = true,
      color = {
        [1]  = 0.10000000149012,
        [2]  = 1,
        [3]  = 0.60000002384186,
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
        size               = 8,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[r-1 r1, r-1 r1, r-1 r1]],
        texture            = [[PlasmaHeatB]],
      },
    },
  },

  ["laser6"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0,
      circlegrowth       = 0,
      flashalpha         = 0.9,
      flashsize          = 5,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.25,
        [3]  = 0.5,
      },
    },
    smoke = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.03,
        color              = [[0.8 r0.2]],
        pos                = [[5 r-5, 5 r-5, 5 r-5]],
        size               = 1,
        sizeexpansion      = 0.25,
        speed              = [[0, 0.6 r0.3, 0]],
        startsize          = 0.5,
      },
    },
  },

}

