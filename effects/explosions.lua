-- empflash240
-- flashmediumbuildingex
-- flash1green
-- flashkrogtaar
-- zeus_flash
-- burn
-- lightning_flash
-- purpleimpact1
-- flashnuke280
-- pilot
-- red_explosion
-- flashsmallbuilding
-- flashbigbuilding
-- flash64
-- kargmissile_explosion
-- vehhvyrocket_explosion
-- flash3
-- starfire
-- medmissile_explosion
-- blue_explosion
-- flashsmallbuildingex
-- flash1
-- flash4
-- flashbigunitex
-- flash72
-- krogtaarblaster
-- flash1nd
-- flash96
-- burnteal
-- flash1red
-- flashnuke1280
-- flashmediumunit
-- purpleimpact2
-- flash1yellow
-- flash1yellow2
-- flash3blue
-- vsmlmissile_explosion
-- vehrocket_explosion
-- flash1blue
-- burnpurple
-- greenlaser
-- flashnuke360
-- flash2
-- flashjuno
-- lightarms
-- aft
-- explodeblue
-- flash224
-- empflash640
-- flash2nd
-- flashmediumbuilding
-- flashnuke240
-- empflash360
-- missile_explosion
-- bigbomb_explosion
-- bigmissile_explosion
-- flashsmallunit
-- artillery_explosion
-- purple_explosion
-- empflash400
-- flashmediumunitex
-- krogcrushe
-- flashbigbuildingex
-- bulletimpact
-- flashbigunit
-- flashnuke480
-- flash144
-- flashnuke1920
-- flashnuke768
-- emplauncher
-- flashnuke960
-- empflash20
-- minesweep
-- empflash192
-- flashantimine
-- flashnuke320
-- flashsmallunitex

