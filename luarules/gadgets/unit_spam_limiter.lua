function gadget:GetInfo()
    return {
        name = "UnitBuildTimeAdjuster",
        desc = "Monitors unit production and adjusts build time based on quantity created",
        author = "[MOL]Silver",
        date = "2023-11-05",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true,
    }
end

local unitLimit = tonumber(Spring.GetModOptions().exp_unitlimit) or 0
local penaltyFactor = tonumber(Spring.GetModOptions().exp_penaltyfactor) or 0.1

if unitLimit == 0 then
    return
end

if gadgetHandler:IsSyncedCode() then
    local spGetUnitDefID = Spring.GetUnitDefID
    local spSetUnitCosts = Spring.SetUnitCosts
    local playerUnitCount = {}
    local buildTimeCache = {}
    local isFactoryCache = {}
    local UnitDefs = UnitDefs
    local UNIT_LIMIT = unitLimit
    local PENALTY_FACTOR = penaltyFactor

    function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
        if builderID then
            local builderDefID = spGetUnitDefID(builderID)
            isFactoryCache[builderDefID] = isFactoryCache[builderDefID] or UnitDefs[builderDefID].isFactory
            if isFactoryCache[builderDefID] then
                local playerData = playerUnitCount[unitTeam] or {}
                playerUnitCount[unitTeam] = playerData
                playerData[unitDefID] = (playerData[unitDefID] or 0) + 1
                local count = playerData[unitDefID]
                if count > UNIT_LIMIT then
                    buildTimeCache[unitDefID] = buildTimeCache[unitDefID] or UnitDefs[unitDefID].buildTime
                    local newBuildTime = buildTimeCache[unitDefID] * (1 + (count - UNIT_LIMIT) * PENALTY_FACTOR)
                    spSetUnitCosts(unitID, {buildTime = newBuildTime})
                end
            end
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
        if playerUnitCount[unitTeam] and playerUnitCount[unitTeam][unitDefID] then
            playerUnitCount[unitTeam][unitDefID] = playerUnitCount[unitTeam][unitDefID] - 1
        end
    end

    function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
        if playerUnitCount[oldTeam] and playerUnitCount[oldTeam][unitDefID] then
            playerUnitCount[oldTeam][unitDefID] = playerUnitCount[oldTeam][unitDefID] - 1
        end
        if playerUnitCount[newTeam] and playerUnitCount[newTeam][unitDefID] then
            playerUnitCount[newTeam][unitDefID] = playerUnitCount[newTeam][unitDefID] + 1
        end
    end

end


