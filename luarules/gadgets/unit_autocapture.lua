function gadget:GetInfo()
    return {
        name = 'Unit Auto Capture',
        desc = 'Manage support for automatically initiate capture',
        author = 'tizbac',
        date = '16.12.2023',
        license = 'GPL',
        layer = 0,
        enabled = true
    }
end

local CMD_AUTOCAPTURE_TOGGLE = 33010
local autocapture_units = {
    [UnitDefNames['rumad_cordyceps'].id] = true,
    [UnitDefNames['corcommando'].id] = true,
    [UnitDefNames['talon_shepherd'].id] = true,
    [UnitDefNames['tllgizmo'].id] = true,
    [UnitDefNames['armrambo'].id] = true,
}
local autocapture_enabled = {}

local spGetUnitCommands = Spring.GetUnitCommands
local spGetUnitPosition = Spring.GetUnitPosition
local spGetUnitAllyTeam = Spring.GetUnitAllyTeam
local spGetUnitsInCylinder = Spring.GetUnitsInCylinder
local spGetUnitIsDead = Spring.GetUnitIsDead
local spGetUnitDefID = Spring.GetUnitDefID
local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local spFindUnitCmdDesc = Spring.FindUnitCmdDesc
local spEditUnitCmdDesc = Spring.EditUnitCmdDesc

if gadgetHandler:IsSyncedCode() then
    function gadget:Initialize()
        gadgetHandler:RegisterCMDID(CMD_AUTOCAPTURE_TOGGLE)
    end

    function gadget:UnitCreated(uID, unitDefID, teamID)
        if autocapture_units[unitDefID] then
            spInsertUnitCmdDesc(uID, {
                id = CMD_AUTOCAPTURE_TOGGLE,
                type = CMDTYPE.ICON_MODE,
                name = 'Autocapture',
                tooltip = 'Capture nearby units automatically',
                params = { '1', 'Autocapture\n     On', 'Autocapture\n    Off'}
            })
            autocapture_enabled[uID] = UnitDefs[unitDefID].buildDistance
        end
    end

    function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
        if autocapture_units[unitDefID] and cmdID == CMD_AUTOCAPTURE_TOGGLE then
            local cmdDescID = spFindUnitCmdDesc(unitID, CMD_AUTOCAPTURE_TOGGLE)
            spEditUnitCmdDesc(unitID, cmdDescID, {
                params = {cmdParams[1], 'Autocapture\n     Off', 'Autocapture\n    On'}
            })
            autocapture_enabled[unitID] = cmdParams[1] == 1 and UnitDefs[unitDefID].buildDistance or nil
        end
    end

    function gadget:UnitDestroyed(unitID)
        autocapture_enabled[unitID] = nil
    end

    function gadget:GameFrame(n)
        if n % 20 == 0 then
            for unitID, dist in pairs(autocapture_enabled) do
                if #spGetUnitCommands(unitID, 5) > 0 and spGetUnitCommands(unitID, 5)[1].id == CMD.CAPTURE then
                    -- Do nothing if already capturing
                else
                    local x, _, z = spGetUnitPosition(unitID)
                    local myAlly = spGetUnitAllyTeam(unitID)
                    local targets = spGetUnitsInCylinder(x, z, dist)
                    for _, target in ipairs(targets) do
                        if spGetUnitAllyTeam(target) ~= myAlly and not spGetUnitIsDead(target) then
                            local targetDefID = spGetUnitDefID(target)
                            if targetDefID and not UnitDefs[targetDefID].canFly then
                                local cmds = spGetUnitCommands(unitID, 5)
                                spGiveOrderToUnit(unitID, CMD.CAPTURE, {target}, {''})
                                for _, cmd in ipairs(cmds) do
                                    spGiveOrderToUnit(unitID, cmd.id, cmd.params, {'shift'})
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end
