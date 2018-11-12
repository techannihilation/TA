-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Tidal Energy Control",
    desc      = "Controls tidal generator energy output",
    author    = "Krogoth86 (modified windmill script by quantum)",
    date      = "March 10, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local tideDefs = {
  [ UnitDefNames['armatidal'].id ] = true,
  [ UnitDefNames['coratidal'].id ] = true,
  [ UnitDefNames['tllatidal'].id ] = true,
}

local tidals = {}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups
local uDefs = UnitDefs

local GetTide              = Game.tidal
local GetUnitDefID         = Spring.GetUnitDefID
local AddUnitResource      = Spring.AddUnitResource
local SpGetAllUnits        = Spring.GetAllUnits

local ipairs = ipairs
local pairs = pairs
local GAMESPEED = 30

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+20) % GAMESPEED) < 0.1) then
  local strength = GetTide
    for unitID, scriptIDs in pairs(tidals) do
      local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
      local uDef = uDefs[uDefID]
      local mult = 2 -- DEFAULT
      if uDef.customParams then
         mult = uDef.customParams.energymultiplier or mult
      end
      if not Spring.GetUnitIsStunned(unitID) then
        AddUnitResource(unitID, "e", strength * (mult - 1))
      end
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local scriptIDs = {}
    tidals[unitID] = scriptIDs
end


function gadget:Initialize()
  for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
    if (tideDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end


function gadget:UnitFinished(unitID, unitDefID, unitTeam)
  if (tideDefs[unitDefID]) then
    SetupUnit(unitID)
  end
end


function gadget:UnitTaken(unitID, unitDefID, unitTeam)
  if (tideDefs[unitDefID]) then 
    SetupUnit(unitID)
  end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (tideDefs[unitDefID]) then 
    tidals[unitID] = nil
  end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

