function widget:GetInfo()
    return {
        name      = "Auto Cloak Popups",
        desc      = "Auto cloaks Pit Bull and Ambusher",
        author    = "[teh]decay aka [teh]undertaker",
        date      = "29 dec 2013",
        license   = "The BSD License",
        layer     = 0,
        enabled   = false  -- loaded by default
    }
end

local CMD_CLOAK = 37382

local clockingUnitDefs = {
    [UnitDefNames["armamb"].id]=true,
    [UnitDefNames["armjamt"].id]=true,
    [UnitDefNames["armpb"].id]=true,
    [UnitDefNames["packo"].id]=true
    }

local cloakunits = {}

function widget:UnitFinished(unitID, unitDefID, unitTeam)
    if clockingUnitDefs[unitDefID] then
        cloakunits[unitID] = true
        Spring.GiveOrderToUnit(unitID, CMD_CLOAK, {1}, {})
    end
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam)
    if cloakunits[unitID] then
        cloakunits[unitID] = nil
    end
end

function widget:UnitCreated(unitID, unitDefID, teamID, builderID)
    if clockingUnitDefs[unitDefID] then
        cloakunits[unitID] = true
        Spring.GiveOrderToUnit(unitID, CMD_CLOAK, {1}, {})
    end
end

function widget:UnitTaken(unitID, unitDefID, unitTeam, newTeam)
    if clockingUnitDefs[unitDefID] then
        cloakunits[unitID] = true
        Spring.GiveOrderToUnit(unitID, CMD_CLOAK, {1}, {})
    end
end

function widget:UnitGiven(unitID, unitDefID, unitTeam, oldTeam)
    if clockingUnitDefs[unitDefID] then
        cloakunits[unitID] = true
        Spring.GiveOrderToUnit(unitID, CMD_CLOAK, {1}, {})
    end
end

function widget:PlayerChanged(playerID)
    if Spring.GetGameFrame() > 0 and Spring.GetSpectatingState() then
        widgetHandler:RemoveWidget(self)
    end
end

function widget:Initialize()
    widget:PlayerChanged()
end