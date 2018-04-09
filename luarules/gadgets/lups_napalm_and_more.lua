-- $Id: lups_napalm.lua 3171 2008-11-06 09:06:29Z det $

function gadget:GetInfo()
  return {
    name      = "Napalm and More",
    desc      = "",
    author    = "jK ,made ugly by nixtux",
    date      = "Sep. 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,
  }
end

local FIRE_WEAPONS = {
  ["tllhtml_tll_rockets2"] = true,
  ["corhurc_coradvbomb"] = true,
  ["corshad_corebomb"] = true,
  ["corfiend_arm_carpet_bomb"] = true,
  ["armraven_exp_heavyrocket"] = true,
  ["armraven1_exp_heavyrocket1"] = true,
  ["corsb_seaadvbomb"] = true,
  ["corpyrox_pyro_rocket"] = true,
}

local DISTORT_WEAPONS = {
  ["armcom_teleport"] = true,
  ["tllcom_teleport"] = true,
  ["corcom_teleport"] = true,
  ["armcom_teleport_blue"] = true,
  ["tllcom_teleport_blue"] = true,
  ["corcom_teleport_blue"] = true,
  ["armcom_teleport_yellow"] = true,
  ["tllcom_teleport_yellow"] = true,
  ["corcom_teleport_yellow"] = true,
  ["armsonic_sonic_cannon"] = true,
  ["corvroc_cortruck_rocket"] = true,
  ["armmerl_armtruck_rocket"] = true,
  ["shiva_shiva_rocket"] = true,
  ["armorco_corkrog_rocket"] = true,
  ["corhowie_asm"] = true,
  ["armmlrs_227mm_rockets3"] = true,
}

local MUSTARD_WEAPONS = {
  ["tllabomber_coradvbomb"] = true,
  ["tllbomber_tllbomb"] = true,
}

  if (gadgetHandler:IsSyncedCode()) then

  --// find napalms
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    if FIRE_WEAPONS[wd.name] or DISTORT_WEAPONS[wd.name] or MUSTARD_WEAPONS[wd.name] then
      
      Script.SetWatchWeapon(wd.id,true)
    end
  end

  --// Speed-ups
  local SendToUnsynced = SendToUnsynced

  function gadget:Explosion(weaponID, px, py, pz)
    SendToUnsynced("napalm_Explosion", weaponID, px, py, pz)
    return false
  end

  function gadget:GameFrame(n)
    SendToUnsynced("napalm_GameFrame",n)
  end
  
  function gadget:RecvLuaMsg(msg, id)
    if (msg == "lups shutdown") then
		SendToUnsynced("napalm_Toggle",false,id)
	elseif (msg == "lups running") then
		SendToUnsynced("napalm_Toggle",true,id)
	end
  end

