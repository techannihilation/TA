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
    desc      = "Provides host-only LuaRules development commands",
    author    = "Codex",
    date      = "2026-06-28",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if not gadgetHandler:IsSyncedCode() then
  return false
end

local spGetAllUnits = Spring.GetAllUnits
local spGetAllFeatures = Spring.GetAllFeatures
local spGetFeatureDefID = Spring.GetFeatureDefID
local spGetFeatureHealth = Spring.GetFeatureHealth
local spGetUnitHealth = Spring.GetUnitHealth
local spGetUnitStockpile = Spring.GetUnitStockpile
local spDestroyFeature = Spring.DestroyFeature
local spAddFeatureDamage = Spring.AddFeatureDamage
local spIsCheatingEnabled = Spring.IsCheatingEnabled
local spSendMessageToPlayer = Spring.SendMessageToPlayer
local spSetUnitHealth = Spring.SetUnitHealth
local spSetUnitStockpile = Spring.SetUnitStockpile

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

  gadgetHandler:AddChatAction("halfhealth", HalfHealth, " : gives all units half health (requires cheating)")
  gadgetHandler:AddChatAction("loadmissiles", LoadMissiles, " : loads stockpile weapons (requires cheating)")
  gadgetHandler:AddChatAction("clearwrecks", ClearWrecks, " : removes all wrecks and heaps (requires cheating)")
  gadgetHandler:AddChatAction("reducewrecks", ReduceWrecks, " : reduces all wrecks and heaps (requires cheating)")
  Script.AddActionFallback("halfhealth ", " : gives all units half health (requires cheating)")
  Script.AddActionFallback("loadmissiles ", " : loads stockpile weapons (requires cheating)")
  Script.AddActionFallback("clearwrecks ", " : removes all wrecks and heaps (requires cheating)")
  Script.AddActionFallback("reducewrecks ", " : reduces all wrecks and heaps (requires cheating)")
end

function gadget:Shutdown()
  gadgetHandler:RemoveChatAction("halfhealth")
  gadgetHandler:RemoveChatAction("loadmissiles")
  gadgetHandler:RemoveChatAction("clearwrecks")
  gadgetHandler:RemoveChatAction("reducewrecks")
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
