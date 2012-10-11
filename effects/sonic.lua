-- sonicwavebluetrail
-- sonicwavegreen
-- sonicwaveredtrail
-- sonicwaveblue
-- sonicwavered
-- sonicwavegreentrail

return {
  ["sonicwavebluetrail"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 0.1,
      circlegrowth       = 0,
      flashalpha         = 0.25,
      flashsize          = 35,
      ttl                = 4,
      color = {
        [1]  = 0.14000000059605,
        [2]  = 0.14000000059605,
        [3]  = 1,
      },
    },
    spikes = {
      air                = true,
      alwaysvisible      = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.4,
        alphadecay         = 0.008,
        alwaysvisible      = true,
        color              = [[0.14, 0.14, 1,]],
        dir                = [[-2 r3,-2 r3,-2 r3]],
        length             = 1.5,
        width              = 1,
      },
    },
  },

  ["sonicwavegreen"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.8,
      flashsize          = 48,
      ttl                = 5,
      color = {
        [1]  = 0.14000000059605,
        [2]  = 1,
        [3]  = 0.14000000059605,
      },
    },
    meltage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_MELT1]],
        pos                = [[0, 0, 0]],
      },
    },
    pikage = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.2,
        color              = [[0.14, 1, 0.14,]],
        dir                = [[-5 r10,-5 r10,-5 r10]],
        length             = 6,
        width              = 2,
      },
    },
    sparkage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_SPARKS1]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["sonicwaveredtrail"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 0.1,
      circlegrowth       = 0,
      flashalpha         = 0.25,
      flashsize          = 35,
      ttl                = 4,
      color = {
        [1]  = 1,
        [2]  = 0.14000000059605,
        [3]  = 0.10999999940395,
      },
    },
    spikes = {
      air                = true,
      alwaysvisible      = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.4,
        alphadecay         = 0.008,
        alwaysvisible      = true,
        color              = [[1, 0.14, 0.11,]],
        dir                = [[-2 r3,-2 r3,-2 r3]],
        length             = 1.5,
        width              = 1,
      },
    },
  },

  ["sonicwaveblue"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.8,
      flashsize          = 48,
      ttl                = 5,
      color = {
        [1]  = 0.14000000059605,
        [2]  = 0.14000000059605,
        [3]  = 1,
      },
    },
    meltage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_MELT1]],
        pos                = [[0, 0, 0]],
      },
    },
    pikage = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.2,
        color              = [[0.14, 0.14, 1,]],
        dir                = [[-5 r10,-5 r10,-5 r10]],
        length             = 6,
        width              = 2,
      },
    },
    sparkage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_SPARKS1]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["sonicwavered"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.8,
      flashsize          = 48,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 0.14000000059605,
        [3]  = 0.10999999940395,
      },
    },
    meltage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_MELT1]],
        pos                = [[0, 0, 0]],
      },
    },
    pikage = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.2,
        color              = [[1, 0.14, 0.11]],
        dir                = [[-5 r10,-5 r10,-5 r10]],
        length             = 6,
        width              = 2,
      },
    },
    sparkage = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 0,
        explosiongenerator = [[custom:LASERS_SPARKS1]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["sonicwavegreentrail"] = {
    alwaysvisible      = true,
    groundflash = {
      circlealpha        = 0.1,
      circlegrowth       = 0,
      flashalpha         = 0.25,
      flashsize          = 35,
      ttl                = 4,
      color = {
        [1]  = 0.14000000059605,
        [2]  = 1,
        [3]  = 0.14000000059605,
      },
    },
    spikes = {
      air                = true,
      alwaysvisible      = true,
      class              = [[explspike]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.4,
        alphadecay         = 0.008,
        alwaysvisible      = true,
        color              = [[0.14, 1, 0.14,]],
        dir                = [[-2 r3,-2 r3,-2 r3]],
        length             = 1.5,
        width              = 1,
      },
    },
  },

}

