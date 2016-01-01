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
local uDefs = UnitDefs

local CallCOBScript        = Spring.CallCOBScript
local GetCOBScriptID       = Spring.GetCOBScriptID
local GetWind              = Spring.GetWind
local GetUnitDefID         = Spring.GetUnitDefID
local GetHeadingFromVector = Spring.GetHeadingFromVector
local windMin              = Game.windMin 
local windMax              = Game.windMax
local AddUnitResource      = Spring.AddUnitResource
local SpGetAllUnits        = Spring.GetAllUnits
local ipairs = ipairs
local pairs = pairs

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function gadget:GameFrame(n)
  if (((n+16) % 32) < 0.1) then
  local _, _, _, strength, x, _, z = GetWind()
  local heading = GetHeadingFromVector(-x, -z)
    for unitID, scriptIDs in pairs(windmills) do
      local mult = scriptIDs.mult
      if not Spring.GetUnitIsStunned(unitID) then
        AddUnitResource(unitID, "e", strength * (mult - 1))
      end
      local speed = strength * mult * COBSCALE * 0.010
      CallCOBScript(unitID, scriptIDs.speed, 0, speed)
      CallCOBScript(unitID, scriptIDs.dir,   0, heading)
    end
  end
end

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local function SetupUnit(unitID)
  local scriptIDs = {}
  scriptIDs.speed = GetCOBScriptID(unitID, "LuaSetSpeed")
  scriptIDs.dir   = GetCOBScriptID(unitID, "LuaSetDirection")
  local uDefID = GetUnitDefID(unitID) ; if not uDefID then return end
  local uDef = uDefs[uDefID]
  local mult = 2.5 -- DEFAULT
  if uDef.customParams then
    mult = uDef.customParams.energymultiplier or mult
  end
  scriptIDs.mult = mult
  windmills[unitID] = scriptIDs
end


function gadget:Initialize()
   for _, unitID in ipairs(SpGetAllUnits()) do
    local unitDefID = GetUnitDefID(unitID)
    if (windDefs[unitDefID]) then
      SetupUnit(unitID)
    end
  end
end


function gadget:UnitFinished(unitID, unitDefID, unitTeam)
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

