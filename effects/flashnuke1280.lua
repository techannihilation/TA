-- flashnuke1280

return {
  ["flashnuke1280"] = {
    usedefaultexplosions = true,
  --[[ 
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
	--]]
     spikes = {
      air                = true,
      class              = [[explspike]],
      count              = 15,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 1,
        alphadecay         = 0.05,
        alwaysvisible      = true,
        color              = [[1, 0.7, 0.72]],
        dir                = [[-45 r90,-45 r90,-45 r90]],
        length             = 60,
        width              = 30,
      },
    },
       waterball2 = {
      air                = false,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0.1 0.1 0.1 1  0.1 0.1 0.1 0.8	0.1 0.1 0.1 0.8 0 0 0 0.01]],
        directional        = true,
        emitdir            = [[0, 0.5, 0]],
        emitrot            = 90,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 260,
        particlelife       = 4,
        particlelifespread = 70,
        particlesize       = [[8 r12]],
        particlesizespread = 0,
        particlespeed      = [[12.7 r1]],
        particlespeedspread = 0,
        pos                = [[0 r-10 r10, 5 r20, 0 r-10 r10]],
        sizegrowth         = [[0.50 r-1.6]],
        sizemod            = 1.0,
        texture            = [[clouds2]],
        useairlos          = true,
      },
    },
   windsphere = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.11,
        color              = [[1, 0.71, 0.71]],
        expansionspeed     = [[15.7 r1]],
        ttl                = 40,
      },
    },
       windsphere1 = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.78,
        color              = [[1.0, 1.0, 1.0]],
        expansionspeed     = [[12.0 r1]],
        ttl                = 25,
      },
    },
  },

}

