-- light_plasma
-- light_plasma_ignite

return {
  ["light_plasma"] = {
    foom = {
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = false,
      unit               = 1,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LIGHT_PLASMA_IGNITE]],
        pos                = [[dir]],
      },
    },
    groundflash = {
      circlealpha        = 0.35,
      circlegrowth       = 0.001,
      flashalpha         = 1.5,
      flashsize          = 12,
      ttl                = 14,
      color = {
        [1]  = 0.99599999189377,
        [2]  = 0.98000001907349,
        [3]  = 0.56599998474121,
      },
    },
  },

  ["light_plasma_ignite"] = {
    foom = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      unit               = 1,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[dir]],
        size               = 7,
        sizegrowth         = 0.7,
        speed              = [[dir]],
        texture            = [[explo]],
      },
    },
  },

}

