-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Stun Storage",
    desc      = "Makes stunned storage leak/use energy",
    author    = "Nixtux",
    date      = "June 15, 2014",
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

local storageDefs = {
  --Arm 
  [ UnitDefNames['armestor'].id ] = true,
  [ UnitDefNames['armuwadves'].id ] = true,
  [ UnitDefNames['armses'].id ] = true,
  [ UnitDefNames['armuwes'].id ] = true,

  --Core 
  [ UnitDefNames['corestor'].id ] = true,
  [ UnitDefNames['coruwadves'].id ] = true,
  [ UnitDefNames['corses'].id ] = true,
  [ UnitDefNames['coruwes'].id ] = true,
  --The Lost Legacy
  [ UnitDefNames['tllestor'].id ] = true,
  [ UnitDefNames['tllemstor'].id ] = true,
  [ UnitDefNames['tlluwestorage'].id ] = true,
 }

local storageunits = {}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local uDefs = UnitDefs
local GetUnitDefID         = Spring.GetUnitDefID
local SpGetAllUnits        = Spring.GetAllUnits

local ipairs = ipairs
local pairs = pairs

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+18) % 32) < 0.1) then
      for unitID, scriptIDs in pairs(storageunits) do
	  local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
	  local uDef = uDefs[uDefID]
	  local storagecap = uDef.energyStorage
	  local penatly = storagecap / 2500 
	  
	  if Spring.GetUnitIsStunned(unitID) then
		--Spring.Echo(unitID .. " is stunned  " ..storagecap,penatly)
		Spring.UseTeamResource(Spring.GetUnitTeam(unitID), "energy", penatly)
		     storageunits[unitID]= nil

		  end
   end

  end
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local scriptIDs = {}
   storageunits[unitID] = scriptIDs
end


function gadget:Initialize()
  for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
    if (storageDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
    if (storageDefs[unitDefID]) then
    SetupUnit(unitID)
  end
end

function gadget:UnitTaken(unitID, unitDefID, unitTeam)
	if (storageDefs[unitDefID]) then 
		SetupUnit(unitID)
	end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if (storageDefs[unitDefID]) then 
	   storageDefs[unitID]= nil
	end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------