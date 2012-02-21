-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Windmill Control",
    desc      = "Controls windmill helix",
    author    = "quantum (modified by Krogoth86)",
    date      = "June 29, 2007",
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

local windDefs = {
  [ UnitDefNames['armawin'].id ] = true,
  [ UnitDefNames['corawin'].id ] = true,
}

local windmills = {}
local groundMin, groundMax = 0,0
local groundExtreme = 0
local slope = 0


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

-- Speed-ups

local CallCOBScript        = Spring.CallCOBScript
local GetCOBScriptID       = Spring.GetCOBScriptID
local GetWind              = Spring.GetWind
local GetUnitDefID         = Spring.GetUnitDefID
local GetHeadingFromVector = Spring.GetHeadingFromVector
local GetUnitResources     = Spring.GetUnitResources 
local windMin              = Game.windMin 
local windMax              = Game.windMax
local AddUnitResource      = Spring.AddUnitResource
local GetUnitBasePosition  = Spring.GetUnitBasePosition
local pi_2	= math.pi * 2
local fmod  = math.fmod
local atan2 = math.atan2


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------


function gadget:GameFrame(n)
  if (((n+16) % 32) < 0.1) then
    if (n==48) then
      Spring.SendMessage('Initializing Windmill Controls' )
      Spring.SendMessage('Done' )
    end
    local _, _, _, strength, x, _, z = GetWind()
    local heading = GetHeadingFromVector(x, z)
		
    for unitID, scriptIDs in pairs(windmills) do
      local de = strength * 1.5 
      AddUnitResource(unitID, "e", de)
      local speed = de * COBSCALE * 0.025

      CallCOBScript(unitID, scriptIDs.speed, 0, speed)
      CallCOBScript(unitID, scriptIDs.dir,   0, heading)
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local scriptIDs = {}

  local _, y = GetUnitBasePosition(unitID)
  if (groundMax<=0) then
    scriptIDs.alt = 0.0
  else
    local altitude = (y - groundMin)/groundExtreme
    scriptIDs.alt = altitude*slope
  end
	
  scriptIDs.speed = GetCOBScriptID(unitID, "LuaSetSpeed")
  scriptIDs.dir   = GetCOBScriptID(unitID, "LuaSetDirection")
  windmills[unitID] = scriptIDs
end


function gadget:Initialize()
  groundMin, groundMax = Spring.GetGroundExtremes()
  groundMin, groundMax = math.max(groundMin,0), math.max(groundMax,1)
  groundExtreme = groundMax - groundMin

  --this is a function defined between 0 and 1, so we can adjust the gadget 
  -- effect between 0% (flat maps) and 100% (mountained maps)
  slope = 1/(1+math.exp(4 - groundExtreme/105))

  for _, unitID in ipairs(Spring.GetAllUnits()) do
    local unitDefID = Spring.GetUnitDefID(unitID)
    if (windDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end


function gadget:UnitCreated(unitID, unitDefID, unitTeam)
  if (windDefs[unitDefID]) then
    SetupUnit(unitID)
  end
end


function gadget:UnitTaken(unitID, unitDefID, unitTeam)
	if (windDefs[unitDefID]) then 
		SetupUnit(unitID)
	end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if (windDefs[unitDefID]) then 
		windmills[unitID] = nil
	end
end


-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

