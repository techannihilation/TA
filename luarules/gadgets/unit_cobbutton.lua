--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

function gadget:GetInfo()
  return {
    name      = "CobButton",
    desc      = "Easy cob button Creation",
    author    = "quantum",
    date      = "June 28, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = -10,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--  Proposed Command ID Ranges:
--
--    all negative:  Engine (build commands)
--       0 -   999:  Engine
--    1000 -  9999:  Group AI
--   10000 - 19999:  LuaUI
--   20000 - 29999:  LuaCob
--   30000 - 39999:  LuaRules
--

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local Spring, ipairs, pairs = Spring, ipairs, pairs
local SetUnitRulesParam, GetUnitRulesParam = Spring.SetUnitRulesParam, Spring.GetUnitRulesParam

local ShieldUnits = {
  --Core
  [UnitDefNames["corcom1"].id] = true,
  [UnitDefNames["corcom2"].id] = true,
  [UnitDefNames["corcom3"].id] = true,
  [UnitDefNames["corgate"].id] = true,
  [UnitDefNames["corgate1"].id] = true,
  [UnitDefNames["corgate2"].id] = true,
  [UnitDefNames["corgate3"].id] = true,
  [UnitDefNames["corgate4"].id] = true,
  [UnitDefNames["corflshd"].id] = true,
  [UnitDefNames["corfgate1"].id] = true,
  [UnitDefNames["corshieldgen"].id] = true,
  [UnitDefNames["cormonkeylord"].id] = true,
  [UnitDefNames["corcrab"].id] = true,
  [UnitDefNames["corsingularity"].id] = true,
  --Arm
  [UnitDefNames["armcom1"].id] = true,
  [UnitDefNames["armcom2"].id] = true,
  [UnitDefNames["armcom3"].id] = true,
  [UnitDefNames["armgate"].id] = true,
  [UnitDefNames["armgate1"].id] = true,
  [UnitDefNames["armgate2"].id] = true,
  [UnitDefNames["armgate3"].id] = true,
  [UnitDefNames["armgate4"].id] = true,
  [UnitDefNames["armflosh"].id] = true,
  [UnitDefNames["armfgate1"].id] = true,
  [UnitDefNames["armpraet"].id] = true,
  [UnitDefNames["armorco"].id] = true,
  [UnitDefNames["armexo"].id] = true,
  [UnitDefNames["armbeetle"].id] = true,
  [UnitDefNames["armshieldgen"].id] = true,
  [UnitDefNames["armvengence"].id] = true,
  --The lost legacy
  [UnitDefNames["tllcom1"].id] = true,
  [UnitDefNames["tllcom2"].id] = true,
  [UnitDefNames["tllcom3"].id] = true,
  [UnitDefNames["tllgate"].id] = true,
  [UnitDefNames["tllfgate"].id] = true,
  [UnitDefNames["tllfgate1"].id] = true,
  [UnitDefNames["tllgate1"].id] = true,
  [UnitDefNames["tllgate2"].id] = true,
  [UnitDefNames["tllgate3"].id] = true,
  [UnitDefNames["tllgate4"].id] = true,
  [UnitDefNames["tllirritator"].id] = true,
  [UnitDefNames["tllgorgon"].id] = true,
  [UnitDefNames["tllmako"].id] = true,
  --Talon
  [UnitDefNames["talon_com1"].id] = true,
  [UnitDefNames["talon_com2"].id] = true,
  [UnitDefNames["talon_com3"].id] = true,
  [UnitDefNames["talon_gate"].id] = true,
  [UnitDefNames["talon_gate1"].id] = true,
  [UnitDefNames["talon_gate2"].id] = true,
  [UnitDefNames["talon_gate3"].id] = true,
  [UnitDefNames["talon_gate4"].id] = true,
  [UnitDefNames["talon_fgate"].id] = true,
  [UnitDefNames["talon_fgate1"].id] = true,
  [UnitDefNames["talon_obelisk"].id] = true,
  [UnitDefNames["talon_pyramid"].id] = true,
  [UnitDefNames["talon_boxer"].id] = true,
  [UnitDefNames["talon_mythril"].id] = true,
  [UnitDefNames["talon_repentance"].id] = true,
  [UnitDefNames["talon_shieldgen"].id] = true,
  [UnitDefNames["talon_seth"].id] = true,
  --Gok
  [UnitDefNames["gok_com1"].id] = true,
  [UnitDefNames["gok_com2"].id] = true,
  [UnitDefNames["gok_com3"].id] = true,
  [UnitDefNames["gok_gate"].id] = true,
  [UnitDefNames["gok_gate1"].id] = true,
  [UnitDefNames["gok_gate2"].id] = true,
  [UnitDefNames["gok_gate3"].id] = true,
  [UnitDefNames["gok_gate4"].id] = true,
  [UnitDefNames["gok_fgate"].id] = true,
  [UnitDefNames["gok_fgate1"].id] = true,
  [UnitDefNames["gok_bats"].id] = true,
  [UnitDefNames["gok_valefor"].id] = true,
  [UnitDefNames["gok_satan"].id] = true,
  [UnitDefNames["gok_slanesh"].id] = true,
  [UnitDefNames["gok_antichrist"].id] = true,
  [UnitDefNames["gok_archon"].id] = true,
  [UnitDefNames["gok_darkarchonte"].id] = true,
  [UnitDefNames["gok_eck"].id] = true,
  [UnitDefNames["gok_ucp"].id] = true,
  [UnitDefNames["gok_azaroth"].id] = true,
  --Rumad
  [UnitDefNames["rumad_king1"].id] = true,
  [UnitDefNames["rumad_king2"].id] = true,
  [UnitDefNames["rumad_king3"].id] = true,
  [UnitDefNames["rumad_gala"].id] = true,
  [UnitDefNames["rumad_mcv2"].id] = true,

}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local reloads = {}

local buttonDefs = VFS.Include"LuaRules/Configs/cob_buttons.lua"

local buttons = {}
local cmdOffset = 0
for unit, cmds in pairs(buttonDefs) do
  for i, cmd in ipairs(cmds) do
    cmd.id = 34520 + cmdOffset
    cmdOffset = cmdOffset + 1
    buttons[cmd.id] = cmd
    cmd.unit = unit
    cmd.buttonIndex = i
    cmd.name = cmd.name or cmd.cob
    cmd.cmdDesc = {
      id      = cmd.id,
      name    = cmd.name or cmd.cob,
      action  = string.lower(cmd.name),
      type    = cmd.type or CMDTYPE.ICON,
      tooltip = cmd.tooltip,
      params  = cmd.params,
    }
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
  for cmdID in pairs(buttons) do
    gadgetHandler:RegisterCMDID(cmdID)
  end
  for _, unitID in ipairs(Spring.GetAllUnits()) do
    gadget:UnitCreated(unitID, Spring.GetUnitDefID(unitID))
  end
end


function gadget:UnitCreated(unitID, unitDefID)
  local name = UnitDefs[unitDefID].name
  if (buttonDefs[name]) then
    for i, button in ipairs(buttonDefs[name]) do
      Spring.InsertUnitCmdDesc(unitID, button.position or 500, button.cmdDesc)
    end
    reloads[unitID] = {}
  end
end


function gadget:Shutdown()
  for _, unitID in ipairs(Spring.GetAllUnits()) do
    for cmdID in pairs(buttons) do
      local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmdID)
      if (cmdDescID) then
        Spring.RemoveUnitCmdDesc(unitID, cmdDescID)
      end
    end
  end
