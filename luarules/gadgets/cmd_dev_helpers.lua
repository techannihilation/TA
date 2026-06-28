--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    cmd_dev_helpers.lua
--  brief:   small host-only cheat helper commands
--  author:  Codex
--
--  Copyright (C) 2026.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Dev Helper Commands",
    desc      = "Provides halfhealth and loadmissiles LuaRules commands",
    author    = "Codex",
    date      = "2026-06-28",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local spGetAllUnits = Spring.GetAllUnits
local spGetAllFeatures = Spring.GetAllFeatures
local spGetFeatureDefID = Spring.GetFeatureDefID
local spGetFeatureHealth = Spring.GetFeatureHealth
local spGetMyPlayerID = Spring.GetMyPlayerID
local spGetSelectedUnits = Spring.GetSelectedUnits
local spGetUnitDefID = Spring.GetUnitDefID
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitHeading = Spring.GetUnitHeading
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitStockpile = Spring.GetUnitStockpile
local spGetUnitTeam = Spring.GetUnitTeam
local spDestroyFeature = Spring.DestroyFeature
local spDestroyUnit = Spring.DestroyUnit
local spCreateFeature = Spring.CreateFeature
local spAddFeatureDamage = Spring.AddFeatureDamage
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spSendMessageToPlayer = Spring.SendMessageToPlayer
local spSendLuaRulesMsg = Spring.SendLuaRulesMsg
local spSetUnitHealth = Spring.SetUnitHealth
local spSetUnitStockpile = Spring.SetUnitStockpile

local PACKET_HEADER = "dev_helpers:"
local SendWreckUnits

local function AllowAction(playerID)
  if (playerID ~= 0) then
    spSendMessageToPlayer(playerID, "Must be the host player")
    return false
  end
  if (not spIsCheatingEnabled()) then
    spSendMessageToPlayer(playerID, "Cheating must be enabled")
    return false
  end
  return true
end

local function HalfHealth(cmd, line, words, playerID)
  if (not AllowAction(playerID)) then
    return true
  end
  for _, unitID in pairs(spGetAllUnits()) do
    local health = spGetUnitHealth(unitID)
    if health and health > 0 then
      spSetUnitHealth(unitID, health * 0.5)
    end
  end
  return true
end

local function LoadMissiles(cmd, line, words, playerID)
  if (not AllowAction(playerID)) then
    return true
  end
  for _, unitID in pairs(spGetAllUnits()) do
    local stockpiled, queued = spGetUnitStockpile(unitID)
    if stockpiled then
      spSetUnitStockpile(unitID, math.max(5, stockpiled, queued or 0), 1)
    end
  end
  return true
end

local function isWreckOrHeap(featureDef)
  if not featureDef then
    return false
  end
  local customParams = featureDef.customParams or {}
  return customParams.category == "corpses" or customParams.category == "heaps" or customParams.fromunit ~= nil
end

local function WreckUnit(unitID)
  local unitDefID = spGetUnitDefID(unitID)
  local unitDef = unitDefID and UnitDefs[unitDefID]
  if not unitDef then
    return
  end
  local x, y, z = spGetUnitPosition(unitID)
  if not x or not z then
    return
  end
  local heading = spGetUnitHeading(unitID)
  local teamID = spGetUnitTeam(unitID)
  spDestroyUnit(unitID, false, true)
  if unitDef.corpse and FeatureDefNames and FeatureDefNames[unitDef.corpse] then
    spCreateFeature(FeatureDefNames[unitDef.corpse].id, x, y, z, heading, teamID)
  end
end

local function ExecuteWreckUnits(cmd, line, words, playerID)
  if (not AllowAction(playerID)) then
    return true
  end
  for i = 2, #words do
    local unitID = tonumber(words[i])
    if unitID then
      WreckUnit(unitID)
    end
  end
  return true
end

local function ClearWrecks(cmd, line, words, playerID)
  if (not AllowAction(playerID)) then
    return true
  end
  for _, featureID in pairs(spGetAllFeatures()) do
    local featureDefID = spGetFeatureDefID(featureID)
    if featureDefID and isWreckOrHeap(FeatureDefs[featureDefID]) then
      spDestroyFeature(featureID)
    end
  end
  return true
end

local function ReduceWrecks(cmd, line, words, playerID)
  if (not AllowAction(playerID)) then
    return true
  end
  for _, featureID in pairs(spGetAllFeatures()) do
    local featureDefID = spGetFeatureDefID(featureID)
    if featureDefID and isWreckOrHeap(FeatureDefs[featureDefID]) then
      local health = spGetFeatureHealth(featureID)
      if health and health > 0 then
        spAddFeatureDamage(featureID, health)
      end
    end
  end
  return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
  if (Script.GetName() ~= "LuaRules") then
    gadgetHandler:RemoveGadget()
    return
  end

  if gadgetHandler:IsSyncedCode() then
    gadgetHandler:AddChatAction("halfhealth", HalfHealth, " : gives all units half health (requires cheating)")
    gadgetHandler:AddChatAction("loadmissiles", LoadMissiles, " : loads stockpile weapons (requires cheating)")
    gadgetHandler:AddChatAction("clearwrecks", ClearWrecks, " : removes all wrecks and heaps (requires cheating)")
    gadgetHandler:AddChatAction("reducewrecks", ReduceWrecks, " : reduces all wrecks and heaps (requires cheating)")
    Script.AddActionFallback("halfhealth ", " : gives all units half health (requires cheating)")
    Script.AddActionFallback("loadmissiles ", " : loads stockpile weapons (requires cheating)")
    Script.AddActionFallback("clearwrecks ", " : removes all wrecks and heaps (requires cheating)")
    Script.AddActionFallback("reducewrecks ", " : reduces all wrecks and heaps (requires cheating)")
  else
    gadgetHandler:AddChatAction("wreckunits", SendWreckUnits, " : turns selected units into wrecks (requires cheating)")
  end
end

function gadget:Shutdown()
  if gadgetHandler:IsSyncedCode() then
    gadgetHandler:RemoveChatAction("halfhealth")
    gadgetHandler:RemoveChatAction("loadmissiles")
    gadgetHandler:RemoveChatAction("clearwrecks")
    gadgetHandler:RemoveChatAction("reducewrecks")
  else
    gadgetHandler:RemoveChatAction("wreckunits")
  end
end

function gadget:RecvLuaMsg(msg, playerID)
  if not gadgetHandler:IsSyncedCode() or string.sub(msg, 1, string.len(PACKET_HEADER)) ~= PACKET_HEADER then
    return false
  end
  local words = {}
  for word in string.sub(msg, string.len(PACKET_HEADER) + 1):gmatch("[%-_%w]+") do
    words[#words + 1] = word
  end
  if words[1] == "wreckunits" then
    return ExecuteWreckUnits(nil, nil, words, playerID)
  end
  return false
end

SendWreckUnits = function(cmd, line, words, playerID)
  if gadgetHandler:IsSyncedCode() then
    return false
  end
  if playerID ~= spGetMyPlayerID() then
    return true
  end
  local units = spGetSelectedUnits()
  if not units or #units == 0 then
    return true
  end
  local msg = PACKET_HEADER .. "wreckunits"
  for i = 1, #units do
    msg = msg .. " " .. tostring(units[i])
  end
  spSendLuaRulesMsg(msg)
  return true
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
