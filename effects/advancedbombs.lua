-- arm_bigbomb_explosion
-- core_bigbomb_explosion

return {
  ["arm_bigbomb_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 6,
      flashalpha         = 0.8,
      flashsize          = 40,
      ground             = true,
      ttl                = 17,
      water              = true,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.81999999284744,
        [3]  = 0.73000001907349,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        directional        = true,
        emitrot            = 50,
        emitrotspread      = 50,
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 25,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[flowexplo]],
      },
    },
  },

  ["core_bigbomb_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 1,
      flashalpha         = 0.6,
      flashsize          = 35,
      ground             = true,
      ttl                = 60,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.60000002384186,
        [3]  = 0.40000000596046,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        directional        = true,
        emitrot            = 50,
        emitrotspread      = 50,
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 20,
        pos                = [[r-55 r55, 5, r-55 r55]],
        size               = 25,
        sizegrowth         = 0.9,
        speed              = [[r-2 r2, 1 0, r-2 r2]],
        texture            = [[cloudexplo]],
      },
    },
  },

}

