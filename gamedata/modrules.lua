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

  experience = {
    powerScale = 0,
    healthScale = 0.25, 
    reloadScale= 0,
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
    fireAtCrashing = true,
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
    pathFinderSystem = 0, -- always default pathfinder
    pathFinderRawDistMult = 100,
    pathFinderUpdateRate =  0.0000001,
  },
 }


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules
