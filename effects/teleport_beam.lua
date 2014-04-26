-- teleport_beam

return {
  ["teleport_beam"] = {
    usedefaultexplosions = true,
     SpikeSpawner = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 0, --10
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i5]],
        explosiongenerator = [[custom:teleport_spikes]],
        pos                = [[0, 0, 0]],
      },
    },
     GlowSpawner = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 10,
      ground             = true,
      water              = false,
      properties = {
        delay              = [[0 i5]],
        explosiongenerator = [[custom:Glow2]],
        pos                = [[0, 0, 0]],
      },
    },
  },
    ["Glow2"] = {
       glow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0.55 0.6 0.9 0.008    0.55 0.7 1 0.008              0 0 0 0.01]],
        directional        = true,
        emitrot            = 0,
        emitrotspread      = 0,
        emitvector         = [[0, 0, 0]],
        gravity            = [[0, 0.00, 0]],
        numparticles       = 1,
        particlelife       = 10,
        particlelifespread = 0,
        particlesize       = 50,
        particlesizespread = 10,
        particlespeed      = 1,
        particlespeedspread = 0,
        pos                = [[0, 2, 0]],
        sizegrowth         = 35.0,
        sizemod            = 1.0,
        texture            = [[flare1]],
      },
    },
    },
     ["teleport_spikes"] = {
    spikesofhell = {
      air                = true,
      class              = [[explspike]],
      count              = 2, 
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.9,
        alphadecay         = 0.05,
        color              = [[0.2, 0.2, 0.9]],
        dir                = [[-25 r50,-25 r50,-25 r50]],
        length             = 150,
        width              = 100,
      },
    },
      spikesofhell1 = {
      air                = true,
      class              = [[explspike]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.9,
        alphadecay         = 0.05,
        color              = [[0.5, 0.5, 0.9]],
        dir                = [[-25 r50,-25 r50,-25 r50]],
        length             = 150,
        width              = 20,
      },
    },
},
}

