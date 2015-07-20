-- depthcharger_trial

return {
  ["depthcharger_trial"] = {
    usedefaultexplosions = false,
    trail_water = {
      air                = false,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[0.2 0.2 0.2 0.01		0.1 0.1 0.1 0.01	0.0 0.0 0.0 0.00]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[null]],
        length             = 2,
        sidetexture        = [[clouds2]],
        size               = 5,
        sizegrowth         = 0.4,
        ttl                = 12,
      },
    },
  },
 
}

