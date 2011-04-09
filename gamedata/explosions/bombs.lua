-- t1armbomb
-- t1corebomb

return {
  ["t1armbomb"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 4,
      flashalpha         = 1.9,
      flashsize          = 60,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["t1corebomb"] = {
    usedefaultexplosions = true,
    dirt = {
      count              = 4,
      ground             = true,
      properties = {
        alphafalloff       = 2,
        color              = [[0.2, 0.1, 0.05]],
        pos                = [[r-10 r10, 0, r-10 r10]],
        size               = 20,
        speed              = [[r1.5 r-1.5, 2, r1.5 r-1.5]],
      },
    },
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 6,
      flashalpha         = 0.9,
      flashsize          = 60,
      ground             = true,
      ttl                = 13,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.80000001192093,
        [3]  = 0.20000000298023,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 1.3,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 3,
        sizegrowth         = 25,
        speed              = [[0, 1 0, 0]],
        texture            = [[flare]],
      },
    },
  },

}

