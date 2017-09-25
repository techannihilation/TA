 --------------------------- TechA Config ---------------------------
local modrules  = {

  movement = {
    allowAirPlanesToLeaveMap = true,
    allowPushingEnemyUnits   = true, -- defaults to false
    allowCrushingAlliedUnits = false,
    allowUnitCollisionDamage = false,
    allowUnitCollisionOverlap = false,	-- defaults to true
    allowGroundUnitGravity = false,
  },

  construction = {
    constructionDecay = (Spring.GetModOptions() and (Spring.GetModOptions().mo_terraforming == "0") and 1)
    and (Spring.GetModOptions() and (Spring.GetModOptions().mo_nanoframedecay == "0") and 1) or 0,
      },
  
  reclaim = {
    multiReclaim  = 1,
    reclaimMethod = 0,
  },

  sensors = {   
    los = {
      losMipLevel = 3,
      airMipLevel = 4,
      radarMipLevel = 3,
     },
  },

  fireAtDead = {
    fireAtKilled   = false,
    fireAtCrashing = false,
  },

  nanospray = {
    allow_team_colors = false,
  },
  
  featureLOS = {
     featureVisibility = 2,
  },
    
  transportability = {
     transportHover  = 1,
     --targetableTransportedUnits = true,
  },
  
  system = {
    pathFinderSystem = (Spring.GetModOptions() and (Spring.GetModOptions().qtpfs == "qtpfs") and 1) or 0,
    pathFinderRawDistMult = 1.25,
    pathFinderUpdateRate = 0.007,
  },
 }


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules