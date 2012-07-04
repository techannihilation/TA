-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Tidal Rundry Control",
    desc      = "Explodes tidal that exceed there min waterline",
    author    = "Nixtux",
    date      = "April 29, 20012",
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
  [ UnitDefNames['armtide'].id ] = true,
  [ UnitDefNames['cortide'].id ] = true,
  [ UnitDefNames['tlltide'].id ] = true,
}

local tidals = {}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local uDefs = UnitDefs
local GetUnitDefID         = Spring.GetUnitDefID
local GetUnitBasePosition  = Spring.GetUnitBasePosition
local GetGroundHeight      = Spring.GetGroundHeight
local Buffer = 3
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+16) % 32) < 0.1) then
    if (n==48) then
    end
      for unitID, scriptIDs in pairs(tidals) do
		 
	  local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
	  local uDef = uDefs[uDefID]
	  local minwater = uDef.minWaterDepth
	  local x, y, z = GetUnitBasePosition(unitID)
	  local groundy = GetGroundHeight(x, z)
	--  Spring.Echo("minlwaterline:- " .. minwater)
	--  Spring.Echo("Height:- " ..  groundy)
	--  Spring.Echo("Sum:- " .. minwater + groundy)
	  if (minwater + groundy ) > ( 0 + Buffer) then 
	    Spring.DestroyUnit(unitID, true, false)
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
  for _, unitID in ipairs(Spring.GetAllUnits()) do
    local unitDefID = Spring.GetUnitDefID(unitID)
    if (tideDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end


function gadget:UnitCreated(unitID, unitDefID, unitTeam)
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