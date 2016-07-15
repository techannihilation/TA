-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Run Dry Control",
    desc      = "Explodes water units that are on land",
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

local tideDefs = {}
local tidals = {}

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local uDefs = UnitDefs
local GetUnitDefID         = Spring.GetUnitDefID
local GetUnitBasePosition  = Spring.GetUnitBasePosition
local GetUnitPosition      = Spring.GetUnitPosition
local GetGroundHeight      = Spring.GetGroundHeight
local SpSpawnCEG           = Spring.SpawnCEG
local SpDestroyUnit        = Spring.DestroyUnit
local SpGetAllUnits        = Spring.GetAllUnits

local ipairs = ipairs
local pairs = pairs

local buffer = 2
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+18) % 30) < 0.1) then
    for unitID, _ in pairs(tidals) do
	local minwater = tidals[unitID].minwaterdepth
    local canMove = tidals[unitID].canmove
	local mass = tidals[unitID].mass
    local rx, baseposy, rz = GetUnitPosition(unitID)
    local elevation = GetGroundHeight(rx, rz)
    local isFactory = tidals[unitID].isfactory
    --Spring.Echo( elevation, minwater)
	  if ((elevation + minwater) > ( 0 +  buffer ) and canMove == false ) or ((elevation >= baseposy ) and canMove and not isFactory) then 
	    if mass < 601 then
	      SpSpawnCEG("Death_Explosion_Tidal_Small", rx, 0, rz)
	    elseif mass >= 601 and mass <= 4000 then
	      SpSpawnCEG("Death_Explosion_Tidal", rx, 0, rz)
	    else
	      SpSpawnCEG("Death_Explosion_Tidal_Large", rx, 0, rz)
	    end
	    SpDestroyUnit(unitID, true, false)
	  end
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local uDefID = GetUnitDefID(unitID) ; if not uDefID then return end
  local uDef = uDefs[uDefID]
  tidals[unitID] = {minwaterdepth = uDef.minWaterDepth, mass = uDef.mass, canmove = uDef.canMove, isfactory = uDef.isFactory}
end


function gadget:Initialize()
  for i=1,#UnitDefs do
  local unitDefID = UnitDefs[i]
    if (unitDefID.minWaterDepth and unitDefID.minWaterDepth> 0) and unitDefID.waterline then
      --Spring.Echo(i,unitDefID.name, unitDefID.tooltip, unitDefID.canMove)
      tideDefs[i] = true
    end
  end
  for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
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