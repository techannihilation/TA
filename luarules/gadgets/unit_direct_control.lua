--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unit_direct_control.lua
--  brief:   first person unit control
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "DirectControl",
    desc      = "Block direct control (FPS) for units",
    author    = "trepan",
    date      = "Jul 10, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false --  loaded by default?
  }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local enabled = true

local badUnitDefs = {}
local weaponDefTable = WeaponDefs

for i=1,#UnitDefs do
local unitDefID = UnitDefs[i]
  if #unitDefID.weapons and #unitDefID.weapons >= 1 then
  	if unitDefID.canFly then
  		--Spring.Echo("Aircraft Detected Direct Control Disabled")
  		badUnitDefs[i] = true
  	end
  	for v=1, #unitDefID.weapons do
  	  weaponDef = weaponDefTable[ unitDefID.weapons[v].weaponDef]
  	  --Spring.Echo(UnitDefs[i].name," type",weaponDef.type," numb.weapon :" ,#unitDefID.weapons)
  	  if weaponDef.type == "MissileLauncher" or weaponDef.type == "StarburstLauncher" then
  	   --Spring.Echo("Disabled Direct Control for ",UnitDefs[i].name," with weapon type",weaponDef.type)
       badUnitDefs[i] = true
      end
	end
  end
end



--------------------------------------------------------------------------------

local function AllowAction(playerID)
  if (playerID ~= 0) then
    Spring.SendMessageToPlayer(playerID, "Must be the host player")
    return false
  end
  if (not Spring.IsCheatingEnabled()) then
    Spring.SendMessageToPlayer(playerID, "Cheating must be enabled")
    return false
  end
  return true
end


local function ChatControl(cmd, line, words, playerID)
  if (AllowAction(playerID)) then
    if (#words == 0) then
      enabled = not enabled
    else
      enabled = (words[1] == '1')
    end
  end
  Spring.Echo('direct unit control is ' ..
              (enabled and 'enabled' or 'disabled'))
  return true
end


--------------------------------------------------------------------------------

function gadget:Initialize()
--  for udid, ud in pairs(UnitDefs) do
--    if ((not ud.customParams.iscommander) and (ud.techLevel < 6)) then
--      badUnitDefs[udid] = ud.humanName
--    end
--  end
  local cmd  = "fpsctrl"
  local help = " [0|1]:  direct unit control blocking"
  gadgetHandler:AddChatAction(cmd, ChatControl, help)
  Script.AddActionFallback(cmd .. ' ', help)
end


function gadget:Shutdown()
  gadgetHandler:RemoveChatAction('fpsctrl')
  Script.RemoveActionFallback('fpsctrl')
end


--------------------------------------------------------------------------------


function gadget:AllowDirectUnitControl(unitID, unitDefID, unitTeam, playerID)
  if (not enabled) then
    return true
  end
  
  if (select(3,Spring.GetPlayerInfo(playerID)) == true) then
    return false
  end
  
  for badUnitDefID in pairs(badUnitDefs) do
    if (badUnitDefID == unitDefID) then
	  Spring.SendMessageToPlayer(playerID,
	    "Direct control of " .. UnitDefs[badUnitDefID].name .. " is disabled")
      return false
    end
  end
  
  return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
