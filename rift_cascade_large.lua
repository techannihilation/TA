return {
  ["rift_cascade_large"] = {
    usedefaultexplosions = false,
    burst = {
      air                   = true,
      class                 = [[CExpGenSpawner]],
      count                 = 12,
      ground                = true,
      water                 = true,
      properties = {
        delay               = [[0 i4]],
        explosiongenerator  = [[custom:purple_explosion]],
        pos                 = [[-120 r240, 1 r30, -120 r240]],
      },
    },
    groundflash = {
      air = true,
      class = [[CSimpleGroundFlash]],
      count = 1,
      ground = true,
      water = true,
      properties = {
        colormap = [[0.8 0 1 1   0 0 0 0.1]],
        size = 150,
        sizegrowth = 2,
        ttl = 40,
      },
    },
  },
}