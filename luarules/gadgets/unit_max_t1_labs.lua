function gadget:GetInfo()
    return {
        name = "Tech Level 1 Lab Limit",
        desc = "Limits construction of T1 labs",
        author = "Silver",
        version = "1.3",
        date = "2024",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true
    }
end

--------------------------------------------------------------------------------
-- SPEEDUPS
--------------------------------------------------------------------------------
local SendMessageToTeam = Spring.SendMessageToTeam
local GetUnitDefID = Spring.GetUnitDefID
local GetTeamUnits = Spring.GetTeamUnits
local GetTeamList = Spring.GetTeamList
local UnitDefs = UnitDefs  -- Alias for better readability
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
local maxLabsPerType = 3  -- Maximum number of T1 labs per unitDefID
local TeamLabsNb = {}  -- Stores the number of T1 labs for each team and unitDefID
local color = "\255\255\64\64"

-- Pattern matching various "tech level 1" variants
-- Matches fragments like "tech level 1", "techlevel1", "tech level1", "tech1"
local techLevel1Pattern = "tech%s*level?%s*1"

--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------

-- Function to check if the unit's description matches the T1 lab pattern
local function isTechLevel1(description)
    if not description then
        return false
    end
    local descLower = string.lower(description)
    return string.find(descLower, techLevel1Pattern) ~= nil
end

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
    --------------------------------------------------------------------------------
    -- BEGIN SYNCED
    --------------------------------------------------------------------------------

    function gadget:Initialize()
        for _, teamID in ipairs(GetTeamList()) do
            TeamLabsNb[teamID] = {}
            local allTeamUnits = GetTeamUnits(teamID)
            for i = 1, #allTeamUnits do
                local unitID = allTeamUnits[i]
                local unitDefID = GetUnitDefID(unitID)
                local unitDef = UnitDefs[unitDefID]
                if unitDef and isTechLevel1(unitDef.description) then
                    TeamLabsNb[teamID][unitDefID] = (TeamLabsNb[teamID][unitDefID] or 0) + 1
                end
            end
        end
    end

    function gadget:UnitCreated(unitID, unitDefID, unitTeam)
        local unitDef = UnitDefs[unitDefID]
        if unitDef and isTechLevel1(unitDef.description) then
            TeamLabsNb[unitTeam][unitDefID] = (TeamLabsNb[unitTeam][unitDefID] or 0) + 1
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
        local unitDef = UnitDefs[unitDefID]
        if unitDef and isTechLevel1(unitDef.description) then
            TeamLabsNb[unitTeam][unitDefID] = (TeamLabsNb[unitTeam][unitDefID] or 1) - 1
            if TeamLabsNb[unitTeam][unitDefID] < 0 then
                TeamLabsNb[unitTeam][unitDefID] = 0
            end
        end
    end

    function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
        local unitDef = UnitDefs[unitDefID]
        if unitDef and isTechLevel1(unitDef.description) then
            TeamLabsNb[oldTeam][unitDefID] = (TeamLabsNb[oldTeam][unitDefID] or 1) - 1
            if TeamLabsNb[oldTeam][unitDefID] < 0 then
                TeamLabsNb[oldTeam][unitDefID] = 0
            end
            TeamLabsNb[newTeam][unitDefID] = (TeamLabsNb[newTeam][unitDefID] or 0) + 1
        end
    end

    function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z, facing)
        local unitDef = UnitDefs[unitDefID]
        if unitDef and isTechLevel1(unitDef.description) then
            local currentCount = TeamLabsNb[builderTeam][unitDefID] or 0
            if currentCount >= maxLabsPerType then
                SendMessageToTeam(builderTeam, color .. "Warning: Can't build more " .. unitDef.name .. ", limit of " .. maxLabsPerType .. " reached for this lab type.")
                return false
            end
        end
        return true
    end

    function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
        local unitDef = UnitDefs[unitDefID]
        if unitDef and isTechLevel1(unitDef.description) then
            local currentCountNewTeam = TeamLabsNb[newTeam][unitDefID] or 0
            if currentCountNewTeam >= maxLabsPerType then
                SendMessageToTeam(oldTeam, color .. "Warning: Can't transfer " .. unitDef.name .. ", limit of " .. maxLabsPerType .. " reached for team " .. newTeam .. ".")
                return false
            end
        end
        return true
    end

    --------------------------------------------------------------------------------
    -- END SYNCED
    --------------------------------------------------------------------------------
else
    --------------------------------------------------------------------------------
    -- BEGIN UNSYNCED
    --------------------------------------------------------------------------------
    -- (No changes in the unsynced part)
    --------------------------------------------------------------------------------
    -- END UNSYNCED
    --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-- END UNSYNCED
--------------------------------------------------------------------------------
