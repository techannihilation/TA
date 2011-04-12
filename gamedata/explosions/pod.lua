-- factory_expl

return {
  ["factory_expl"] = {
    usedefaultexplosions = true,
    boom = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 5,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[7 i10]],
        explosiongenerator = [[custom:LIGHT_PLASMA_IGNITE]],
        pos                = [[-50 r100, 0 r20,  -50 r100]],
      },
    },
    burst = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[7 i8]],
        explosiongenerator = [[custom:LIGHT_PLASMA_IGNITE]],
        pos                = [[-50 r100, 0 r11,  -50 r100]],
      },
    },
  },

}

