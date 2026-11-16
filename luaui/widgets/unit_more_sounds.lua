function widget:GetInfo()
  return {
    name      = "MoreSounds v2.0",
    desc      = "Builds 'reply table' which contains sounds to play after construction",
    author    = "TheFatController, Zagszy",
    date      = "6 June 2025",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local activateSounds = {}
local GetUnitPosition = Spring.GetUnitPosition
local PlaySoundFile = Spring.PlaySoundFile
local configVolume = tonumber(Spring.GetConfigString("snd_volunitreply") or 100)
local volume = ((configVolume or 100) / 100)

local soundDefs = VFS.Include("gamedata/sounds.lua") -- need this since this widget cant access Global SoundItems  
local SoundItems = soundDefs.SoundItems


function widget:Initialize()
  for unitDefID,defs in pairs(UnitDefs) do
    if defs["sounds"]["select"][1] and (not (defs["sounds"]["activate"][1])) then
      -- activateSounds[unitDefID] = ("sounds/replies/" .. defs["sounds"]["select"][1]["name"] .. ".wav") -- prev. hardcoded solution. 
      local name = defs.sounds.select[1].name
      local item = SoundItems and SoundItems[name]
      local file = item and item.file or VFS.DirList("sounds", name..".wav", nil, true)[1]
      if file then activateSounds[unitDefID] = file end
    end
  end
end

function widget:UnitFinished(unitID, unitDefID, unitTeam)
  if activateSounds[unitDefID] then
    local x,y,z = GetUnitPosition(unitID)
    PlaySoundFile(activateSounds[unitDefID],volume,x,y,z)
  end
end
  
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------