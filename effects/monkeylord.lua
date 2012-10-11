-- monkeylordbeamflash
-- monkeylordy
-- monkeylord_bang

return {
  ["monkeylordbeamflash"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1.6,
      flashsize          = 40,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 0,
        [3]  = 0,
      },
    },
  },

  ["monkeylordy"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.3,
      circlegrowth       = 9,
      flashalpha         = 0.9,
      flashsize          = 30,
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
        alwaysvisible      = true,
        heat               = 20,
        heatfalloff        = 1,
        maxheat            = 25,
        pos                = [[0, 0, 0]],
        size               = 5,
        sizegrowth         = 0.5,
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[r-0.25 r0.25, r-0.25 r0.25, r-0.25 r0.25]],
        texture            = [[monkey]],
      },
    },
  },

  ["monkeylord_bang"] = {
    air                = true,
    ground             = true,
    underwater         = 1,
    usedefaultexplosions = true,
    water              = true,
    dirt = {
      air                = true,
      count              = 6,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        alphafalloff       = 2,
        color              = [[0.3, 0.3, 0.3]],
        pos                = [[-30 r60, r30, -30 r60]],
        size               = [[18 r20 r0.01]],
        sizeexpansion      = 3,
        slowdown           = 1,
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 15,
      flashalpha         = 1,
      flashsize          = 50,
      ttl                = 30,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 1,
      },
    },
    heatcloud = {
      air                = true,
      count              = 13,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        heat               = [[10 r10]],
        heatfalloff        = 1,
        maxheat            = [[18 r10]],
        pos                = [[-30 r60, r30, -30 r60]],
        size               = [[30 r35 d0.01]],
        speed              = [[-1 r2,-1 r2,-1 r2]],
      },
    },
    smoke = {
      air                = true,
      count              = 6,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        agespeed           = 0.0005,
        pos                = [[-20 i40, i20, -20 i40]],
        size               = [[35 d0.01]],
        sizegrowth         = -3,
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
    tracer = {
      air                = true,
      count              = 6,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        alphafalloff       = 1,
        color              = [[0.3, 0.3, 0.3]],
        length             = 10,
        pos                = [[-30 r60, r30, -30 r60]],
        slowdown           = 1,
        speed              = [[0.75, 0.75, 0.75]],
        wantedpos          = [[r40, r20, r40]],
      },
    },
  },

}

