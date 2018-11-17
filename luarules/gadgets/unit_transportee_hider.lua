function gadget:GetInfo()
  return {
    name      = "Transportee Hider",
    desc      = "Hides units when inside a closed transport, issues stop command to units trying to enter a full transport",
    author    = "FLOZi",
    date      = "09/02/10",
    license   = "PD",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local SetUnitNoDraw            = Spring.SetUnitNoDraw
local _ = Spring.SetUnitNeutral
local SetUnitStealth        = Spring.SetUnitStealth
local SetUnitSonarStealth    = Spring.SetUnitSonarStealth
local GetUnitDefID            = Spring.GetUnitDefID
local _ = Spring.GetUnitPosition
local _ = Spring.GetUnitTransporter
local _ = Spring.GetUnitsInCylinder
local GiveOrderToUnit        = Spring.GiveOrderToUnit

-- Constants
local CMD_LOAD_ONTO = CMD.LOAD_ONTO
local CMD_STOP = CMD.STOP
-- Variables
local massLeft = {}
local toBeLoaded = {}

if (gadgetHandler:IsSyncedCode()) then

function gadget:AllowCommand(unitID, _, _, cmdID, cmdParams, _)
    if cmdID == CMD_LOAD_ONTO then
        local transportID = cmdParams[1]
        toBeLoaded[unitID] = transportID
    end
    return true
end


function gadget:UnitCreated(unitID, unitDefID, _)
    local unitDef = UnitDefs[unitDefID]
    local maxMass = unitDef.transportMass
    if maxMass then
        massLeft[unitID] = maxMass
    end
end

function gadget:UnitDestroyed(unitID, _, _)
    massLeft[unitID] = nil
    toBeLoaded[unitID] = nil
end

local function TransportIsFull(transportID)
    for unitID, targetTransporterID in pairs(toBeLoaded) do
        if targetTransporterID == transportID then
            GiveOrderToUnit(unitID, CMD_STOP, {}, {})
            toBeLoaded[unitID] = nil
        end
    end
end

function gadget:UnitLoaded(unitID, unitDefID, _, transportID, _)
    --Spring.Echo("UnitLoaded", unitDefID, transportID)
    if ((not unitDefID) or (not transportID)) then return end
    local transportDef = UnitDefs[GetUnitDefID(transportID)]
    local unitDef = UnitDefs[unitDefID]
    -- Check if transport is full (former crash risk!)
    if not massLeft[transportID] then return end
    massLeft[transportID] = massLeft[transportID] - unitDef.mass
    if massLeft[transportID] == 0 then
        TransportIsFull(transportID)
    end
    if (not transportDef.springCategories.vtol) and (not transportDef.isAirBase) then
        SetUnitNoDraw(unitID, true)
        SetUnitStealth(unitID, true)
        SetUnitSonarStealth(unitID, true)
    end
end

function gadget:UnitUnloaded(unitID, unitDefID, _, transportID)
    --Spring.Echo("UnitUnloaded")
    if ((not unitDefID) or (not transportID)) then return end
    local transportDef = UnitDefs[GetUnitDefID(transportID)]
    local unitDef = UnitDefs[unitDefID]
    if not massLeft[transportID] then return end
    massLeft[transportID] = massLeft[transportID] + unitDef.mass
    if (not transportDef.springCategories.vtol) and (not transportDef.isAirBase) then
        SetUnitNoDraw(unitID, false)
        SetUnitStealth(unitID, false)
        SetUnitSonarStealth(unitID, false)
    end
end

else

end


