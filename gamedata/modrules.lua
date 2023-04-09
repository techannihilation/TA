--------------------------- TechA Config ---------------------------
local modrules = {
  experience = {
    powerScale = 0.2; -- defaults to 1.0
    healthScale = 0.9; -- defaults to 0.7
    reloadScale = 0.1; -- defaults to 0.4
  },

  featureLOS = {
    featureVisibility = 2,
  },

  nanospray = {
    allow_team_colors = false,
  },

  reclaim = {
    multiReclaim = 1,
    reclaimMethod = 0,
  },

  system = {
    LuaAllocLimit = 4096, -- value in megabytes
    pathFinderSystem = 0, -- always default pathfinder
    pathFinderRawDistMult = 100,
    pathFinderUpdateRate = 0.0000001,
    --pathFinderUpdateRateScale = 1.0,
  },

  construction = {
    constructionDecay = Spring.GetModOptions().mo_nanoframedecay or 1
  },

  fireAtDead = {
    fireAtKilled = false,
    fireAtCrashing = false,
  },

  movement = {
    allowAirPlanesToLeaveMap = true,
    allowPushingEnemyUnits = true, -- defaults to false
    allowCrushingAlliedUnits = false,
    allowUnitCollisionDamage = false,
    allowUnitCollisionOverlap = false, -- defaults to true
    allowGroundUnitGravity = false,
  },

  sensors = {
    los = {
      losMipLevel = 3,
      airMipLevel = 4,
      radarMipLevel = 3,
    },
  },

  transportability = {
    transportHover = 1,
  },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
return modrules