 --------------------------- TechA Config --------------------------- 

local modrules  = {

  movement = {
    allowAirPlanesToLeaveMap = true;  -- defaults to true
    allowPushingEnemyUnits   = true; -- defaults to false
    allowCrushingAlliedUnits = false; -- defaults to false
    allowUnitCollisionDamage = false; -- defaults to false
    allowUnitCollisionOverlap = false,	-- defaults to true
  },
  
  reclaim = {
    multiReclaim  = 1,
    reclaimMethod = 0,
  },


  sensors = {   
    los = {
      losMipLevel = 3, 
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
    allow_team_colors = false, --- broken/removed as of 89 thanks kloot
  },
  
  featureLOS = {
     featureVisibility = 2,
	 },
    
  system = {
    luaThreadingModel = 3, --Dont go 4 or above unit morph need some loving first
    pathFinderSystem = (Spring.GetModOptions() and (Spring.GetModOptions().qtpfs == "1") and 1) or 0,
  },
 }


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules