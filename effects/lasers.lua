-- laser250teal
-- diesmall
-- laser_residuals_red
-- laser200pink
-- laser_residuals_green
-- laser_residuals_dblue
-- ravager
-- laseranni
-- laser_residuals_sred
-- laser_residuals_lblue
-- die
-- laser400dblue
-- lasersmallgold
-- laser120green
-- partaccel
-- laser300blue
-- laser_residuals_pink
-- laser200green

return {
  ["laser250teal"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 40,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.5,
        [3]  = 0.69999998807907,
      },
    },
    pikes15 = {
      air                = true,
      class              = [[explspike]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0,1,1]],
        dir                = [[-13 r30,-13 r30,-13 r30]],
        length             = 15,
        width              = 6,
      },
    },
  },

  ["diesmall"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 75,
      ttl                = 12,
      color = {
        [1]  = 0.75,
        [2]  = 0,
        [3]  = 0,
      },
    },
    pikes40 = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,0.5,0.5]],
        dir                = [[-40 r80,-40 r80,-40 r80]],
        length             = 45,
        width              = 15,
      },
    },
    residuals_red = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[10 r200]],
        explosiongenerator = [[custom:LASER_RESIDUALS_SRED]],
        pos                = [[-75 r150, 1, -75 r150]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 5,
        sizegrowth         = 10,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendred]],
      },
    },
  },

  ["laser_residuals_red"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 50,
      ttl                = 12,
      color = {
        [1]  = 0.5,
        [2]  = 0,
        [3]  = 0,
      },
    },
  },

  ["laser200pink"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 40,
      ttl                = 12,
      color = {
        [1]  = 1,
        [2]  = 0.12999999523163,
        [3]  = 0.70999997854233,
      },
    },
    pikes15 = {
      air                = true,
      class              = [[explspike]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,0.13,0.71]],
        dir                = [[-15 r30,-15 r30,-15 r30]],
        length             = 12,
        width              = 5,
      },
    },
  },

  ["laser_residuals_green"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 33,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.5,
        [3]  = 0,
      },
    },
  },

  ["laser_residuals_dblue"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 20,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0,
        [3]  = 0.5,
      },
    },
  },

  ["ravager"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 66,
      ttl                = 12,
      color = {
        [1]  = 1,
        [2]  = 0,
        [3]  = 1,
      },
    },
    pikes20 = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,0.6,1]],
        dir                = [[-20 r40,-20 r40,-20 r40]],
        length             = 30,
        width              = 10,
      },
    },
    residuals_pink = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[10 r200]],
        explosiongenerator = [[custom:LASER_RESIDUALS_PINK]],
        pos                = [[-100 r200, 1, -100 r200]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 10,
        sizegrowth         = 15,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendpink]],
      },
    },
  },

  ["anvil"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 0.7,
      circlegrowth       = 1,
      flashalpha         = 0.3,
      flashsize          = 66,
      ttl                = 12,
      color = {
        [1]  = 0.0,
        [2]  = 0.0,
        [3]  = 0.6,
      },
    },
    pikes20 = {
      air                = true,
      class              = [[explspike]],
      count              = 12,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.5,
        alphadecay         = 0.1,
        color              = [[0.8,0.7,0.4]],
        dir                = [[-20 r40,-20 r40,-20 r40]],
        length             = 12,
        width              = 6,
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 7,
        heatfalloff        = 1.2,
        maxheat            = 10,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 8,
        sizegrowth         = 4,
        speed              = [[0, 1 0, 0]],
        texture            = [[mildexplo]],
      },
    },
  },

  ["laseranni"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 86,
      ttl                = 12,
      color = {
        [1]  = 0.5,
        [2]  = 0.5,
        [3]  = 1,
      },
    },
    pikes16 = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0.5,0.5,1]],
        dir                = [[-16 r32,-16 r32,-16 r32]],
        length             = 30,
        width              = 5,
      },
    },
    residuals_lblue = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[10 r200]],
        explosiongenerator = [[custom:LASER_RESIDUALS_LBLUE]],
        pos                = [[-100 r200, 1, -100 r200]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 1,
        sizegrowth         = 6,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendlightblue]],
      },
    },
  },

  ["laser_residuals_sred"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 35,
      ttl                = 12,
      color = {
        [1]  = 0.5,
        [2]  = 0,
        [3]  = 0,
      },
    },
  },

  ["laser_residuals_lblue"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 66,
      ttl                = 12,
      color = {
        [1]  = 0.5,
        [2]  = 0.5,
        [3]  = 1,
      },
    },
  },

  ["die"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 100,
      ttl                = 12,
      color = {
        [1]  = 0.75,
        [2]  = 0,
        [3]  = 0,
      },
    },
    pikes50 = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,0.5,0.5]],
        dir                = [[-50 r100,-50 r100,-50 r100]],
        length             = 60,
        width              = 20,
      },
    },
    residuals_red = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[10 r200]],
        explosiongenerator = [[custom:LASER_RESIDUALS_RED]],
        pos                = [[-100 r200, 1, -100 r200]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 10,
        sizegrowth         = 15,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendred]],
      },
    },
  },

  ["laser400dblue"] = {
    groundflash = {
      circlealpha        = 0.8,
      circlegrowth       = 0,
      flashalpha         = 0.4,
      flashsize          = 55,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0,
        [3]  = 0.25,
      },
    },
    pikes16 = {
      air                = true,
      class              = [[explspike]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0,0,0.5]],
        dir                = [[-16 r32,-16 r32,-16 r32]],
        length             = 20,
        width              = 8,
      },
    },
    residuals_dblue = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[2.5 r50]],
        explosiongenerator = [[custom:LASER_RESIDUALS_DBLUE]],
        pos                = [[-25 r50, 1, -25 r50]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 1,
        sizegrowth         = 5,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendlightblue]],
      },
    },
  },

  ["lasersmallgold"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 8,
      ttl                = 12,
      color = {
        [1]  = 1,
        [2]  = 0.5,
        [3]  = 0,
      },
    },
    pikes5 = {
      air                = true,
      class              = [[explspike]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,0.8,0]],
        dir                = [[-5 r10,-5 r10,-5 r10]],
        length             = 3,
        width              = 1.5,
      },
    },
  },

  ["laser120green"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 15,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.5,
        [3]  = 0,
      },
    },
    pikes10 = {
      air                = true,
      class              = [[explspike]],
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0,1,0]],
        dir                = [[-10 r20,-10 r20,-10 r20]],
        length             = 5,
        width              = 2,
      },
    },
  },

  ["partaccel"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 66,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.80000001192093,
        [3]  = 0,
      },
    },
    pikes20 = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0.6,1,0.6]],
        dir                = [[-20 r40,-20 r40,-20 r40]],
        length             = 30,
        width              = 10,
      },
    },
    residuals_green = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[10 r200]],
        explosiongenerator = [[custom:LASER_RESIDUALS_GREEN]],
        pos                = [[-100 r200, 1, -100 r200]],
      },
    },
    whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 10,
        sizegrowth         = 15,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendgreen]],
      },
    },
  },

  ["laser300blue"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 40,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.25,
        [3]  = 0.69999998807907,
      },
    },
    pikes15 = {
      air                = true,
      class              = [[explspike]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0.1,0.5,1]],
        dir                = [[-15 r30,-15 r30,-15 r30]],
        length             = 18,
        width              = 8,
      },
    },
  },

  ["laser_residuals_pink"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 33,
      ttl                = 12,
      color = {
        [1]  = 0.5,
        [2]  = 0,
        [3]  = 0.5,
      },
    },
  },

  ["laser200green"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.6,
      flashsize          = 25,
      ttl                = 12,
      color = {
        [1]  = 0,
        [2]  = 0.44999998807907,
        [3]  = 0.050000000745058,
      },
    },
    pikes12 = {
      air                = true,
      class              = [[explspike]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[0,1,0]],
        dir                = [[-12 r24,-12 r24,-12 r24]],
        length             = 6,
        width              = 3,
      },
    },
  },
  ["diesmallwhite"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.3,
      flashsize          = 45,
      ttl                = 12,
      color = {
        [1]  = 0.75,
        [2]  = 0.75,
        [3]  = 0.75,
      },
    },
    pikes40 = {
      air                = true,
      class              = [[explspike]],
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.8,
        alphadecay         = 0.1,
        color              = [[1,1,1]],
        dir                = [[-10 r30,-10 r30,-10 r30]],
        length             = 8,
        width              = 5,
      },
    },
      whiteglow = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alwaysvisible      = true,
        heat               = 10,
        heatfalloff        = 1.2,
        maxheat            = 15,
        pos                = [[r-2 r2, 5, r-2 r2]],
        size               = 3,
        sizegrowth         = 10,
        speed              = [[0, 1 0, 0]],
        texture            = [[laserendred]],
      },
    },
  },

  
  
}

