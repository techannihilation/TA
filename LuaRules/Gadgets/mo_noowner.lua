function gadget:GetInfo()
  return {
    name      = "mo_noowner",
    desc      = "mo_noowner",
    author    = "TheFatController",
    date      = "19 Jan 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

local enabled = tonumber(Spring.GetModOptions().mo_noowner) or 0

if (enabled == 0) then 
  return false
end

local GetPlayerInfo = Spring.GetPlayerInfo
local GetPlayerList = Spring.GetPlayerList
local GetTeamList = Spring.GetTeamList
local GetTeamUnits = Spring.GetTeamUnits
local DestroyUnit = Spring.DestroyUnit
local GetUnitTransporter = Spring.GetUnitTransporter

local deadTeam = {}
deadTeam[Spring.GetGaiaTeamID()] = true

function GetTeamIsTakeable(team)
  local players = GetPlayerList(true)
  for _, player in ipairs(players) do
    local _, _, _, playerTeam = GetPlayerInfo(player)
    if (playerTeam == team) then
      return false
    end
  end
  return true
end

function gadget:TeamDied(teamID)
  deadTeam[teamID] = true
end

function gadget:GameFrame(n)
  for _, team in ipairs(GetTeamList()) do
    if (not deadTeam[team]) and GetTeamIsTakeable(team) then
      local teamUnits = GetTeamUnits(team)
      if (n < 1800) then
	    for _, unitID in pairs(teamUnits) do
          DestroyUnit(unitID, false, true)
        end
        Spring.Echo("No Owner Mode: Removing Team " .. team)
        deadTeam[team] = true
      else
 	    for _, unitID in pairs(teamUnits) do
 	      if not GetUnitTransporter(unitID) then
            DestroyUnit(unitID)
          end
        end
        Spring.Echo("No Owner Mode: Destroying Team " .. team)
        deadTeam[team] = true
      end
    end
  end
end

function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
  if deadTeam[newTeam] then
    return false
  else
    return true
  end
end
 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------