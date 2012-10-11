-- small_unit_flare1

return {
  ["small_unit_flare1"] = {
    usedefaultexplosions = true,
   
    largeflash = {
      air                = true,
      class              = [[CBitmapMuzzleFlame]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      properties = {
        colormap           = [[1.0 0.5 0.2 0.01 0.2 0.2 0.2 0.01 0 0 0 0.01]],
        dir                = [[dir]],
        frontoffset        = 0,
        fronttexture       = [[muzzlefront]],
        length             = 12,
        sidetexture        = [[muzzleside]],
        size               = 6,
        sizegrowth         = -0.575,
        ttl                = 20,
      },
    },
    muzzle_puff_ring_1 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.85,
        colormap           = [[1 1 1 1  1 1 1 1 0 0 0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 8,
        emitvector         = [[dir]],
        gravity            = [[0, 0, 0]],
        numparticles       = 18,
        particlelife       = 8,
        particlelifespread = 2,
        particlesize       = 2,
        particlesizespread = 1.2,
        particlespeed      = 0.90,
        particlespeedspread = 1.80,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0.06,
        sizemod            = 1.0,
        texture            = [[smoke]],
      },
    },
    windsphere = {
      air                = true,
      class              = [[CSpherePartSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        alpha              = 0.08,
        color              = [[1.0, 1.0, 1.0]],
        expansionspeed     = [[0.6 r1]],
        ttl                = 12,
      },
    },
  },

}

