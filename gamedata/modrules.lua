--------------------------- TechA Config ---------------------------
local modrules = {
  construction = {
    constructionDecay = true, -- defaults to true (do uncompleted building frames begin to decay if no builder is working on them?)
    constructionDecayTime = 9, -- defaults to 6.66 (the time in seconds before abandoned building frames begin to decay.)
    constructionDecaySpeed = 0.03, -- defaults to 0.03 (how fast build progress decays for abandoned building frames.)
  },

  damage = {
    debris = 150, -- controls damage done by exploding pieces
  },

  experience = {
    experienceMult = 1.0, -- defaults to 1.0
    powerScale = 0.0, -- defaults to 1.0
    healthScale = 1.0, -- defaults to 0.7
    reloadScale = 0.4, -- defaults to 0.4
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
    maxCollisionPushMultiplier = 1,
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
    defaultMin = 1,
    defaultMax = 4,
  },

  sensors = {
    los = {
      losMipLevel = 3,
      airMipLevel = 4,
      radarMipLevel = 3,
    },
  },

  system = {
    LuaAllocLimit = 4096, -- value in megabytes
    pathFinderSystem = 0, -- always default pathfinder
    pathFinderRawDistMult = 100,
    pathFinderUpdateRate = 0.0000001,
    --pathFinderUpdateRateScale = 1.0,
  },

  transportability = {
    transportHover = 1,
  },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
return modrules