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

  --// find distorts
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    if FIRE_WEAPONS[wd.name] then
      Script.SetWatchWeapon(wd.id,true)
    end
  end

  --// Speed-ups
  local SendToUnsynced = SendToUnsynced

  function gadget:Explosion(weaponID, px, py, pz)
    SendToUnsynced("distort_Explosion", weaponID, px, py, pz)
    return false
  end

  function gadget:GameFrame(n)
    SendToUnsynced("distort_GameFrame",n)
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

    size            = 130,
    sizeSpread      = 40,
    sizeGrowth      = 0.3,
    sizeExp         = 2.5,

    strength      = 1.25,
    scale         = 5.0,
    animSpeed     = 0.25,
    heat          = 6.5,

    texture       = "bitmaps/GPL/Lups/mynoise2.png",
  }

  local Lups
  local LupsAddParticles 
  local enabled = false

  local distortWeapons = {}
  local distortExplosions  = {}

  --// find distorts
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    if FIRE_WEAPONS[wd.name] then
      distortWeapons[wd.id] = true
    end
  end  


  local function distort_Explosion(_, weaponID, px, py, pz)
    if (distortWeapons[weaponID]) then
      distortExplosions[#distortExplosions+1] = {px, py, pz}
    end
  end


  local function SpawnNapalmFX(pos)
    heatFX.pos = {pos[1],pos[2],pos[3]}
		Lups.AddParticles('JitterParticles2',heatFX)
  end

  
  local function distort_GameFrame(_, n)
    if (#distortExplosions>0) then
      distortExplosions =  distortExplosions
      distortCount      = #distortExplosions
      if (not Lups) then Lups = GG['Lups']; LupsAddParticles = Lups.AddParticles end
      local explosions = distortExplosions
      for i=1,distortCount do
        SpawnNapalmFX(explosions[i])
      end
      distortExplosions = {}
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
    gadgetHandler:AddSyncAction("distort_GameFrame", distort_GameFrame)
    gadgetHandler:AddSyncAction("distort_Toggle", Toggle)
    gadgetHandler:AddSyncAction("distort_Explosion", distort_Explosion)
  end


  function gadget:Shutdown()
    gadgetHandler.RemoveSyncAction("distort_GameFrame")
    gadgetHandler.RemoveSyncAction("distort_Toggle")
    gadgetHandler:RemoveSyncAction("distort_Explosion")    
  end

end