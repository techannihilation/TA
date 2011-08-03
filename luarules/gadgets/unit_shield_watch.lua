function gadget:GetInfo()
  return {
    name      = "ShieldDrain",
    desc      = "Drains shields power while deflecting weaker shots",
    author    = "TheFatController",
    date      = "25 Nov 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end

local GetUnitShieldState = Spring.GetUnitShieldState
local SetUnitShieldState = Spring.SetUnitShieldState
local GetUnitResources = Spring.GetUnitResources
local mathMax = math.max
local mathMin = math.min

local shieldDef = {}
--Arm
shieldDef[UnitDefNames["armgate"].id] = true
--shieldDef[UnitDefNames["armgate1"].id] = true
shieldDef[UnitDefNames["armgate2"].id] = true
--shieldDef[UnitDefNames["armcom4"].id] = true
--shieldDef[UnitDefNames["armcom6"].id] = true
--shieldDef[UnitDefNames["armcom7"].id] = true
shieldDef[UnitDefNames["armpraet"].id] = true
shieldDef[UnitDefNames["armmas"].id] = true
shieldDef[UnitDefNames["armflosh"].id] = true
--Core
shieldDef[UnitDefNames["corgate"].id] = true
--shieldDef[UnitDefNames["corgate1"].id] = true
shieldDef[UnitDefNames["corgate2"].id] = true
--shieldDef[UnitDefNames["corcom5"].id] = true
--shieldDef[UnitDefNames["corcom6"].id] = true
--shieldDef[UnitDefNames["corcom7"].id] = true
shieldDef[UnitDefNames["cormas"].id] = true
shieldDef[UnitDefNames["monkeylord"].id] = true
shieldDef[UnitDefNames["corflshd"].id] = true
--The lost legacy
--shieldDef[UnitDefNames["tllcom5"].id] = true
--shieldDef[UnitDefNames["tllcom6"].id] = true
--shieldDef[UnitDefNames["tllcom7"].id] = true
shieldDef[UnitDefNames["tllgate"].id] = true
--shieldDef[UnitDefNames["tllgate1"].id] = true
shieldDef[UnitDefNames["tllmono"].id] = true

local shields = {}
local gameFrame = 0

function gadget:GameFrame(n)
  for unitID in pairs(shields) do
    local eDrain = select(4,GetUnitResources(unitID))
    if (eDrain > 620) then
      SetUnitShieldState(unitID,true,mathMax(select(2,GetUnitShieldState(unitID))-mathMin((eDrain/100), 16),0),1)
    end
  end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  shields[unitID] = nil
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
  if shieldDef[unitDefID] then
    shields[unitID] = 0
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