end


function gadget:GameFrame(n)
  local s = n/30
  for unitID, unitButtons in pairs(reloads) do

    local status,udfid = pcall(Spring.GetUnitDefID,unitID)
    if (not status) then
      reloads[unitID] = nil
    else
      local unitName = UnitDefs[udfid].name

      for buttonIndex, status in pairs(unitButtons) do
        local reload  = status[1]
        local expired = status[2]
        local cmd = buttonDefs[unitName][buttonIndex]
        local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmd.id)
        if (cmdDescID) then
          local cmdArray
          if (cmd.duration and
              s - reload > cmd.duration and
              s - reload < cmd.reload) then
            if (cmd.endcob and not expired) then
              Spring.CallCOBScript(unitID, cmd.endcob, 0)
              status[2] = true
            end
            local progress = (s-reload-cmd.duration) / (cmd.reload-cmd.duration) * 100
            local text = string.format("%d%%", progress)
            cmdArray = {name = text, disabled = true}
          elseif (s - reload < cmd.reload) then
            local progress = (s-reload) / (cmd.duration) * 100
            local text = string.format("%d%%", progress)
            cmdArray = {name = text, disabled = true}
          else
            if (not cmd.duration) then
              Spring.CallCOBScript(unitID, cmd.endcob, 0)
            end
            cmdArray = {name = cmd.name, disabled = false}
            unitButtons[buttonIndex] = nil
          end
          Spring.EditUnitCmdDesc(unitID, cmdDescID, cmdArray)
    end
      end
      if (not next(unitButtons)) then
        reloads[unitID] = nil
      end
    end

  end
end


function gadget:UnitDestroyed(unitID)
  reloads[unitID] = nil
end


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if (buttons[cmdID] and buttonDefs[UnitDefs[unitDefID].name] and buttons[cmdID].name==buttonDefs[UnitDefs[unitDefID].name][1].name) then
    local cmd = buttons[cmdID]
  if (cmd.reload) then
      reloads[unitID] = reloads[unitID] or {}
      if (not reloads[unitID][cmd.buttonIndex]) then
        reloads[unitID][cmd.buttonIndex] = {Spring.GetGameSeconds()}
        Spring.CallCOBScript(unitID, cmd.cob, 0)
      end
    else
      Spring.CallCOBScript(unitID, cmd.cob, 0)
      if ShieldUnits[unitDefID] then
        if cmdParams[1] == 1 then
          Spring.SetUnitRulesParam(unitID, "nolupsdraw",0)
        else
          Spring.SetUnitRulesParam(unitID, "nolupsdraw",1)
        end
      end
    end
    local cmdDescID = Spring.FindUnitCmdDesc(unitID, cmdID)
  if (cmdDescID and cmd.params) then
    cmd.params[1] = cmdParams[1]
    Spring.EditUnitCmdDesc(unitID, cmdDescID, {params=cmd.params})
  end
    return false  -- command was used
  end
  return true  -- command was not used
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
