return {
  ["rift_cascade"] = {
    usedefaultexplosions = false,
    burst = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 i6]],
        explosiongenerator = [[custom:purple_explosion]],
        pos                = [[-80 r160, 1 r20, -80 r160]],
      },
    },
    groundflash = {
      air                = true,
      class              = [[CSimpleGroundFlash]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        colormap           = [[0.8 0 1 1   0 0 0 0.1]],
        size               = 100,
        sizegrowth         = 1,
        ttl                = 30,
      },
    },
  },
}