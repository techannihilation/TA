--------------------------------------------------------------------------------
--  Team Com Ends  (AI-aware, echo-verbose, 2025-ready)
--  deathmode == "com"      ->  ally-team loses when its LAST commander dies
--  deathmode == "own_com"  ->  a team resigns when *its* last commander dies,
--                                even if allied commanders survive
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Team Com Ends",
    desc      = "Commander-based resign logic (includes AI teammates, ignores Gaia)",
    author    = "KDR_11k, Floris",
    date      = "2025-06-09",
    license   = "Public domain",
    layer     = 1,
    enabled   = true,
  }
end


-- SYNC-SIDE ONLY ---------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then return end

--------------------------------------------------------------------------------
--  Helpers & API shims
--------------------------------------------------------------------------------
local echo = function(...) Spring.Echo("\255\255\180\000[ComEnds]\008", ...) end

-- 2025: GetTeamInfo(teamID)  -> table
-- old  : GetTeamInfo(teamID)  -> 10 separate returns
local function TeamInfo(teamID)
  local t = Spring.GetTeamInfo(teamID)
  if type(t) == "table" then return t end       -- new format
  local leader, _, isDead, isAiTeam, _, allyTeam = Spring.GetTeamInfo(teamID)
  return { leader = leader, isDead = isDead, isAiTeam = isAiTeam, allyTeam = allyTeam }
end

local GetAllyTeamID = Spring.GetTeamAllyTeamID or
  function(teamID) return TeamInfo(teamID).allyTeam end

local function TeamIsDead(teamID) return TeamInfo(teamID).isDead end


--------------------------------------------------------------------------------
--  Commander look-up
--------------------------------------------------------------------------------
local comDefs = assert(VFS.Include("luarules/configs/comDefIDs.lua"),
                       "Missing configs/comDefIDs.lua (list of commander UnitDefIDs)")

--------------------------------------------------------------------------------
--  Book-keeping tables
--------------------------------------------------------------------------------
local gaiaID              = Spring.GetGaiaTeamID()
local aliveComCount       = {}   -- allyTeamID -> integer
local aliveTeamComCount   = {}   -- teamID     -> integer
local commanderDeathQueue = {}   -- unitID     -> {team,x,z}

--------------------------------------------------------------------------------
--  Core logic
--------------------------------------------------------------------------------
local function commanderDeath(teamID, x, z)
  local ally = GetAllyTeamID(teamID)
  aliveComCount    [ally]  = aliveComCount    [ally]  - 1
  aliveTeamComCount[teamID] = aliveTeamComCount[teamID] - 1

  local deathmode = (Spring.GetModOption and Spring.GetModOption("deathmode"))
                 or (Spring.GetModOptions and Spring.GetModOptions().deathmode)
                 or "com"

  ----------------------------------------------------------------------
  --  own_com  ->  eliminate *this* team if it lost every commander
  ----------------------------------------------------------------------
  if deathmode == "own_com" and aliveTeamComCount[teamID] <= 0 then
    if not TeamIsDead(teamID) then
      echo(("Team %d lost its last commander at <%d,%d> -> eliminated.")
           :format(teamID, x or 0, z or 0))
      Spring.KillTeam(teamID)
    end
  end

  ----------------------------------------------------------------------
  --  both modes  ->  eliminate ally-team if NO commanders remain
  ----------------------------------------------------------------------
  if aliveComCount[ally] <= 0 then
    echo(("Ally-team %d has no commanders left -> all its teams resign."):format(ally))
    for _, t in ipairs(Spring.GetTeamList(ally)) do
      if not TeamIsDead(t) then Spring.KillTeam(t) end
    end
  else
    --echo(("Commander down!  Ally-team %d: %d remaining  |  Team %d: %d remaining"):format(ally, aliveComCount[ally], teamID, aliveTeamComCount[teamID]))
  end
end


