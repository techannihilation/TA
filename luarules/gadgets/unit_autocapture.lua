function gadget:GetInfo()
    return {
      name      = "Unit Auto Capture",
      desc      = "Manage support for automatically initiate capture",
      author    = "tizbac",
      date      = "",
      license   = "GPL",
      layer     = 0,
      enabled   = true  --  loaded by default?
    }
end

local CMD_AUTOCAPTURE_TOGGLE = 33010

if (not gadgetHandler:IsSyncedCode()) then
  return false
end

local autocapture_units = {
    [UnitDefNames["rumad_cordyceps"].id] = true,
    [UnitDefNames["corcommando"].id] = true,
    [UnitDefNames["talon_shepherd"].id] = true,
    [UnitDefNames["tllgizmo"].id] = true,
}

local autocapture_enabled = {}

local autoCapture = {
    id			= CMD_AUTOCAPTURE_TOGGLE,
    type		= CMDTYPE.ICON_MODE,
    name		= 'Autocapture',
    tooltip     = 'Capture nearby units automatically',
    params  = { '1', 'Autocapture\n     Off', 'Autocapture\n    On'}
}
function gadget:Initialize() 
    gadgetHandler:RegisterCMDID(CMD_AUTOCAPTURE_TOGGLE)
end


function gadget:UnitCreated(uID, unitDefID, teamID) 
    if autocapture_units[unitDefID] ~= nil then
        Spring.InsertUnitCmdDesc(uID, autoCapture)
        local unitDef = UnitDefs[unitDefID] 
        autocapture_enabled[uID] = unitDef.buildDistance
    end
end

function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
    if autocapture_units[unitDefID] ~= nil and cmdID == CMD_AUTOCAPTURE_TOGGLE then
        local unitDef = UnitDefs[unitDefID] 
        local cmdDescID = Spring.FindUnitCmdDesc(unitID, CMD_AUTOCAPTURE_TOGGLE)
        autoCapture.params[1] = cmdParams[1]
        Spring.EditUnitCmdDesc(unitID, cmdDescID, {
            params  = autoCapture.params,
        })
        --Spring.Echo(cmdParams[1].." "..unitDef.buildDistance)
        if cmdParams[1] == 1 then
            autocapture_enabled[unitID] = unitDef.buildDistance
        else
            autocapture_enabled[unitID] = nil
        end
    end
end

function gadget:UnitDestroyed(unitID)
    autocapture_enabled[unitID] = nil
end

function gadget:GameFrame(n)
 if n % 20 == 0 then
    for unitid, dist in pairs(autocapture_enabled) do
        local cmds = Spring.GetUnitCommands(unitid,5)
        if #cmds > 0 and cmds[1].id == CMD.CAPTURE then
            --Spring.Echo("Already capturing")
            
        else
            local x,y,z = Spring.GetUnitPosition(unitid)
            local myally = Spring.GetUnitAllyTeam(unitid)
            --Spring.Echo("Checking "..unitid.." "..x.." "..z.." "..dist)
            local targets = CallAsTeam(Spring.GetUnitTeam(unitid), Spring.GetUnitsInCylinder, x, z, dist)
            for i,target in ipairs(targets) do
                if Spring.GetUnitAllyTeam(target) ~= myally then
                    --Spring.Echo(target)
                      --//copy command queue
                    local cmds = Spring.GetUnitCommands(unitid,5) --only copy last 4 command as first is skipped

                    Spring.GiveOrderToUnit(unitid, CMD.CAPTURE, { target}, {""})
                    for i = 1, #cmds do  -- skip the first command (CMD_MORPH)
                        local cmd = cmds[i]
                        Spring.GiveOrderToUnit(unitid, cmd.id, cmd.params, {"shift"})
                    end

                    break -- Only queue ONE capture command
                end
            end
        end
    end
 end
end