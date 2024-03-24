-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Stun Energy Storage",
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
  --Core
  [ UnitDefNames['corestor'].id ] = true,
  [ UnitDefNames['coruwadves'].id ] = true,
  [ UnitDefNames['corses'].id ] = true,
  --The Lost Legacy
  [ UnitDefNames['tllestor'].id ] = true,
  [ UnitDefNames['tllemstor'].id ] = true,
  [ UnitDefNames['tllemstor1'].id ] = true,
  --Talon
  [ UnitDefNames['talon_estor'].id ] = true,
  [ UnitDefNames['talon_aestor'].id ] = true,
  [ UnitDefNames['talon_eestor'].id ] = true,
  --Gok
  [ UnitDefNames['gok_estor'].id ] = true,
  [ UnitDefNames['gok_aestor'].id ] = true,
  [ UnitDefNames['gok_eestor'].id ] = true,
  --Rumad
  [ UnitDefNames['rumad_estor'].id ] = true,
  [ UnitDefNames['rumad_aestor'].id ] = true,
  [ UnitDefNames['rumad_eestor'].id ] = true,
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
  if (((n+18) % 30) < 0.1) then
    for unitID, _ in pairs(storageunits) do

	   if Spring.GetUnitIsStunned(unitID) then
       local teamID = storageunits[unitID].teamID
       if teamID == nil then return end
	     local penality = storageunits[unitID].storagecap
	     --Spring.Echo(unitID .. " is stunned  " ..storageunits[unitID].storagecap,penality,storageunits[unitID].height)
	     local x,y,z = Spring.GetUnitPosition(unitID)
	     local height = storageunits[unitID].height
	     Spring.SpawnCEG("ENERGY_STORAGE_LEAK",x,y+height,z,0,0,0)
	     Spring.UseTeamResource(teamID, "energy", penality)
	   end
    end
  end
end
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID, unitDefID, unitTeam)
  local ud = UnitDefs[unitDefID]
  if (ud == nil)or(ud.height == nil) then return nil end
   storageunits[unitID] = {
   height = (ud.height * 0.40),
   storagecap = (ud.energyStorage  * 0.05), -- would work out 150e for t1 and 750e for t2
   teamID = unitTeam
   }
end

--[[
function gadget:Initialize() --for tesing only
  for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
    if (storageDefs[unitDefID]) then
      local unitTeam = Spring.GetUnitTeam(unitID)
      SetupUnit(unitID, unitDefID, unitTeam)
    end
  end
end
--]]

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
    if (storageDefs[unitDefID]) then
    SetupUnit(unitID, unitDefID, unitTeam)
  end
end

function gadget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
	if (storageDefs[unitDefID]) then
    storageunits[unitID] = nil
		SetupUnit(unitID, unitDefID, newTeam)
	end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if (storageDefs[unitDefID]) then
	 storageunits[unitID]= nil
	end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
