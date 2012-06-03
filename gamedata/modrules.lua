 --------------------------- TechA Config --------------------------- 

local modrules  = {

  movement = {
    allowAirPlanesToLeaveMap = true;  -- defaults to true
    allowPushingEnemyUnits   = true; -- defaults to false
    allowCrushingAlliedUnits = false; -- defaults to false
    allowUnitCollisionDamage = false; -- defaults to false
  },
  
  reclaim = {
    multiReclaim  = 1,
    reclaimMethod = 0,
  },


  sensors = {   
    los = {
      losMipLevel = 2, 
      losMul      = 1,
      airMipLevel = 4,
      airMul      = 1,
    },
  },

  fireAtDead = {
    fireAtKilled   = false,
    fireAtCrashing = false,
  },

  nanospray = {
    allow_team_colors = false, --- broken as of 89
  },
  
  featureLOS = {
     featureVisibility = 2,
	 },
    
  system = {
    pathFinderSystem = (Spring.GetModOptions() and (Spring.GetModOptions().qtpfs == "1") and 1) or 0,
  },
 }


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules