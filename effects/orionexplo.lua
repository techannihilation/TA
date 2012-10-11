-- orionexplo

return {
  ["orionexplo"] = {
    usedefaultexplosions = false,
    flamey = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:CHARLIZE_ANI]],
        pos                = [[0, 7, 0]],
      },
    },
    groundflash = {
      circlealpha        = .5,
      circlegrowth       = 5,
      flashalpha         = 1.8,
      flashsize          = 75,
      ttl                = 20,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.40000000596046,
      },
    },
  },

}

