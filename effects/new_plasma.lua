-- light_plasma
-- kargmissile_explosion
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

  ["kargmissile_explosion"] = {
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
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 1,
      flashalpha         = 0.9,
      flashsize          = 40,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0.20000000298023,
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