--------------------------------------------------------------------------------
--  Call-ins
--------------------------------------------------------------------------------
function gadget:GameFrame()
  -- one-frame delay (handles transfer/reclaim edge-cases safely)
  for unitID, d in pairs(commanderDeathQueue) do
    commanderDeath(d.team, d.x, d.z)
    commanderDeathQueue[unitID] = nil
  end
end


function gadget:UnitCreated(uID, uDefID, uTeam)
  if uTeam ~= gaiaID and comDefs[uDefID] then
    local ally = GetAllyTeamID(uTeam)
    aliveComCount    [ally]   = aliveComCount    [ally]   + 1
    aliveTeamComCount[uTeam]  = aliveTeamComCount[uTeam]  + 1
  end
end


function gadget:UnitDestroyed(uID, uDefID, uTeam)
  if uTeam ~= gaiaID and comDefs[uDefID] then
    local x, _, z = Spring.GetUnitPosition(uID)
    commanderDeathQueue[uID] = { team = uTeam, x = x, z = z }
  end
end


-- transfers (Given / Taken) ----------------------------------------------------
local function handleTransfer(uID, oldTeam, newTeam)
  if oldTeam == gaiaID or newTeam == gaiaID then return end
  local allyOld, allyNew = GetAllyTeamID(oldTeam), GetAllyTeamID(newTeam)
  if allyOld ~= allyNew then
    aliveComCount    [allyNew] = aliveComCount    [allyNew] + 1
    aliveTeamComCount[newTeam] = aliveTeamComCount[newTeam] + 1
    local x, _, z = Spring.GetUnitPosition(uID)
    commanderDeathQueue[uID] = { team = oldTeam, x = x, z = z }  -- fake death
  end
end

function gadget:UnitGiven(uID, uDefID, newTeam, oldTeam)
  if comDefs[uDefID] then handleTransfer(uID, oldTeam, newTeam) end
end
function gadget:UnitTaken(uID, uDefID, oldTeam, newTeam)
  if comDefs[uDefID] then handleTransfer(uID, oldTeam, newTeam) end
end


--------------------------------------------------------------------------------
--  Initialise / reload safety
--------------------------------------------------------------------------------
function gadget:Initialize()
  local dm = (Spring.GetModOption and Spring.GetModOption("deathmode"))
           or (Spring.GetModOptions and Spring.GetModOptions().deathmode)
  if dm ~= "com" and dm ~= "own_com" then
    echo("Disabled (deathmode = \""..tostring(dm) .."\")")
    gadgetHandler:RemoveGadget(self)
    return
  end

  -- zero the counters
  for _, ally in ipairs(Spring.GetAllyTeamList()) do aliveComCount[ally] = 0 end
  for _, team in ipairs(Spring.GetTeamList())      do aliveTeamComCount[team] = 0 end

  -- count existing commanders (after /luarules reload too)
  for _, u in ipairs(Spring.GetAllUnits()) do
    local def = Spring.GetUnitDefID(u)
    if comDefs[def] then
      local t = Spring.GetUnitTeam(u)
      if t ~= gaiaID then
        local a = GetAllyTeamID(t)
        aliveComCount    [a] = aliveComCount    [a] + 1
        aliveTeamComCount[t] = aliveTeamComCount[t] + 1
      end
    end
  end

  -- announce initial counts
  echo("Initial commander counts per ally-team:")
  for ally, n in pairs(aliveComCount) do
    echo(("  Ally-team %d -> %d commanders alive"):format(ally, n))
  end

  -- if a reload happens mid-game, finish off already-dead sides now
  local frame, day = Spring.GetGameFrame()
  if (frame > 1) or (day and day > 0) then
    for ally, n in pairs(aliveComCount) do
      if n <= 0 then
        echo(("Ally-team %d already has zero commanders - eliminating its teams"):format(ally))
        for _, t in ipairs(Spring.GetTeamList(ally)) do commanderDeath(t) end
      end
    end
  end
end
