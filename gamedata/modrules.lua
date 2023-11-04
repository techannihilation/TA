--------------------------- TechA Config ---------------------------
local flankDefaultMin = Spring.GetModOptions().mo_flankdefaultmin or 1
local flankDefaultMax = Spring.GetModOptions().mo_flankdefaultmax or 2

local modrules = {
  construction = {
    constructionDecay = true, -- defaults to true (do uncompleted building frames begin to decay if no builder is working on them?)
    constructionDecayTime = 9, -- defaults to 6.66 (the time in seconds before abandoned building frames begin to decay.)
    constructionDecaySpeed = 0.03, -- defaults to 0.03 (how fast build progress decays for abandoned building frames.)
  },

  damage = {
    debris = 0, -- controls damage done by exploding pieces
  },

  experience = {
    experienceMult = 1.0, -- defaults to 1.0
    powerScale = 0.0, -- defaults to 1.0
    healthScale = 0.0, -- defaults to 0.7
    reloadScale = 0.0, -- defaults to 0.4
  },

  featureLOS = {
    featureVisibility = 2,
  },

  fireAtDead = {
    fireAtKilled = false,
    fireAtCrashing = false,
  },

  movement = {
    allowAirPlanesToLeaveMap = true,
    allowCrushingAlliedUnits = false,
    allowGroundUnitGravity = false,
    allowPushingEnemyUnits = true, -- defaults to false
    allowUnitCollisionDamage = false,
    allowUnitCollisionOverlap = false, -- defaults to true
    maxCollisionPushMultiplier = 0.8,
  },

  nanospray = {
    allow_team_colors = false,
  },

  reclaim = {
    multiReclaim = 1,
    reclaimMethod = 0,
  },

  flankingBonus = {
    defaultMode = 1, -- default to 1
    defaultMin = flankDefaultMin,
    defaultMax = flankDefaultMax,
  },

  sensors = {
    los = {
      losMipLevel = 3,
      airMipLevel = 4,
      radarMipLevel = 3,
    },
  },

  system = {
    pathFinderSystem = 0, -- always default pathfinder
    pathFinderRawDistMult = 100000, -- default: 1.25.  Engine does raw move with a limited distance, this multiplier adjusts that
    pathFinderUpdateRate = 0.0000001, -- default: 0.007.  Controls how often the pathfinder updates; larger values means more rapid updates.
    --pathFinderUpdateRateScale = 1.0,
    allowTake = true,       -- Enables and disables the /take UI command.
    LuaAllocLimit = 2560, -- default: 1536.  Global Lua alloc limit (in megabytes)
  },

  transportability = {
    transportHover = 1,
  },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
return modrules
