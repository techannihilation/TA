function gadget:GetInfo()
    return {
        name = "UnitBuildTimeAdjuster",
        desc = "Monitors unit production and adjusts build time based on quantity created and team resources",
        author = "[MOL]Silver",
        date = "2023-11-05",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true,
    }
end

if gadgetHandler:IsSyncedCode() then
    local spGetUnitDefID = Spring.GetUnitDefID
    local spSetUnitCosts = Spring.SetUnitCosts
    local spGetTeamResources = Spring.GetTeamResources
    local math_smoothstep = math.smoothstep
    local playerUnitCount = {}
    local buildTimeCache = {}
    local isFactoryCache = {}
    local UnitDefs = UnitDefs
    local unitThreshhold = 10

    function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
        if builderID then
            local builderDefID = spGetUnitDefID(builderID)
            isFactoryCache[builderDefID] = isFactoryCache[builderDefID] or UnitDefs[builderDefID].isFactory
            if isFactoryCache[builderDefID] then
                local playerData = playerUnitCount[unitTeam] or {}
                playerUnitCount[unitTeam] = playerData
                playerData[unitDefID] = (playerData[unitDefID] or 0) + 1
                local count = playerData[unitDefID]
                if count > unitThreshhold then
                    local _, _, _, energyIncome = spGetTeamResources(unitTeam, "energy")
                    local baseEnergy = 15000
                    local maxEnergy = 3000000
                    local penaltyMultiplayer = 1.5
                    if energyIncome < baseEnergy then return end
                    local penaltyFactor = math_smoothstep(baseEnergy, maxEnergy, energyIncome) * penaltyMultiplayer
                    buildTimeCache[unitDefID] = buildTimeCache[unitDefID] or UnitDefs[unitDefID].buildTime
                    local newBuildTime = buildTimeCache[unitDefID] * (1 + ((count - unitThreshhold) * penaltyFactor) )
                    spSetUnitCosts(unitID, {buildTime = newBuildTime})
                    --Spring.Echo(newBuildTime,penaltyFactor,count)
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
