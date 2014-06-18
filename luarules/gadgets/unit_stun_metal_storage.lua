-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Stun Metal Storage",
    desc      = "Makes stunned storage drop capactiy",
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
  [ UnitDefNames['armmstor'].id ] = true,
  [ UnitDefNames['armuwadvms'].id ] = true,
  ---Core 
  [ UnitDefNames['coruwms'].id ] = true,
  [ UnitDefNames['cormstor'].id ] = true,
  [ UnitDefNames['coruwadvms'].id ] = true,
  [ UnitDefNames['cadvmsto'].id ] = true,
  --The Lost Legacy
  [ UnitDefNames['tllmstor'].id ] = true,
  [ UnitDefNames['tllemstor'].id ] = true,
  [ UnitDefNames['tlluwmstorage'].id ] = true,
 }

local storageunits = {}
local stunnedstorage = {}
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
      for unitID, _ in pairs(storageunits) do
	  local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
	  local uDef = uDefs[uDefID]
	  
	  if Spring.GetUnitIsStunned(unitID) and (storageunits[unitID].paracount == 0) then
		local storage = uDef.metalStorage
		local currentLevel,totalstorage = Spring.GetTeamResources(Spring.GetUnitTeam(unitID),"metal")
		Spring.SetTeamResource(Spring.GetUnitTeam(unitID), "ms", (totalstorage)-storage)
		--Spring.UseTeamResource(Spring.GetUnitTeam(unitID), "metal", storagecap)
		      if currentLevel > (totalstorage-storage) then
				local x,y,z = Spring.GetUnitPosition(unitID)
				Spring.SpawnCEG("METAL_STORAGE_LEAK",x,y+30,z,0,0,0)
		      end
		      
		      storageunits[unitID].paracount = 1
		      stunnedstorage[unitID] = true 
	  end
    end
  for unitID,_ in pairs(stunnedstorage) do


	    if not Spring.GetUnitIsStunned(unitID) then
	    local uDefID = GetUnitDefID(unitID) ; if not uDefID then break end
	    local uDef = uDefs[uDefID]
	    local storage = uDef.metalStorage
	    local _,totalstorage = Spring.GetTeamResources(Spring.GetUnitTeam(unitID),"metal")
	    Spring.SetTeamResource(Spring.GetUnitTeam(unitID), "ms", totalstorage+storage)
	    stunnedstorage[unitID] = nil
	    storageunits[unitID].paracount = 0
	    end
	  end
  end
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
   storageunits[unitID] = {paracount = 0}
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