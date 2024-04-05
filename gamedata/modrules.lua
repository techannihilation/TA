--------------------------- TechA Config ---------------------------
-- Retrieve the current engine version
-- local engineVersionString = Engine.version
-- local engineVersion = tonumber(string.match(engineVersionString, "%-(%d+)"))

local flankDefaultMin = Spring.GetModOptions().exp_flankdefaultmin or 1
local flankDefaultMax = Spring.GetModOptions().exp_flankdefaultmax or 2

local modrules = {

  construction = {
    constructionDecay = true, -- defaults to true (do uncompleted building frames begin to decay if no builder is working on them?)
    constructionDecayTime = 9, -- defaults to 6.66 (the time in seconds before abandoned building frames begin to decay.)
    constructionDecaySpeed = 0.03, -- defaults to 0.03 (how fast build progress decays for abandoned building frames.)
  },

  reclaim = {
    multiReclaim = 1,   -- Can multiple units reclaim a feature or only one? 0 implies the latter, all other values the former.
    reclaimMethod = 0,    -- Controls how features are reclaimed. Can be 0 - gradual reclaim, 1 - all reclaimed at end, any other positive value n - reclaim in n chunks.
    unitMethod = 1,     -- Controls how units are reclaimed. Can be 0 - gradual reclaim, 1 - all reclaimed at end, any other positive value n - reclaim in n chunks.

    unitEnergyCostFactor = 0,   -- How much energy should reclaiming a unit cost? Multiplier against the fraction of the unit's buildCostEnergy reclaimed.
    unitEfficiency = 1,       -- How much metal should reclaiming a unit return? Multiplier against the unit's buildCostMetal.
    featureEnergyCostFactor = 0,  -- How much energy should reclaiming a feature cost? Multiplier against the fraction of the features' metal content reclaimed.

    allowEnemies = true,  -- Can enemy units be reclaimed?
    allowAllies = true,   -- Can allied units be reclaimed?
  },

  repair = {
    energyCostFactor = 0, -- How much of the original energy cost it requires to resurrect something.
  },

  resurrect = {
    energyCostFactor = 0.5, -- How much of the original energy cost it requires to resurrect something.
  },

  capture = {
    energyCostFactor = 0, -- How much of the original energy cost it requires to capture something.
  },

  flankingBonus = {
    defaultMode = 1, -- default to 1
    defaultMin = flankDefaultMin,
    defaultMax = flankDefaultMax,
  },

  sensors = {
    separateJammers = true,         -- When true each allyTeam only jams their own units.
    requireSonarUnderWater = true,      -- If true then when underwater, units only get LOS if they also have sonar.
    alwaysVisibleOverridesCloaked = false,  -- If true then units will be visible even when cloaked (probably?).
    decloakRequiresLineOfSight = false,   -- default: false

    los = {
      losMipLevel = 3,  -- Controls the resolution of the LOS calculations. A higher value means lower resolution but increased performance. An increase by one level means half the resolution of the LOS map in both x and y direction. Must be between 0 and 6 inclusive.
      airMipLevel = 4,  -- Controls the resolution of the LOS vs. aircraft calculations. A higher value means lower resolution but increased performance. An increase by one level means half the resolution of the air-LOS map in both x and y direction. Must be between 0 and 30 inclusive. [1] - jK describe for you what the value means.
      radarMipLevel = 3,  -- Controls the resolution of the radar. See description of airMipLevel for details.
    },
  },

  fireAtDead = {
    fireAtKilled = false, -- Will units continue to target and fire on enemies which are running their Killed() animation?
    fireAtCrashing = false, -- Will units continue to target and fire on enemy aircraft which are in the 'crashing' state?
  },

  movement = {
    allowUnitCollisionDamage = false, -- default: true if using QTPFS pathfinder.  Do unit-unit (skidding) collisions cause damage?
    allowUnitCollisionOverlap = false, -- defaults to true -- this lets units clump close together when moving, after which they are pushed apart
    allowCrushingAlliedUnits = true,
    allowGroundUnitGravity = false,

    allowAirPlanesToLeaveMap = true,  -- Are (gunship) aircraft allowed to fly outside the bounds of the map?
    allowAircraftToHitGround = true,  -- Are aircraft allowed to hit the ground whilst manoeuvring?
    allowPushingEnemyUnits = true, -- defaults to false
    allowHoverUnitStrafing = true, -- Allows hovercraft units to slide in turns.

    allowDirectionalPathing = true,   -- determines if ground speed going downhill != going uphill
    allowAircraftToLeaveMap = true,   -- determines if gunships are allowed to leave map boundaries
    maxCollisionPushMultiplier = 1.0,

    unitQuadPositionUpdateRate = 5; -- affects collision accuracy (incl. with projectiles).
                                     -- rate in sim frames that a unit's position in the quad grid is updated (default: 3)
                                     -- a lower number will increase CPU load, but increase accuracy of collision detection                    

    groundUnitCollisionAvoidanceUpdateRate = 5; -- for controlling steering performance vs quality tradeoff load. 
                                                 -- Reduce to get better quality at the cost of perf. 
                                                 -- Default value is 3 for cycling through all units over 3 sim frames.
  },

  featureLOS = {
    featureVisibility = 2, -- Can be 0 - no default LOS for features, 1 - Gaia features always visible, 2 - allyteam & Gaia features always visible, or 3 - all features always visible.
  },

  system = {
    allowTake = true, -- Enables and disables the /take UI command.
    LuaAllocLimit = 2560, -- default: 1536.  Global Lua alloc limit (in megabytes)
    enableSmoothMesh = true,

    pathFinderSystem = 1, -- (engineVersion >= 2142) and 1 or 0, -- Which pathfinder does the game use? Can be 0 - The legacy default pathfinder, 1 - Quad-Tree Pathfinder System (QTPFS) or -1 - disabled.    
    pathFinderRawDistMult = 100000, -- default: 1.25.  Engine does raw move with a limited distance, this multiplier adjusts that  
    pfRepathDelayInFrames = 90,   -- default: 60.  How many frames at least must pass between checks for whether a unit is making enough progress to its current waypoint or whether a new path should be requested
    pfRepathMaxRateInFrames = 180,  -- default: 150.  Controls the minimum amount of frames that must pass before a unit is allowed to request a new path. Mostly for rate limiting and prevent excessive CPU wastage
    pfUpdateRateScale = 1,      -- default: 1.  Multiplier for the update rate
    pfRawMoveSpeedThreshold = 0,  -- default: 0.  Controls the speed modifier (which includes typemap boosts and up/down hill modifiers) under which units will never do raw move, regardless of distance etc. Defaults to 0, which means units will not try to raw-move into unpathable terrain (e.g. typemapped lava, cliffs, water). You can set it to some positive value to make them avoid pathable but very slow terrain (for example if you set it to 0.2 then they will not raw-move across terrain where they move at 20% speed or less, and will use normal pathing instead - which may still end up taking them through that path).
    pfHcostMult = 0.5,        -- default: 0.2.  A float value between 0 and 2. Controls how aggressively the pathing search prioritizes nodes going in the direction of the goal. Higher values mean pathing is cheaper, but can start producing degenerate paths where the unit goes straight at the goal and then has to hug a wall.
  },

  transportability = {
    transportAir = true, -- Can aircraft be transported?
    transportShip = true,  -- Can ships be transported?
    transportHover = true,  -- Can hovercraft be transported?
    transportGround = true, -- Can ground units be transported?
    targetableTransportedUnits = false, -- Can transported units be targeted by weapons? true allows both manual and automatic targeting.
  },

  paralyze = {
    paralyzeOnMaxHealth = true, -- Are units paralyzed when the level of emp is greater than their current health or their maximum health?
    paralyzeDeclineRate = 40,  -- default: 40.
  },

  experience = {
    experienceMult = 0.8, -- defaults to 1.0
    powerScale = 0.0, -- defaults to 1.0
    healthScale = 0.0, -- defaults to 0.7
    reloadScale = 2.5, -- defaults to 0.4
  },

  damage = {
    debris = 0, -- controls damage done by exploding pieces
  },

}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
return modrules
