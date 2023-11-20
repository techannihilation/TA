return {
  ["arm_ban_rocket"] = {
    usedefaultexplosions = false,
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[0.1 0.1 1.0 0.01 0.0 0.0 0.9 0.01 0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[laserend]],
        length             = 20,
        sidetexture        = [[laserend]],
        size               = 5.5,
        sizegrowth         = 0.75,
        ttl                = 2,
      },
    },
  },
}
