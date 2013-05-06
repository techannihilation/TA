-- plasmared21

return {
  ["plasmared21"] = {
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
        color              = [[0.3, 0.3, 0.3]],
        pos                = [[-30 r60, r30, -30 r60]],
        size               = [[10 r10 d0.01]],
        sizeexpansion      = 2,
        slowdown           = 1,
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 4,
      flashalpha         = 1,
      flashsize          = 4,
      ttl                = 8,
      color = {
        [1]  = 1,
        [2]  = 0.10000000149012,
        [3]  = 0,
      },
    },
    heatcloud = {
      air                = true,
      count              = 12,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        heat               = [[11 r11]],
        heatfalloff        = 1,
        maxheat            = 22,
        pos                = [[-25 r50, r25, -25 r50]],
        size               = [[9 r8 d0.02]],
        speed              = [[-1 r2,-1 r2,-1 r2]],
        texture            = [[RedTELE1]],
      },
    },
    smoke = {
      air                = true,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        agespeed           = 0.02,
        pos                = [[-20 r40, r20, -20 r40]],
        size               = [[5 r10]],
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
  },

}

