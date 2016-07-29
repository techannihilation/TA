 --------------------------- TechA Config ---------------------------
local modrules  = {

  movement = {
    allowAirPlanesToLeaveMap = true;  -- defaults to true
    allowPushingEnemyUnits   = true; -- defaults to false
    allowCrushingAlliedUnits = false; -- defaults to false
    allowUnitCollisionDamage = false; -- defaults to false
    allowUnitCollisionOverlap = false,	-- defaults to true
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
      losMipLevel = 3 + tonumber((Spring.GetModOptions() and (Spring.GetModOptions().miplevel == "1") and 1) or 0),
      airMipLevel = 4 + tonumber((Spring.GetModOptions() and (Spring.GetModOptions().miplevel == "1") and 1) or 0),
      radarMipLevel = 3 + tonumber((Spring.GetModOptions() and (Spring.GetModOptions().miplevel == "1") and 1) or 0),
     },
  },

  fireAtDead = {
    fireAtKilled   = false,
    fireAtCrashing = false,
  },

  nanospray = {
    allow_team_colors = false, --- broken/removed as of 89 thanks kloot
  },
  
  featureLOS = {
     featureVisibility = 2,
  },
    
  transportability = {
     transportHover  = 1,
     --targetableTransportedUnits = true,
  },
  
  system = {
    luaThreadingModel = 2, --To be removed as of 95
    pathFinderSystem = (Spring.GetModOptions() and (Spring.GetModOptions().qtpfs == "qtpfs") and 1) or 0,
  },
 }


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules