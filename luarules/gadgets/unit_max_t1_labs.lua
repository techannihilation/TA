function gadget:GetInfo()
    return {
        name = "Tech Level 1 Lab Limit",
        desc = "Limits construction of T1 labs",
        author = "Silver",
        version = "1.6",
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
local limitedUnitDefIDs = {}  -- Set of unitDefIDs that should be limited
local unitDefNames = {}  -- Stores the name of limited units for messaging
local color = "\255\255\64\64"

-- This pattern matches different variations of the terms "t1", "tech1", "tech 1", or "tech level 1".
local techLevel1Pattern = "t?e?c?h?%s?l?e?v?e?l?%s?1"
--------------------------------------------------------------------------------
-- HELPER FUNCTIONS
--------------------------------------------------------------------------------

-- Function to determine if a unit should be limited based on its description and building status
local function determineLimit(unitDef)

    if not unitDef.isBuilding or not unitDef.isBuilder then
        return false -- Exclude non-building units and units that cannot build
    end

    if not unitDef.description then
        return false
    end

    local descLower = string.lower(unitDef.description)
    return string.find(descLower, techLevel1Pattern) ~= nil
end

--------------------------------------------------------------------------------
-- START OF CODE
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
    --------------------------------------------------------------------------------
    -- BEGIN SYNCED
    --------------------------------------------------------------------------------

    --------------------------------------------------------------------------------
    -- CACHE LIMITED UNITDEFS
    --------------------------------------------------------------------------------
    local function PreCacheLimitedUnitDefs()
        for unitDefID, unitDef in pairs(UnitDefs) do
            if determineLimit(unitDef) then
                limitedUnitDefIDs[unitDefID] = true
                unitDefNames[unitDefID] = unitDef.name  -- Store only the name for messaging
            end
        end
    end

    --------------------------------------------------------------------------------
    -- INITIALIZATION FUNCTION
    --------------------------------------------------------------------------------
    function gadget:Initialize()
        PreCacheLimitedUnitDefs()  -- Pre-cache limited unitDefs

        local teamList = GetTeamList()  -- Cache the team list
        for _, teamID in ipairs(teamList) do
            TeamLabsNb[teamID] = {}
            local allTeamUnits = GetTeamUnits(teamID)
            local teamLabs = TeamLabsNb[teamID]  -- Local reference to team labs table
            for i = 1, #allTeamUnits do
                local unitID = allTeamUnits[i]
                local unitDefID = GetUnitDefID(unitID)
                if limitedUnitDefIDs[unitDefID] then
                    teamLabs[unitDefID] = (teamLabs[unitDefID] or 0) + 1
                end
            end
        end
    end

    --------------------------------------------------------------------------------
    -- PRECOMPUTE COMMON VALUES
    --------------------------------------------------------------------------------
    local warningMessageTemplate = "Warning: Can't build more %s, limit of %d reached for this lab type."
    local transferWarningMessageTemplate = "Warning: Can't transfer %s, limit of %d reached for team %d."

    --------------------------------------------------------------------------------
    -- UNIT CREATED CALLBACK
    --------------------------------------------------------------------------------
    function gadget:UnitCreated(unitID, unitDefID, unitTeam)
        if limitedUnitDefIDs[unitDefID] then
            local teamLabs = TeamLabsNb[unitTeam]
            teamLabs[unitDefID] = (teamLabs[unitDefID] or 0) + 1
        end
    end

    --------------------------------------------------------------------------------
    -- UNIT DESTROYED CALLBACK
    --------------------------------------------------------------------------------
    function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
        if limitedUnitDefIDs[unitDefID] then
            local teamLabs = TeamLabsNb[unitTeam]
            teamLabs[unitDefID] = (teamLabs[unitDefID] or 1) - 1
            if teamLabs[unitDefID] < 0 then
                teamLabs[unitDefID] = 0
            end
        end
    end

    --------------------------------------------------------------------------------
    -- UNIT GIVEN CALLBACK
    --------------------------------------------------------------------------------
    function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
        if limitedUnitDefIDs[unitDefID] then
            -- Decrement old team count
            local oldTeamLabs = TeamLabsNb[oldTeam]
            oldTeamLabs[unitDefID] = (oldTeamLabs[unitDefID] or 1) - 1
            if oldTeamLabs[unitDefID] < 0 then
                oldTeamLabs[unitDefID] = 0
            end
            -- Increment new team count
            local newTeamLabs = TeamLabsNb[newTeam]
            newTeamLabs[unitDefID] = (newTeamLabs[unitDefID] or 0) + 1
        end
    end

    --------------------------------------------------------------------------------
    -- ALLOW UNIT CREATION CALLBACK
    --------------------------------------------------------------------------------
    function gadget:AllowUnitCreation(unitDefID, builderID, builderTeam, x, y, z, facing)
        if limitedUnitDefIDs[unitDefID] then
            local teamLabs = TeamLabsNb[builderTeam]
            local currentCount = teamLabs[unitDefID] or 0
            if currentCount >= maxLabsPerType then
                local unitName = unitDefNames[unitDefID] or "Unknown Unit"
                local message = string.format(warningMessageTemplate, unitName, maxLabsPerType)
                SendMessageToTeam(builderTeam, color .. message)
                return false
            end
        end
        return true
    end

    --------------------------------------------------------------------------------
    -- ALLOW UNIT TRANSFER CALLBACK
    --------------------------------------------------------------------------------
    function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
        if limitedUnitDefIDs[unitDefID] then
            local newTeamLabs = TeamLabsNb[newTeam]
            local currentCountNewTeam = newTeamLabs[unitDefID] or 0
            if currentCountNewTeam >= maxLabsPerType then
                local unitName = unitDefNames[unitDefID] or "Unknown Unit"
                local message = string.format(transferWarningMessageTemplate, unitName, maxLabsPerType, newTeam)
                SendMessageToTeam(oldTeam, color .. message)
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
