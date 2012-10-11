-- beammuzzle
-- shotgun
-- muendungsfeuerlong
-- bluemuzzle
-- redmuzzle
-- large_muzzle_flash_fx
-- muendungsfeuer
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

  ["muendungsfeuerlong"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.07  1 0.7 0 0.01	0.9 0.3 0 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[BLANK]],
        length             = 18,
        sidetexture        = [[plasmamuzzle]],
        size               = 12,
        sizegrowth         = 1,
        ttl                = 6,
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.4,
      flashsize          = 35,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0,
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

  ["muendungsfeuer"] = {
    bitmapmuzzleflame = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1 1 1 0.07  1 0.7 0 0.01	0.9 0.3 0 0.01	0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[BLANK]],
        length             = 18,
        sidetexture        = [[plasmamuzzle]],
        size               = 12,
        sizegrowth         = 1,
        ttl                = 3,
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.4,
      flashsize          = 35,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0,
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

