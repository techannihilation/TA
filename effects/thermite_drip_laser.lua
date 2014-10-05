-- thermite_drip_laser

return {
 ["thermite_drip_laser"] = {
    spark = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = false,
      unit               = false,
      water              = false,
      properties = {
        airdrag            = 0.70,
        colormap           = [[1 0.5 0 .01   0.6 .24 0.05 .008  	0 0 0 0.01]],
        directional        = true,
        emitrot            = 180,
        emitrotspread      = [[0 r-360 r360]],
        emitvector         = [[0, 0.75, 0]],
        gravity            = [[0, -1.25 r0.15 r1, 0]],
        numparticles       = 2,
        particlelife       = 11,
        particlelifespread = 50,
        particlesize       = 1,
        particlesizespread = 2,
        particlespeed      = 0.6,
        particlespeedspread = 3,
        pos                = [[-6 r6,0,-6 r6]],
        sizegrowth         = [[0.0 r.05]],
        sizemod            = 1.0,
        texture            = [[plasma]],
        useairlos          = true,
      },
    },
  },
}