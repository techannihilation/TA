-- reactorsequence
-- r3
-- r2
-- reactorbigsequence
-- r300
-- r200
-- r1
-- reactortinysequence
-- r30
-- r10
-- r20
-- r100

return {
  ["reactorsequence"] = {
    electricalorb = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 r1]],
        explosiongenerator = [[custom:R1]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb2 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[40 r1]],
        explosiongenerator = [[custom:R3]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb3 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[20 r1]],
        explosiongenerator = [[custom:R2]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["r3"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r8]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R1]],
        useairlos          = false,
      },
    },
  },

  ["r2"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r8]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R1]],
        useairlos          = false,
      },
    },
  },

  ["reactorbigsequence"] = {
    electricalorb = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 r1]],
        explosiongenerator = [[custom:R10]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb2 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[40 r1]],
        explosiongenerator = [[custom:R30]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb3 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[20 r1]],
        explosiongenerator = [[custom:R20]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["r300"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[6.0 r2]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R3]],
        useairlos          = false,
      },
    },
  },

  ["r200"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[6.0 r2]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R2]],
        useairlos          = false,
      },
    },
  },

  ["r1"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r8]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R1]],
        useairlos          = false,
      },
    },
  },

  ["reactortinysequence"] = {
    electricalorb = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[0 r1]],
        explosiongenerator = [[custom:R100]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb2 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[40 r1]],
        explosiongenerator = [[custom:R300]],
        pos                = [[0, 0, 0]],
      },
    },
    electricalorb3 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[20 r1]],
        explosiongenerator = [[custom:R200]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  ["r30"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[24.0 r16]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R3]],
        useairlos          = false,
      },
    },
  },

  ["r10"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[24.0 r16]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R1]],
        useairlos          = false,
      },
    },
  },

  ["r20"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[24.0 r16]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R2]],
        useairlos          = false,
      },
    },
  },

  ["r100"] = {
    usedefaultexplosions = false,
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = true,
      useairlos          = false,
      water              = false,
      properties = {
        heat               = 25,
        heatfalloff        = 3,
        maxheat            = 25,
        pos                = [[0, 0.0, 0]],
        size               = [[6.0 r2]],
        sizegrowth         = [[0.08 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[R1]],
        useairlos          = false,
      },
    },
  },

}

