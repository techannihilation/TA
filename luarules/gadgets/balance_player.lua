--------------------------------------------------------------------------------
--  gadget:dmg_player_bonus.lua
--------------------------------------------------------------------------------
if not gadgetHandler:IsSyncedCode() then return end

function gadget:GetInfo()
  return {
    name    = "DmgPlayerBonus",
    desc    = "Scales damage per-player via Base64 modoption. The modoption 'dmg_player_bonus' must be a Base64-encoded. Format {['playerName'] = {damageRecieveScale = 0.8}, ['[ur]uncle'] = {damageRecieveScale = 1.2}}",
    author  = "[ur]uncle",
    date    = "2025-04-18",
    license = "GNU GPL, v2 or later",
    layer   = 0,
    enabled = true,
  }
end

-- e.g.
-- {['playerName'] = {damageRecieveScale = 0.8}, ['[ur]uncle'] = {damageRecieveScale = 1.2}}
-- e1sncGxheWVyTmFtZSddID0ge2RhbWFnZVJlY2lldmVTY2FsZSA9IDAuOH0sIFsnW3VyXXVuY2xlJ10gPSB7ZGFtYWdlUmVjaWV2ZVNjYWxlID0gMS4yfX0=

local GetModOptions = Spring.GetModOptions
local DecodeB64     = string.base64Decode

local playerScaleT = {}
local teamScale    = {}

function gadget:Initialize()
  Spring.Echo("DmgPlayerBonus initialized")

  local encStr = (GetModOptions() or {}).dmg_player_bonus or ""
  if encStr == "" then return end

  -- Decode the Base64 string into Lua code
  local ok, chunkStr = pcall(DecodeB64, encStr)
  if not ok or type(chunkStr) ~= "string" then
    Spring.Echo("DmgPlayerBonus: failed to decode Base64 string")
    return
  end

  -- Allow bare table literals by prepending 'return '
  chunkStr = "return " .. chunkStr

  -- Compile the chunk
  local func, err = loadstring(chunkStr, "DmgPlayerBonus")
  if not func then
    Spring.Echo("DmgPlayerBonus: loadstring error: " .. tostring(err))
    return
  end

  -- Run it in a clean environment
  setfenv(func, {})
  local success, tbl = pcall(func)
  if not success or type(tbl) ~= "table" then
    Spring.Echo("DmgPlayerBonus: loaded chunk did not return a table")
    return
  end

  playerScaleT = tbl

  -- Map each team to its player's scale
  for _, teamID in ipairs(Spring.GetTeamList()) do
    local leaderID = Spring.GetTeamInfo(teamID)
    local realName = leaderID and select(1, Spring.GetPlayerInfo(leaderID, false)) or ""
    local entry    = playerScaleT[realName]
    teamScale[teamID] = (entry and entry.damageRecieveScale) or 1
    Spring.Echo("DmgPlayerBonus: " .. realName .. " scale = " .. teamScale[teamID])
  end
end

function gadget:UnitPreDamaged(_, _, teamID, damage)
  if teamScale[teamID] ~= 1 then
    return damage * (teamScale[teamID] or 1)
  end
  return damage, 1
end
--------------------------------------------------------------------------------
