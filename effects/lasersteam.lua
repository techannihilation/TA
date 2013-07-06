-- LaserSteam

return {
  ["lasersteam"] = {
    SteamSpawnEffect = {
      air                = false,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = false,
      water              = true,
      properties = {
        delay              = [[0 i5]],
        explosiongenerator = [[custom:steamer]],
        pos                = [[0, 0, 0]],
      },
    },
  }, 
   
     ["steamer"] = {
      steamcloud = {
      air                = false,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      underwater         = 0,
      water              = true,
      properties = {
        airdrag            = 0.83,
        colormap           = [[0.05 0.05 0.05 0.01  0.05 0.05 0.05 0.01 0 0 0 0.01]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = [[0 r360 r-360]],
        emitvector         = [[0,1,0]],
        gravity            = [[0, 0.6, 0]],
        numparticles       = 3,
        particlelife       = 27,
        particlelifespread = 30,
        particlesize       = 2,
        particlesizespread = 25,
        particlespeed      = [[2 i0.25]],
        particlespeedspread = 4,
        pos                = [[0, 10, 0]],
        sizegrowth         = -0.35,
        sizemod            = 1.0,
        texture            = [[clouds2]],
        useairlos          = true,
      },
    },
},
}