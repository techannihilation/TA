function widget:GetInfo()
  return {
    name      = "Commandser Self destroy Count Down",
    desc      = "Self destroy count down",
    author    = "tizbac",
    date      = "5 may 2023",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local CMD_SELFD = CMD.SELFD
local activateSounds = {}
local GetUnitPosition = Spring.GetUnitPosition
local PlaySoundFile = Spring.PlaySoundFile
local configVolume = tonumber(Spring.GetConfigString("snd_volunitreply") or 100)
local volume = ((configVolume or 100) / 100)

local count_downs = {}

function widget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams)
  if cmdID == CMD_SELFD and teamID == Spring.GetLocalTeamID() then 
    
    local udef = UnitDefs[unitDefID];
    if count_downs[unitID] == nil and udef.customParams.iscommander then 
      count_downs[unitID] = {
        time = Spring.GetGameSeconds()+5.0,
        played = {false, false, false, false , false}
      }
      PlaySoundFile("sounds/commander_selfd_start.wav", 1.0 , "ui")
    elseif count_downs[unitID] ~= nil and udef.customParams.iscommander then
      count_downs[unitID] = nil
    end
  end
end

function widget:UnitDestroyed(unitID)
  count_downs[unitID] = nil 

end 

function widget:GameFrame(n)
  if n % 10 == 0 then 
    local gs = Spring.GetGameSeconds()
    for unitID, cd in pairs(count_downs) do
      if ( cd.time-gs < 3 and not cd.played[3]) then
        PlaySoundFile("sounds/commander_count" .. 3 .. ".wav", 1.0 , "ui")
        cd.played[3] = true
      end
      if ( cd.time-gs < 1 and not cd.played[1] ) then
        PlaySoundFile("sounds/commander_count" .. 1 .. ".wav", 1.0 , "ui")
        cd.played[1] = true
      end

    end

  end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------