return {
  ["empflash240"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1.4,
      circlegrowth       = 7,
      flashalpha         = 0.9,
      flashsize          = 240,
      ttl                = 10,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["flashmediumbuildingex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2.1,
      circlegrowth       = 10,
      flashalpha         = 2.25,
      flashsize          = 134,
      ttl                = 10,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flash1green"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.1,
      flashsize          = 11,
      ttl                = 3,
      color = {
        [1]  = 0.69999998807907,
        [2]  = 1,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flashkrogtaar"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 0.9,
      circlegrowth       = 2.5,
      flashalpha         = 1,
      flashsize          = 26,
      ttl                = 8,
      color = {
        [1]  = 0.69999998807907,
        [2]  = 0.60000002384186,
        [3]  = 0,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 11,
        heatfalloff        = 1.3,
        maxheat            = 15,
        pos                = [[r-2 r2, 1, r-2 r2]],
        size               = 8,
        sizegrowth         = 3,
        speed              = [[0, 1 0, 0]],
        texture            = [[fireball]],
      },
    },
  },

  ["zeus_flash"] = {
    usedefaultexplosions = false,
    groundflash = {
      flashalpha         = 1.2,
      flashsize          = 28,
      ttl                = 16,
      color = {
        [1]  = 0.55000001192093,
        [2]  = 0.69999998807907,
        [3]  = 0.89999997615814,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 11,
        heatfalloff        = 1.3,
        maxheat            = 15,
        pos                = [[0, 2, 0]],
        size               = 2,
        sizegrowth         = 3,
        speed              = [[0, 1 0, 0]],
        texture            = [[brightblueexplo]],
      },
    },
  },

  ["burn"] = {
    gfx = {
      count              = 25,
      water              = true,
      properties = {
        color              = 200,
        creationtime       = 2,
        lifetime           = 10,
        pos                = [[-5 r5, 0 r10, -5 r5]],
        speed              = [[0.5 r-0.5, 0.7 r5.6, 0.5 r-0.5]],
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1,
      flashsize          = 10,
      ttl                = 8,
      color = {
        [1]  = 0.5,
        [2]  = 0.10000000149012,
        [3]  = 0,
      },
    },
    heatcloud = {
      air                = true,
      count              = 6,
      ground             = true,
      properties = {
        heat               = 6,
        heatfalloff        = 2,
        maxheat            = 10,
        pos                = [[-10 r10, r20,-10 r10]],
        size               = 10,
        sizegrowth         = 0.2,
        speed              = [[-1 r2, r2, -1 r2]],
      },
    },
  },
  ["purpleimpact1"] = {
    dirt = {
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alphafalloff       = 2,
        color              = [[1, 0.2, 1]],
        pos                = [[-10 r20, 20, -10 r20]],
        size               = 10,
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
    gfx = {
      count              = 25,
      water              = true,
      properties = {
        color              = 200,
        creationtime       = 2,
        lifetime           = 10,
        pos                = [[-8 r8, 0 r15, -8 r8]],
        speed              = [[0.5 r-0.5, 0.7 r1.6, 0.5 r-0.5]],
      },
    },
    groundflash = {
      circlealpha        = 0.4,
      circlegrowth       = 10,
      flashalpha         = 5,
      flashsize          = 50,
      ttl                = 10,
      color = {
        [1]  = 0.80000001192093,
        [2]  = 0,
        [3]  = 0.80000001192093,
      },
    },
    heatcloud = {
      air                = false,
      count              = 6,
      ground             = true,
      underwater         = 0,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 1,
        maxheat            = 10,
        pos                = [[0, 20, 0]],
        size               = 20,
        sizegrowth         = 0.2,
      },
    },
  },

  ["flashnuke280"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 1.8,
      flashsize          = 322,
      ttl                = 15,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["pilot"] = {
    heatcloud = {
      air                = true,
      class              = [[heatcloud]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        heat               = 22,
        heatfalloff        = 2,
        maxheat            = 30,
        pos                = [[0, -1.5, 0]],
        size               = 5,
        sizegrowth         = -0.04,
        speed              = [[0 r1, 1.5 r1, 0 r1]],
        useairlos          = false,
        texture            = [[fireball]],
      },
    },
   heatcloud1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        heat               = 22,
        heatfalloff        = 3,
        maxheat            = 30,
        pos                = [[0, -1.5, 0]],
        size               = 4,
        sizegrowth         = -0.04,
        speed              = [[0 r1, 1.5 r1, 0 r1]],
        useairlos          = false,
        texture            = [[fire1]],
      },
    },
    smoke2 = {
      air                = true,
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.03,
        glowfalloff        = 10,
        pos                = [[0, 0, 0]],
        size               = 6,
        speed              = [[0 r1, 1.5 r1, 0 r1]],
        useairlos          = false,
      },
    },
  },

  ["red_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.4,
      circlegrowth       = 8,
      flashalpha         = 0.9,
      flashsize          = 70,
      ground             = true,
      ttl                = 20,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0,
      },
    },
    pop = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[0, 0 0, 0]],
        size               = [[35 r-1.5]],
        sizegrowth         = 0.75,
        speed              = [[1 r0.35, 0 0, 1 r0.35]],
        texture            = [[redexplo]],
      },
    },
    smoke = {
      air                = true,
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[0, -1, 0]],
        size               = 30,
        sizeexpansion      = -0.6,
        sizegrowth         = 15,
        speed              = [[0, 1 r1.3, 0]],
        startsize          = 10,
      },
    },
    smoke00 = {
      air                = true,
      class              = [[smoke]],
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[1 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r-3]],
      },
    },
    smoke01 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r3]],
      },
    },
    smoke02 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r-3]],
      },
    },
    smoke04 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r3]],
      },
    },
  },

  ["flashsmallbuilding"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2.8,
      circlegrowth       = 12,
      flashalpha         = 2.7,
      flashsize          = 160,
      ttl                = 12,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flashbigbuilding"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 2.9,
      flashsize          = 192,
      ttl                = 14,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flash64"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 4,
      flashalpha         = 1.9,
      flashsize          = 64,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["kargmissile_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 1,
      flashalpha         = 0.9,
      flashsize          = 40,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0.20000000298023,
      },
    },
  },

  ["vehhvyrocket_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 2,
      flashalpha         = 0.9,
      flashsize          = 30,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 0.98400002717972,
        [2]  = 0.68699997663498,
        [3]  = 0.33500000834465,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 15,
        heatfalloff        = 0.4,
        maxheat            = 20,
        pos                = [[r-2 r2, 6, r-2 r2]],
        size               = 20,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[spikeexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[5 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[flowexplo]],
      },
    },
    smoke = {
      air                = true,
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, 7, r-3 r3]],
        size               = 4,
        sizeexpansion      = 0.6,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 1,
      },
    },
  },

  ["flash3"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1.6,
      flashsize          = 40,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["starfire"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 1,
      flashalpha         = 0.9,
      flashsize          = 40,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0.20000000298023,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 20,
        heatfalloff        = 0.6,
        maxheat            = 25,
        pos                = [[r-2 r2, 8, r-2 r2]],
        size               = 15,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[starexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[5 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[explo]],
      },
    },
    smoke = {
      air                = true,
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 4,
        sizeexpansion      = 0.6,
        sizegrowth         = 1,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 1,
      },
    },
  },

  ["medmissile_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 4,
      flashalpha         = 0.9,
      flashsize          = 70,
      ground             = true,
      ttl                = 17,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 20,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[sakexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[15 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[explo]],
      },
    },
    smoke = {
      air                = true,
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 10,
        sizeexpansion      = 0.6,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 2,
      },
    },
  },
  
   ["BT_BOMB_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 8,
      flashalpha         = 0.7,
      flashsize          = 140,
      ground             = true,
      ttl                = 17,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.4,
        [3]  = 0,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.7,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 80,
        sizegrowth         = 1.5,
        speed              = [[0, 1 0, 0]],
        texture            = [[starexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.8,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[60 r-1.5]],
        sizegrowth         =1.5,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[mildexplo]],
      },
    },
      smoke = {
      air                = true,
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.1,
        color              = 0.2,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 80,
        sizeexpansion      = 0.6,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 10,
      },
    },
  },
  
  
  
  

  ["blue_explosion"] = {
    generatorpop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 18,
        heatfalloff        = 0.8,
        maxheat            = 18,
        pos                = [[0, 0 0, 0]],
        size               = 60,
        sizegrowth         = -0.2,
        speed              = [[r0.35 r-0.35, 0 0, r0.35 r-0.35]],
        texture            = [[brightblueexplo]],
      },
    },
    generatorpop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.7,
        maxheat            = 15,
        pos                = [[0, 0 0, 0]],
        size               = 50,
        sizegrowth         = -0.2,
        speed              = [[1 r0.35, 0 0, 1 r0.35]],
        texture            = [[blueexplo]],
      },
    },
    groundflash = {
      air                = true,
      circlealpha        = 0.4,
      circlegrowth       = 5,
      flashalpha         = 0.9,
      flashsize          = 110,
      ground             = true,
      ttl                = 20,
      water              = true,
      color = {
        [1]  = 0.10000000149012,
        [2]  = 0.10000000149012,
        [3]  = 1,
      },
    },
    smoke = {
      air                = true,
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[0, -1, 0]],
        size               = 30,
        sizeexpansion      = -0.6,
        sizegrowth         = 15,
        speed              = [[0, 1 r1.3, 0]],
        startsize          = 10,
      },
    },
    smoke00 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r-3]],
      },
    },
    smoke01 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r3]],
      },
    },
    smoke02 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r-3]],
      },
    },
    smoke04 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r3]],
      },
    },
  },

  ["flashsmallbuildingex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2,
      circlegrowth       = 9,
      flashalpha         = 2.2,
      flashsize          = 128,
      ttl                = 9,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flash1"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = true,
    water              = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.1,
      flashsize          = 10,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flash4"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 4,
      flashalpha         = 1.9,
      flashsize          = 55,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flashbigunitex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 6,
      flashalpha         = 2.15,
      flashsize          = 68,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flash72"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 4,
      flashalpha         = 1.9,
      flashsize          = 72,
      ttl                = 6,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flash1nd"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.1,
      flashsize          = 10,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flash96"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 5,
      flashalpha         = 1.9,
      flashsize          = 96,
      ttl                = 7,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },
  
    ["flash96red"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 5,
      flashalpha         = 1.9,
      flashsize          = 96,
      ttl                = 7,
      color = {
        [1]  = 1,
        [2]  = 0.1,
        [3]  = 0.1,
      },
    },
  },

  ["burnteal"] = {
    dirt = {
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alphafalloff       = 3,
        color              = [[0.2, 1.0, 1.0]],
        pos                = [[-10 r20, 0, -10 r20]],
        size               = 15,
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
    gfx = {
      count              = 25,
      water              = true,
      properties = {
        color              = 200,
        creationtime       = 2,
        lifetime           = 10,
        pos                = [[-8 r8, 0 r15, -8 r8]],
        speed              = [[0.5 r-0.5, 0.7 r1.6, 0.5 r-0.5]],
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1,
      flashsize          = 25,
      ttl                = 8,
      color = {
        [1]  = 0,
        [2]  = 0.5,
        [3]  = 0.5,
      },
    },
  },

  ["flash1red"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 0.9,
      flashsize          = 9,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 0.80000001192093,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flashnuke1280"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 4,
      circlegrowth       = 25,
      flashalpha         = 2.4,
      flashsize          = 1472,
      ttl                = 35,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flashmediumunit"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 7,
      flashalpha         = 2.575,
      flashsize          = 76,
      ttl                = 7,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["purpleimpact2"] = {
    groundflash = {
      circlealpha        = 0.4,
      circlegrowth       = 10,
      flashalpha         = 5,
      flashsize          = 30,
      ttl                = 10,
      color = {
        [1]  = 0.80000001192093,
        [2]  = 0,
        [3]  = 0.80000001192093,
      },
    },
    heatcloud = {
      air                = false,
      count              = 6,
      ground             = true,
      underwater         = 0,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 2,
        maxheat            = 10,
        pos                = [[-10 r20, r20,-10 r20]],
        size               = 20,
        sizegrowth         = 0.2,
        texture            = [[pinkexplo]],
      },
    },
  },

  ["flash1yellow"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.3,
      flashsize          = 7,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flash1yellow2"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.3,
      flashsize          = 7,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 0.60000002384186,
      },
    },
  },

  ["flash3blue"] = {
    usedefaultexplosions = false,
    bluelightwater= {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        colormap           = [[0 0 1 1     0.14 0.14 1 1     0 0 0 0.1]],
        size               = [[22 r2]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[10 r4 r-4]],
      },
    },
     groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.3,
      flashsize          = 7,
      ttl                = 3,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 0.60000002384186,
      },
    },
   glow = {
      air                = true,
      count              = 1,
      class              = [[heatcloud]],
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.70,
        maxheat            = 20,
        pos                = [[0, 0.0, 0]],
        size               = [[8.0 r1]],
        sizegrowth         = [[0.09 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[bluenovaexplo]],
        useairlos          = false,
      },
    },
   Spawner_laser_drip = {
      air                = false,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = false,
      water              = false,
      unit               = true,
      properties = {
        delay              = [[2 i2]],
        explosiongenerator = [[custom:thermite_drip_laser]],
        pos                = [[-5 r5,-2 r2,-5 r5]],
      },
    },
     SteamSpawn = {
      air                = false,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = false,
      water              = true,
      properties = {
        delay              = [[0]],
        explosiongenerator = [[custom:lasersteam]],
        pos                = [[0, 0, 0]],
      },
    },
  },

    ["flash4blue"] = {
    usedefaultexplosions = false,
    bluelightwater= {
      air                = false,
      class              = [[CSimpleGroundFlash]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        colormap           = [[0 0 1 1     0.14 0.14 1 1     0 0 0 0.1]],
        size               = [[28 r2]],
        sizegrowth         = [[2 r-3]],
        texture            = [[groundflash]],
        ttl                = [[10 r4 r-4]],
      },
    },
   glow = {
      air                = true,
      count              = 1,
      class              = [[heatcloud]],
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.70,
        maxheat            = 20,
        pos                = [[0, 0.0, 0]],
        size               = [[12.0 r2]],
        sizegrowth         = [[0.09 r.16]],
        sizemod            = 0,
        sizemodmod         = 0,
        speed              = [[0.05 r-0.1, 0.05 r-0.1, 0.05 r-0.1]],
        texture            = [[bluenovaexplo]],
        useairlos          = false,
      },
    },
   Spawner1 = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 4,
      ground             = true,
      water              = true,
      unit               = 0,
      properties = {
        delay              = [[2 i2]],
        explosiongenerator = [[custom:thermite_drip_laser]],
        pos                = [[-5 r5,-2 r2,-5 r5]],
      },
    },
     SteamSpawn = {
      air                = false,
      class              = [[CExpGenSpawner]],
      count              = 2,
      ground             = false,
      water              = true,
      properties = {
        delay              = [[0]],
        explosiongenerator = [[custom:lasersteam]],
        pos                = [[0, 0, 0]],
      },
    },
  },

  
  ["vsmlmissile_explosion"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 0.9,
      circlegrowth       = 2.5,
      flashalpha         = 1,
      flashsize          = 12,
      ttl                = 8,
      color = {
        [1]  = 0.80000001192093,
        [2]  = 0.20000000298023,
        [3]  = 0,
      },
    },
  },

  ["vehrocket_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 0.5,
      flashalpha         = 0.9,
      flashsize          = 15,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 0.98400002717972,
        [2]  = 0.68699997663498,
        [3]  = 0.33500000834465,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 15,
        heatfalloff        = 0.8,
        maxheat            = 20,
        pos                = [[r-2 r2, 6, r-2 r2]],
        size               = 10,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[spikeexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 12,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = 12,
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[flowexplo]],
      },
    },
    smoke = {
      air                = true,
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, 7, r-3 r3]],
        size               = 4,
        sizeexpansion      = 0.6,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 1,
      },
    },
  },

  ["flash1blue"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.3,
      flashsize          = 7,
      ttl                = 3,
      color = {
        [1]  = 0.69999998807907,
        [2]  = 0.69999998807907,
        [3]  = 1,
      },
    },
  },

  ["burnpurple"] = {
    dirt = {
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        alphafalloff       = 3,
        color              = [[0.8, 0.1, 0.8]],
        pos                = [[-10 r20, 0, -10 r20]],
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
    gfx = {
      count              = 25,
      water              = true,
      properties = {
        color              = 200,
        creationtime       = 2,
        lifetime           = 10,
        pos                = [[-8 r8, 0 r15, -8 r8]],
        speed              = [[0.5 r-0.5, 0.7 r1.6, 0.5 r-0.5]],
      },
    },
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1,
      flashsize          = 10,
      ttl                = 8,
      color = {
        [1]  = 0.5,
        [2]  = 0,
        [3]  = 0.5,
      },
    },
    heatcloud = {
      air                = true,
      count              = 6,
      ground             = true,
      properties = {
        heat               = 6,
        heatfalloff        = 2,
        maxheat            = 10,
        pos                = [[-10 r10, r10,-10 r10]],
        size               = 10,
        sizegrowth         = -0.2,
        speed              = [[-1 r2, r2, -1 r2]],
      },
    },
  },

  ["greenlaser"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 1,
      flashalpha         = 1.1,
      flashsize          = 11,
      ttl                = 30,
      color = {
        [1]  = 0.69999998807907,
        [2]  = 1,
        [3]  = 0.69999998807907,
      },
    },
    spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.2,
        alphadecay         = 0.08,
        color              = [[0, 1, 0]],
        dir                = [[-45 r90,-45 r90,-45 r90]],
        length             = 0.00001,
        width              = 10,
      },
    },
  },

  ["flashnuke360"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 11,
      flashalpha         = 2,
      flashsize          = 414,
      ttl                = 21,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flash2"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 2,
      flashalpha         = 1.3,
      flashsize          = 25,
      ttl                = 4,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flashjuno"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 0.5,
      circlegrowth       = 30,
      flashalpha         = 1.5,
      flashsize          = 500,
      ttl                = 60,
      color = {
        [1]  = 0.69999998807907,
        [2]  = 0.89999997615814,
        [3]  = 0.55000001192093,
      },
    },
  },

  ["lightarms"] = {
    groundflash = {
      circlealpha        = 0.35,
      circlegrowth       = 0.001,
      flashalpha         = 1.5,
      flashsize          = 12,
      ttl                = 14,
      color = {
        [1]  = 0.99599999189377,
        [2]  = 0.98000001907349,
        [3]  = 0.56599998474121,
      },
    },
  },

  ["aft"] = {
    heatcloud = {
      air                = true,
      count              = 1,
      ground             = false,
      water              = true,
      properties = {
        heat               = 75,
        heatfalloff        = 3,
        maxheat            = 100,
        pos                = [[0, 0, 0]],
        size               = 4,
        sizegrowth         = -0.25,
        speed              = [[0, 0, 0 r0.5]],
      },
    },
    smoke2 = {
      air                = true,
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        glowfalloff        = 10,
        pos                = [[0, 0, 0]],
        size               = 4,
        sizegrowth         = 2,
        speed              = [[-0.5 r1,-0.5 r1,-0.5 r1]],
      },
    },
  },

  ["explodeblue"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 3,
      flashalpha         = 1,
      flashsize          = 25,
      ttl                = 8,
      color = {
        [1]  = 0.20000000298023,
        [2]  = 0.20000000298023,
        [3]  = 0.5,
      },
    },
  },

  ["flash224"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 2.3,
      flashsize          = 200,
      ttl                = 14,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["empflash640"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 18,
      flashalpha         = 1.2,
      flashsize          = 680,
      ttl                = 35,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["flash2nd"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 2,
      flashalpha         = 1.3,
      flashsize          = 25,
      ttl                = 4,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flashmediumbuilding"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2.9,
      circlegrowth       = 13,
      flashalpha         = 2.8,
      flashsize          = 172,
      ttl                = 13,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flashnuke240"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 1.8,
      flashsize          = 260,
      ttl                = 15,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["empflash360"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1.6,
      circlegrowth       = 10,
      flashalpha         = 1,
      flashsize          = 360,
      ttl                = 10,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["missile_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 3,
      flashalpha         = 0.9,
      flashsize          = 40,
      ground             = true,
      ttl                = 15,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0.20000000298023,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 15,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[redexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[10 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[explo]],
      },
    },
    smoke = {
      air                = true,
      count              = 3,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 8,
        sizeexpansion      = 0.6,
        sizegrowth         = 2,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 2,
      },
    },
  },

  ["bigbomb_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 4,
      flashalpha         = 0.6,
      flashsize          = 35,
      ground             = true,
      ttl                = 14,
      water              = true,
      color = {
        [1]  = 0.60000002384186,
        [2]  = 0.5,
        [3]  = 0.46999999880791,
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-55 r55, 5, r-55 r55]],
        size               = [[15 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[flowexplo]],
      },
    },
  },

  ["bigmissile_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.5,
      circlegrowth       = 6,
      flashalpha         = 0.9,
      flashsize          = 70,
      ground             = true,
      ttl                = 17,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 25,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[sparkexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 4,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[20 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[explo]],
      },
    },
    smoke = {
      air                = true,
      count              = 7,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 15,
        sizeexpansion      = 0.6,
        sizegrowth         = 5,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 5,
      },
    },
  },

  ["flashsmallunit"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 7,
      flashalpha         = 2.5,
      flashsize          = 72,
      ttl                = 7,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["artillery_explosion"] = {
    groundflash = {
      air                = true,
      circlealpha        = 0.6,
      circlegrowth       = 8,
      flashalpha         = 0.9,
      flashsize          = 70,
      ground             = true,
      ttl                = 20,
      water              = true,
      color = {
        [1]  = 1,
        [2]  = 0.30000001192093,
        [3]  = 0,
      },
    },
    pop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.4,
        maxheat            = 15,
        pos                = [[r-2 r2, 3, r-2 r2]],
        size               = 55,
        sizegrowth         = 0.9,
        speed              = [[0, 1 0, 0]],
        texture            = [[redexplo]],
      },
    },
    pop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 5,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.5,
        maxheat            = 15,
        pos                = [[r-25 r25, 5, r-25 r25]],
        size               = [[45 r-1.5]],
        sizegrowth         = 0.9,
        speed              = [[r-1 r1, 1 0, r-1 r1]],
        texture            = [[explo]],
      },
    },
    smoke = {
      air                = true,
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[r-3 r3, r-3 r3, r-3 r3]],
        size               = 40,
        sizeexpansion      = 0.6,
        sizegrowth         = 15,
        speed              = [[0, 1 r2.3, 0]],
        startsize          = 10,
      },
    },
  },

  ["purple_explosion"] = {
    generatorpop1 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 18,
        heatfalloff        = 0.8,
        maxheat            = 18,
        pos                = [[0, 0 0, 0]],
        size               = 60,
        sizegrowth         = -0.2,
        speed              = [[r0.35 r-0.35, 0 0, r0.35 r-0.35]],
        texture            = [[purpleexplo]],
      },
    },
    generatorpop2 = {
      air                = true,
      class              = [[heatcloud]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        heat               = 10,
        heatfalloff        = 0.7,
        maxheat            = 15,
        pos                = [[0, 0 0, 0]],
        size               = 50,
        sizegrowth         = -0.2,
        speed              = [[1 r0.35, 0 0, 1 r0.35]],
        texture            = [[pinkexplo]],
      },
    },
    groundflash = {
      air                = true,
      circlealpha        = 0.4,
      circlegrowth       = 5,
      flashalpha         = 0.9,
      flashsize          = 110,
      ground             = true,
      ttl                = 20,
      water              = true,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.10000000149012,
        [3]  = 0.89999997615814,
      },
    },
    smoke = {
      air                = true,
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.04,
        color              = 0.1,
        pos                = [[0, -1, 0]],
        size               = 30,
        sizeexpansion      = -0.6,
        sizegrowth         = 15,
        speed              = [[0, 1 r1.3, 0]],
        startsize          = 10,
      },
    },
    smoke00 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r-3]],
      },
    },
    smoke01 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r3]],
      },
    },
    smoke02 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r3, 0, 0 r-3]],
      },
    },
    smoke04 = {
      air                = true,
      class              = [[smoke]],
      count              = 10,
      ground             = true,
      water              = true,
      properties = {
        agespeed           = 0.08,
        color              = [[0.3 r0.3]],
        pos                = [[0, 0 r4, 0]],
        size               = [[15 r5]],
        sizegrowth         = 1,
        speed              = [[0 r-3, 0, 0 r3]],
      },
    },
  },

  ["empflash400"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1.8,
      circlegrowth       = 11,
      flashalpha         = 1.1,
      flashsize          = 400,
      ttl                = 10,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["flashmediumunitex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 5,
      flashalpha         = 2.075,
      flashsize          = 64,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["krogcrushe"] = {
    usedefaultexplosions = false,
    groundflash = {
    },
  },

  ["flashbigbuildingex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2.2,
      circlegrowth       = 11,
      flashalpha         = 2.3,
      flashsize          = 144,
      ttl                = 11,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["bulletimpact"] = {
    dirt = {
      count              = 5,
      ground             = true,
      properties = {
        alphafalloff       = 2,
        color              = [[0.2, 0.1, 0.05]],
        pos                = [[-10 r20, 0, -10 r20]],
        size               = 10,
        speed              = [[0.75 r-1.5, 1.7 r1.6, 0.75 r-1.5]],
      },
    },
    gfx = {
      count              = 25,
      water              = true,
      properties = {
        color              = 200,
        creationtime       = 2,
        lifetime           = 10,
        pos                = [[-5 r20, 0 r10, -5 r20]],
        speed              = [[0.5 r-1.5, 0.7 r5.6, 0.5 r-1.5]],
      },
    },
  },

  ["flashbigunit"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 8,
      flashalpha         = 2.65,
      flashsize          = 80,
      ttl                = 8,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

  ["flashnuke480"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 14,
      flashalpha         = 2.1,
      flashsize          = 552,
      ttl                = 24,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flash144"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 7,
      flashalpha         = 2,
      flashsize          = 144,
      ttl                = 7,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.85000002384186,
      },
    },
  },

  ["flashnuke1920"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 4,
      circlegrowth       = 25,
      flashalpha         = 2.5,
      flashsize          = 2208,
      ttl                = 40,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flashnuke768"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 17,
      flashalpha         = 2.2,
      flashsize          = 883,
      ttl                = 27,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["emplauncher"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 7,
      flashalpha         = 1.2,
      flashsize          = 256,
      ttl                = 35,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["flashnuke960"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 20,
      flashalpha         = 2.3,
      flashsize          = 1104,
      ttl                = 30,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["empflash20"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1.2,
      circlegrowth       = 4,
      flashalpha         = 0.7,
      flashsize          = 6,
      ttl                = 7,
      color = {
        [1]  = 0.89999997615814,
        [2]  = 0.89999997615814,
        [3]  = 0,
      },
    },
  },

  ["minesweep"] = {
    usedefaultexplosions = false,
    groundflash = {
      circlealpha        = 0.1,
      circlegrowth       = 20,
      flashalpha         = 0.4,
      flashsize          = 300,
      ttl                = 20,
      color = {
        [1]  = 0.20000000298023,
        [2]  = 0.89999997615814,
        [3]  = 0.20000000298023,
      },
    },
  },

  ["empflash192"] = {
    air                = true,
    ground             = true,
    usedefaultexplosions = false,
    water              = true,
    groundflash = {
      circlealpha        = 1.4,
      circlegrowth       = 6,
      flashalpha         = 0.8,
      flashsize          = 192,
      ttl                = 10,
      color = {
        [1]  = 0.80000001192093,
        [2]  = 0.89999997615814,
        [3]  = 0.25,
      },
    },
  },

  ["flashantimine"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 2,
      circlegrowth       = 16,
      flashalpha         = 1,
      flashsize          = 720,
      ttl                = 26,
      color = {
        [1]  = 1,
        [2]  = 1,
        [3]  = 1,
      },
    },
  },

  ["flashnuke320"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 3,
      circlegrowth       = 16,
      flashalpha         = 1.9,
      flashsize          = 368,
      ttl                = 18,
      color = {
        [1]  = 1,
        [2]  = 0.69999998807907,
        [3]  = 0.69999998807907,
      },
    },
  },

  ["flashsmallunitex"] = {
    usedefaultexplosions = true,
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 5,
      flashalpha         = 2,
      flashsize          = 60,
      ttl                = 5,
      color = {
        [1]  = 1,
        [2]  = 0.89999997615814,
        [3]  = 0.80000001192093,
      },
    },
  },

}


