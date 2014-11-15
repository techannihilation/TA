--boosterpack
return {
["boosterpack"] = {
    usedefaultexplosions = false,
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.2 0.2 0.01 0.3 0.2 0.1 0.01 0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[laserend]],
        length             = 5,
        sidetexture        = [[laserend]],
        size               = 3.5,
        sizegrowth         = 0.75,
        ttl                = 2,
      },
    },
  },
  ["boosterpack_inv"] = {
    usedefaultexplosions = false,
    engine = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.2 0.2 0.01 0.3 0.2 0.1 0.01 0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 1,
        fronttexture       = [[null]],
        length             = -12,
        sidetexture        = [[laserend]],
        size               = 4.5,
        sizegrowth         = 0.75,
        ttl                = 2,
      },
    },
  },
}