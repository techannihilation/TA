function widget:GetInfo()
    return {
        name = "Attack and Move Notification",
        desc = "v0.32 Notifes when a unit is attacked or a move command failed",
        author = "knorke & very_bad_soldier",
        date = "June 2025",
        license = "GPLv2",
        layer = 1,
        enabled = true
    }
end
----------------------------------------------------------------------------
local alarmInterval                 = 15        --seconds
local commanderAlarmInterval		= 10
local commanderVolumeScale          = 0.5
----------------------------------------------------------------------------
local spGetLocalTeamID              = Spring.GetLocalTeamID
local spPlaySoundFile               = Spring.PlaySoundFile
local spEcho                        = Spring.Echo
local spGetTimer                    = Spring.GetTimer
local spDiffTimers                  = Spring.DiffTimers
local spIsUnitInView                = Spring.IsUnitInView
local spGetUnitPosition             = Spring.GetUnitPosition
local spSetLastMessagePosition      = Spring.SetLastMessagePosition
local spGetSpectatingState          = Spring.GetSpectatingState
local random                        = math.random
----------------------------------------------------------------------------
local lastAlarmTime                 = nil
local lastCommanderAlarmTime        = nil
local localTeamID                   = nil
----------------------------------------------------------------------------

local COMMANDER = VFS.Include("luarules/configs/comDefIDs.lua")
local soundItems
-- new sounds.lua file dynamically loads all sounds, updated to take advantage of this 
-- added by zagszy
---- NEW ----


-- END NEW --

function widget:Initialize()
    CheckSpecState()
    setTeamId()
    lastAlarmTime = spGetTimer()
    lastCommanderAlarmTime =  spGetTimer()
    math.randomseed( os.time() )
    if not SoundItems then
        local soundDefs = VFS.Include("gamedata/sounds.lua")
        SoundItems = soundDefs and soundDefs.SoundItems
    end
end

function widget:UnitDamaged (unitID, unitDefID, unitTeam, damage, paralyzer, weaponID, attackerID, attackerDefID, attackerTeam)
    if ( localTeamID ~= unitTeam )then
		return
	end
	--Spring.Echo(corcomID, unitID)
	local now = spGetTimer()
	if COMMANDER[unitDefID] then --commander under attack must always be played! (10 sec retrigger alert though)
		--Spring.Echo("Commander under attack!")
		if ( spDiffTimers( now, lastCommanderAlarmTime ) < alarmInterval ) then
			return
		end
		lastCommanderAlarmTime=now
	else
		if (spIsUnitInView(unitID)) then
			return --ignore other teams and units in view
		end
		if ( spDiffTimers( now, lastAlarmTime ) < alarmInterval ) then
			return
		end
	end
    lastAlarmTime = now

    local udef = UnitDefs[unitDefID]
    local x,y,z = spGetUnitPosition(unitID)

    spEcho("-> " .. udef.humanName  .." is being attacked!") --print notification
    
    -- NEW -- 
    local underattack = udef.sounds.underattack
    if underattack then
        local name, volume
        if type(underattack) == "table" then
            local entry = underattack[random(1, #underattack)]
            if type(entry) == "table" then
                name = entry.name or entry[1]
                volume = entry.volume
            else
                name = entry
            end
        else
            name = underattack
        end
        if name then
            if not volume then
                volume = 0.5
            end
        if COMMANDER[unitDefID] then
            volume = volume * commanderVolumeScale
        end
            local file = SoundItems and SoundItems[name]
            file = file and file.file
                or ("sounds/" .. (name:find("%.") and name or name .. ".wav"))
            spPlaySoundFile(file, volume, nil, "sfx")
        end
    end
    -- END --

    -- OLD STUFF --
    -- if ( udef.sounds.underattack and (#udef.sounds.underattack > 0) ) then
    --     id = random(1, #udef.sounds.underattack) --pick a sound from the table by random --(id 138, name warning2, volume 1)
    -- 
    --     soundFile = udef.sounds.underattack[id].name
    --     if ( string.find(soundFile, "%.") == nil ) then
    --         soundFile = soundFile .. ".wav" --append .wav if no extension is found
    --     end
    -- 
    --     local warningSound = (soundItems and soundItems[soundFile] and soundItems[soundFile].file)
    --     if warningSound then 
    --         spPlaySoundFile(warningSound, udef.sounds.underattack[id].volume, nil, "sfx" ) 
    --         -- spPlaySoundFile( "sounds/" .. soundFile, udef.sounds.underattack[id].volume, nil, "sfx" ) -- hardcode?
    --     end 
    -- end

    if (x and y and z) then spSetLastMessagePosition(x,y,z) end
end

function widget:UnitMoveFailed(unitID, unitDefID, unitTeam)
    local udef = UnitDefs[unitDefID]
    spEcho( udef.humanName  .. ": Can't reach destination!" )
end

function setTeamId()
    localTeamID = spGetLocalTeamID()
end

--changing teams, rejoin, becoming spec etc
function widget:PlayerChanged(playerID)
    setTeamId()
    CheckSpecState()
end


function CheckSpecState()
	if ( spGetSpectatingState() == true ) then
		widgetHandler:RemoveWidget(self)
		return false
	end

	return true
end
