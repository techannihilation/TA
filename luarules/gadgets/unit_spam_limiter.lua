function gadget:GetInfo()
    return {
        name = "UnitBuildTimeAdjuster",
        desc = "Monitors unit mass production and adjusts build time",
        author = "[MOL]Silver",
        date = "2023-11-05",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true,
    }
end

if gadgetHandler:IsSyncedCode() then
    local spSetUnitCosts = Spring.SetUnitCosts
    local spGetTeamResources = Spring.GetTeamResources
    local playerUnitCount = {}
    local buildTimeCache = {}
    local UnitDefs = UnitDefs

    function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)

        if builderID then
            local _, _, _, energyIncome = spGetTeamResources(unitTeam, "energy")
            local baseEnergy = 3000
            local maxEnergy = 3000000
            local multiplier  = 0.5
            if energyIncome < baseEnergy then return end

            local playerData = playerUnitCount[unitTeam] or {}
            playerUnitCount[unitTeam] = playerData
            playerData[unitDefID] = (playerData[unitDefID] or 0) + 1

            local count = playerData[unitDefID]
            local penaltyFactor = (energyIncome - baseEnergy) / (maxEnergy - baseEnergy) * multiplier
            buildTimeCache[unitDefID] = buildTimeCache[unitDefID] or UnitDefs[unitDefID].buildTime

            local newBuildTime = buildTimeCache[unitDefID] * (1 + (count * penaltyFactor))
            spSetUnitCosts(unitID, {buildTime = newBuildTime})

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