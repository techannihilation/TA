--------------------------- TechA Config ---------------------------
-- Retrieve the current engine version
local engineVersionString = Engine.version
local engineVersion = tonumber(string.match(engineVersionString, "%-(%d+)"))

local flankDefaultMin = Spring.GetModOptions().exp_flankdefaultmin or 1
local flankDefaultMax = Spring.GetModOptions().exp_flankdefaultmax or 2

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
    healthScale = 0.25, -- defaults to 0.7
    reloadScale = 1.1, -- defaults to 0.4
  },

  featureLOS = {
    featureVisibility = 0,
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
    pathFinderSystem = (engineVersion >= 2142) and 1 or 0, -- Which pathfinder does the game use? Can be 0 - The legacy default pathfinder, 1 - Quad-Tree Pathfinder System (QTPFS) or -1 - disabled.    
    pathFinderRawDistMult = 100000, -- default: 1.25.  Engine does raw move with a limited distance, this multiplier adjusts that
    --pathFinderUpdateRate = 0.0000001, -- default: 0.007.  Controls how often the pathfinder updates; larger values means more rapid updates.
    --pathFinderUpdateRateScale = 1.0,    
    pfHcostMult = 0.2,  -- default: 0.2.  A float value between 0 and 2. Controls
    pfRawMoveSpeedThreshold = 0,  -- default: 0.  Controls the speed modifier (which includes typemap boosts and up/down hill modifiers) under which units will never do raw move, regardless of distance etc. Defaults to 0, which means units will not try to raw-move into unpathable terrain (e.g. typemapped lava, cliffs, water). You can set it to some positive value to make them avoid pathable but very slow terrain (for example if you set it to 0.2 then they will not raw-move across terrain where they move at 20% speed or less, and will use normal pathing instead - which may still end up taking them through that path).
    pfRepathDelayInFrames = 60, -- default: 60.  How many frames at least must pass between checks for whether a unit is making enough progress to its current waypoint or whether a new path should be requested
    pfRepathMaxRateInFrames = 150,  -- default: 150.  Controls the minimum amount of frames that must pass before a unit is allowed to request a new path. Mostly for rate limiting and prevent excessive CPU wastage
    pfUpdateRateScale = 1,  -- default: 1.  Multiplier for the update rate

    allowTake = true, -- Enables and disables the /take UI command.
    LuaAllocLimit = 2560, -- default: 1536.  Global Lua alloc limit (in megabytes)
  },

  transportability = {
    transportHover = 1,
  },
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
return modrules
