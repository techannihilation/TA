-- beammuzzle
-- shotgun
-- bluemuzzle
-- redmuzzle
-- large_muzzle_flash_fx
-- vulcan

return {
  ["beammuzzle"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.01    1 0.2 1 0.01 	 0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[flash3]],
        length             = 50,
        sidetexture        = [[shot]],
        size               = 20,
        sizegrowth         = -1,
        ttl                = 5,
      },
    },
  },

  ["shotgun"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.01	0.5 0.5 0.2 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[shotgunflare]],
        length             = 6,
        sidetexture        = [[shotgunside]],
        size               = 5,
        sizegrowth         = 3,
        ttl                = 2,
      },
    },
  },

  ["bluemuzzle"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.01	0.5 0.5 1 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[flash3]],
        length             = 30,
        sidetexture        = [[shot]],
        size               = 10,
        sizegrowth         = 1,
        ttl                = 5,
      },
    },
  },

  ["redmuzzle"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.01	1 0.4 0.4 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0.05,
        fronttexture       = [[flash3]],
        length             = 30,
        sidetexture        = [[shot]],
        size               = 10,
        sizegrowth         = 1,
        ttl                = 7,
      },
    },
  },

  ["large_muzzle_flash_fx"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[0.9 0.8 0.1 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[muzzlefront]],
        length             = 50,
        sidetexture        = [[muzzleside]],
        size               = 9,
        sizegrowth         = -1,
        ttl                = 10,
      },
    },
  },

  ["vulcan"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.01	1 0.5 0.8 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0.05,
        fronttexture       = [[flash3]],
        length             = 30,
        sidetexture        = [[shot]],
        size               = 5,
        sizegrowth         = 1,
        ttl                = 1.5,
      },
    },
  },

}

