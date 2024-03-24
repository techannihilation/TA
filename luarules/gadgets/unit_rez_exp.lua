function gadget:GetInfo()
    return {
        name    = "Rez Exp",
        desc    = "Restores experience upon resurrection",
        author  = "BD",
        date    = "-",
        version = 1,
        license = "WTFPL",
        layer   = -math.huge,
        enabled = true,
    }
end

if not gadgetHandler:IsSyncedCode() then return false end

local distThreshold    = 2
local rezFrameDistance = 2

-- Pre-cached Spring functions for efficiency.
local SpGetUnitPosition    = Spring.GetUnitPosition
local SpGetFeaturePosition = Spring.GetFeaturePosition
local SpGetFeatureDefID    = Spring.GetFeatureDefID
local SpGetUnitDefID       = Spring.GetUnitDefID
local SpGetUnitExperience  = Spring.GetUnitExperience
local SpSetUnitExperience  = Spring.SetUnitExperience
local SpGetGameFrame       = Spring.GetGameFrame

local wreckInfos = {}
local deadUnits  = {}
local rezzedUnits = {}

local function SquareDistance(posA, posB)
    return (posA[1] - posB[1])^2 + (posA[3] - posB[3])^2
end

function gadget:UnitDestroyed(unitID, unitDefID)
    local wreckName = UnitDefs[unitDefID].wreckName
    if not wreckName then return end

    local wreckDefID = FeatureDefNames[wreckName] and FeatureDefNames[wreckName].id
    if not wreckDefID then return end

    local wreckFrame = SpGetGameFrame() + rezFrameDistance
    deadUnits[wreckFrame] = deadUnits[wreckFrame] or {}
    local frameWrecks = deadUnits[wreckFrame]

    frameWrecks[wreckDefID] = frameWrecks[wreckDefID] or {}
    table.insert(frameWrecks[wreckDefID], {
        location = {SpGetUnitPosition(unitID)},
        experience = SpGetUnitExperience(unitID),
        unitDefID = unitDefID,
    })
end

function gadget:FeatureCreated(featureID)
    local currentFrame = SpGetGameFrame()
    local featureList = deadUnits[currentFrame]
    if not featureList then return end

    local featureDefID = SpGetFeatureDefID(featureID)
    local wreckList = featureList[featureDefID]
    if not wreckList then return end

    local featurePos = {SpGetFeaturePosition(featureID)}
    for _, wreckInfo in ipairs(wreckList) do
        if SquareDistance(wreckInfo.location, featurePos) < distThreshold then
            wreckInfos[featureID] = {
                experience = wreckInfo.experience,
                unitDefID = wreckInfo.unitDefID,
            }
            return -- Wreck matched and processed.
        end
    end
end

function gadget:UnitCreated(unitID, unitDefID, _, builderID)
    if not builderID or not UnitDefs[SpGetUnitDefID(builderID)].canResurrect then return end

    rezzedUnits[unitDefID] = rezzedUnits[unitDefID] or {}
    rezzedUnits[unitDefID][unitID] = {SpGetUnitPosition(unitID)}
end

function gadget:FeatureDestroyed(featureID)
    local wreckInfo = wreckInfos[featureID]
    wreckInfos[featureID] = nil -- Immediately remove to prevent double processing.
    if not wreckInfo then return end

    local rezzedList = rezzedUnits[wreckInfo.unitDefID]
    if not rezzedList then return end

    local wreckLocation = {SpGetFeaturePosition(featureID)}
    for unitID, unitPos in pairs(rezzedList) do
        if SquareDistance(unitPos, wreckLocation) < distThreshold then
            SpSetUnitExperience(unitID, wreckInfo.experience)
            rezzedUnits[wreckInfo.unitDefID][unitID] = nil
            return -- Match found and processed.
        end
    end
end

function gadget:GameFrame(currentFrame)
    deadUnits[currentFrame - 1 - rezFrameDistance] = nil
    rezzedUnits = {} -- Reset every frame as per logic comment.
end