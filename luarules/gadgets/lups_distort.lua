-- $Id: lups_distort.lua 3171 2008-11-06 09:06:29Z det $

function gadget:GetInfo()
  return {
    name      = "Distort",
    desc      = "",
    author    = "jK",
    date      = "Sep. 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

local FIRE_WEAPONS = {
  ["armsonic_sonic_cannon"] = true,
}

if (gadgetHandler:IsSyncedCode()) then

  local distortWeapons = {}

  --// find distorts
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    if FIRE_WEAPONS[wd.name] then
      Script.SetWatchWeapon(wd.id,true)
      distortWeapons[wd.id] = true
    end
  end

  local distortExplosions  = {}

  --// Speed-ups
  local SendToUnsynced = SendToUnsynced

  function gadget:Explosion(weaponID, px, py, pz)
    if (distortWeapons[weaponID]) then
      distortExplosions[#distortExplosions+1] = {px, py, pz}
    end
    return false
  end

  function gadget:GameFrame(n)
    if (#distortExplosions>0) then
      _G.distortExplosions =  distortExplosions
      _G.distortCount      = #distortExplosions
      SendToUnsynced("distort_GameFrame")
      distortExplosions = {}
    end
  end

  function gadget:RecvLuaMsg(msg, id)
    if (msg == "lups shutdown") then
		SendToUnsynced("distort_Toggle",false,id)
	elseif (msg == "lups running") then
		SendToUnsynced("distort_Toggle",true,id)
	end
  end

else

  local heatFX = {
    count         = 1,
    emitVector    = {0,1,0},
    emitRotSpread = 60,
    force         = {0,0.5,0},

    life          = 140,
    lifeSpread    = 50,

    speed           = 0.25,
    speedSpread     = 0.25,
    speedExp        = 7,

    size            = 75,
    sizeSpread      = 40,
    sizeGrowth      = 0.3,
    sizeExp         = 2.5,

    strength      = 1.75,
    scale         = 5.0,
    animSpeed     = 0.25,
    heat          = 16.5,

    texture       = "bitmaps/GPL/Lups/mynoise2.png",
  }

  local Lups
  local LupsAddParticles 
  local SYNCED = SYNCED
  local enabled = false

  local function SpawnNapalmFX(pos)
    heatFX.pos = {pos[1],pos[2],pos[3]}
    if enabled then
		Lups.AddParticles('JitterParticles2',heatFX)
	end
  end

  local function GameFrame()
    if (not Lups) then Lups = GG['Lups']; LupsAddParticles = Lups.AddParticles end
    local explosions = SYNCED.distortExplosions
    for i=1,SYNCED.distortCount do
      SpawnNapalmFX(explosions[i])
    end
  end
  
  local function Toggle(_,enable,playerId)
    if (playerId == Spring.GetMyPlayerID()) then
      if enable then
	    enabled = true
	  else
	    enabled = false
	  end
	end
  end

  function gadget:Initialize()
    gadgetHandler:AddSyncAction("distort_GameFrame", GameFrame)
    gadgetHandler:AddSyncAction("distort_Toggle", Toggle)
  end


  function gadget:Shutdown()
    gadgetHandler.RemoveSyncAction("distort_GameFrame")
    gadgetHandler.RemoveSyncAction("distort_Toggle")
  end

end