else

  local napalmFX = {
    colormap        = { {0, 0, 0, 0.01}, {0.75, 0.75, 0.9, 0.02}, {0.45, 0.2, 0.3, 0.1}, {0.4, 0.16, 0.1, 0.12}, {0.3, 0.15, 0.01, 0.15},  {0.3, 0.15, 0.01, 0.15}, {0.3, 0.15, 0.01, 0.15}, {0.1, 0.035, 0.01, 0.1}, {0, 0, 0, 0.01} },
    count           = 4,
    life            = 100,
    lifeSpread      = 40,
    emitVector      = {0,1,0},
    emitRotSpread   = 90,
    force           = {0,0.3,0},

    partpos         = "r*sin(alpha),0,r*cos(alpha) | r=rand()*15, alpha=rand()*2*pi",
    priority        = 2,
    rotSpeed        = 0.25,
    rotSpeedSpread  = -0.5,
    rotSpread       = 360,
    rotExp          = 1.5,

    speed           = 0.225,
    speedSpread     = 0.05,
    speedExp        = 7,

    size            = 35,
    sizeSpread      = 10,
    sizeGrowth      = 0.15,
    sizeExp         = 2.5,

    layer           = 1,
    texture         = "bitmaps/GPL/flame.png",
  }
    
  local mustardFX = {
    colormap        = { {0.2, 0.45, 0.3, 0.1}, {0.2, 0.45, 0.3, 0.1}, {0.2, 0.45, 0.3, 0.1}, {0.16, 0.4, 0.1, 0.12}, {0.13, 0.3, 0.01, 0.15},  {0.13, 0.4, 0.01, 0.15}, {0.13, 0.5, 0.01, 0.15}, {0.1, 0.035, 0.01, 0.1}, {0, 0, 0, 0.01} },
    count           = 4,
    life            = 100,
    lifeSpread      = 40,
    emitVector      = {0,1,0},
    emitRotSpread   = 90,
    force           = {0,0.3,0},

    partpos         = "r*sin(alpha),0,r*cos(alpha) | r=rand()*15, alpha=rand()*2*pi",
    priority        = 2,

    rotSpeed        = 0.25,
    rotSpeedSpread  = -0.5,
    rotSpread       = 360,
    rotExp          = 1.5,

    speed           = 0.225,
    speedSpread     = 0.05,
    speedExp        = 7,

    size            = 35,
    sizeSpread      = 10,
    sizeGrowth      = 0.15,
    sizeExp         = 2.5,

    layer           = 1,
    texture         = "bitmaps/mustard.png",
  }
    
  local heatFX = {
    count         = 1,
    emitVector    = {0,1,0},
    emitRotSpread = 60,
    force         = {0,0.5,0},
    priority      = 1,

    life          = 140,
    lifeSpread    = 50,

    speed           = 0.25,
    speedSpread     = 0.25,
    speedExp        = 7,

    size            = 100,
    sizeSpread      = 40,
    sizeGrowth      = 0.3,
    sizeExp         = 2.5,

    strength      = 0.75,
    scale         = 5.0,
    animSpeed     = 0.25,
    heat          = 6.5,

    texture       = "bitmaps/GPL/Lups/mynoise2.png",
  }
  
    local distortFX = {
    count         = 1,
    emitVector    = {0,1,0},
    emitRotSpread = 60,
    force         = {0,0.5,0},
    priority      = 1,

    life          = 1,
    lifeSpread    = 40,

    speed           = 0.25,
    speedSpread     = 0.25,
    speedExp        = 7,

    size            = 150,
    sizeSpread      = 40,
    sizeGrowth      = 0.3,
    sizeExp         = 2.5,

    strength      = 1.0,
    scale         = 5.0,
    animSpeed     = 0.25,
    heat          = 12.5,

    texture       = "bitmaps/GPL/Lups/mynoise2.png",
  }
   
  local Lups
  local LupsAddParticles 
  local enabled = false

  local napalmWeapons = {}
  local napalmExplosions  = {}
  
  local distortWeapons = {}
  local distortExplosions  = {}
  
  local mustardWeapons = {}
  local mustardExplosions  = {}

  local DISTORT_SHORT = {
    ["armcom_teleport"] = true,
    ["tllcom_teleport"] = true,
    ["corcom_teleport"] = true,
    ["armcom_teleport_blue"] = true,
    ["tllcom_teleport_blue"] = true,
    ["corcom_teleport_blue"] = true,
    ["armcom_teleport_yellow"] = true,
    ["tllcom_teleport_yellow"] = true,
    ["corcom_teleport_yellow"] = true,
}
  --// find napalms
  for i=1,#WeaponDefs do
    local wd = WeaponDefs[i]
    if FIRE_WEAPONS[wd.name] then
      napalmWeapons[wd.id] = true
    elseif DISTORT_WEAPONS[wd.name] then
      distortWeapons[wd.id] = true
    elseif MUSTARD_WEAPONS[wd.name] then
      mustardWeapons[wd.id] = true
    end
  end  


  local function napalm_Explosion(_, weaponID, px, py, pz)
    if (napalmWeapons[weaponID]) then
      napalmExplosions[#napalmExplosions+1] = {px, py, pz}
    elseif (distortWeapons[weaponID]) then
       distortExplosions[#distortExplosions+1] = {px, py, pz, weaponID}
    elseif (mustardWeapons[weaponID]) then
      mustardExplosions[#mustardExplosions+1] = {px, py, pz}
    end
  end


  local function SpawnNapalmFX(pos)
    napalmFX.pos = {pos[1],pos[2],pos[3]}
    Lups.AddParticles('SimpleParticles2',napalmFX)
  end

  local function SpawnMustardFX(pos)
    mustardFX.pos = {pos[1],pos[2],pos[3]}
    Lups.AddParticles('SimpleParticles2',mustardFX)
  end
  
  local function SpawnHeatFX(pos)
     if enabled then
       if pos[4] and (DISTORT_SHORT[WeaponDefs[pos[4]].name]) then
	 distortFX.pos = {pos[1],pos[2],pos[3]}
	 Lups.AddParticles('JitterParticles2',distortFX)
       else
	 heatFX.pos = {pos[1],pos[2],pos[3]}
	 Lups.AddParticles('JitterParticles2',heatFX)
       end
   end
end
  
  local function napalm_GameFrame(_, n)
    if (#napalmExplosions>0) then
      napalmExplosions =  napalmExplosions
      napalmCount      = #napalmExplosions
      if (not Lups) then Lups = GG['Lups']; LupsAddParticles = Lups.AddParticles end
      local explosions = napalmExplosions
      for i=1,napalmCount do
        SpawnNapalmFX(explosions[i])
        SpawnHeatFX(explosions[i])
      end
      napalmExplosions = {}
    elseif (#distortExplosions>0) then
      distortExplosions =  distortExplosions
      distortCount      = #distortExplosions
      if (not Lups) then Lups = GG['Lups']; LupsAddParticles = Lups.AddParticles end
      local heatexplosions = distortExplosions
      for i=1,distortCount do
        SpawnHeatFX(heatexplosions[i])
      end
      distortExplosions = {}
    elseif (#mustardExplosions>0) then
      mustardExplosions =  mustardExplosions
      mustardCount      = #mustardExplosions
      if (not Lups) then Lups = GG['Lups']; LupsAddParticles = Lups.AddParticles end
      local mexplosions = mustardExplosions
      for i=1,mustardCount do
        SpawnMustardFX(mexplosions[i])
	SpawnHeatFX(mexplosions[i])

      end
      mustardExplosions = {}
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
    gl.DeleteTexture(napalmFX.texture)
    gadgetHandler:AddSyncAction("napalm_GameFrame", napalm_GameFrame)
    gadgetHandler:AddSyncAction("napalm_Toggle", Toggle)
    gadgetHandler:AddSyncAction("napalm_Explosion", napalm_Explosion)
  end


  function gadget:Shutdown()
    gadgetHandler.RemoveSyncAction("napalm_GameFrame")
    gadgetHandler.RemoveSyncAction("napalm_Toggle")
    gadgetHandler:RemoveSyncAction("napalm_Explosion")    
  end

end