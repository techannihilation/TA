-- purplelaser2

return {
  ["singularitybomb"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 0.6,
      flashsize          = 260,
      ttl                = 15,
      color = {
        [1]  = 0.5,
        [2]  = 0.5,
        [3]  = 0.52,
      },
    },
    heatcloud = {
      air                = true,
      count              = 10,
      ground             = true,
      water              = true,
	   color = {
        [1]  = 0.95,
        [2]  = 0.1,
        [3]  = 0.1,
      },
      properties = {
        heat               = 40,
        heatfalloff        = 3,
        maxheat            = 55,
        pos                = [[0, -0.55, 0]],
        size               = 100,
        sizegrowth         = -0.4,
        speed              = [[r0.35 r-0.35, 0 0, r0.35 r-0.35]],
        texture            = [[R1]],
      },
    },
    smoke = {
      air                = true,
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.0,
        pos                = [[0, -2, 0]],
        size               = 50,
        sizeexpansion      = 0.4,
        sizegrowth         = 0.75,
        speed              = [[0, 0.33, 0]],
        startsize          = 1.25,
      },
    },
  },

}

