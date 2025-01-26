function gadget:GetInfo()
  return {
    name    = "Disable bomber build options",
    desc    = "Removes the build-menu commands for bombers",
    author  = "Silver",
    date    = "2025-01-26",
    license = "GNU GPL, v2 or later",
    layer   = 0,
    enabled = true
  }
end

if not gadgetHandler:IsSyncedCode() then
  return
end

local disableBombers = Spring.GetModOptions().disable_bombers or false

local bomberBuildCmds = {}

--------------------------------------------------------------------------------
--  FUNCTIONS
--------------------------------------------------------------------------------
local function CacheBomberBuildCMDs()
  for unitDefID, ud in pairs(UnitDefs) do
    if ud.isBomberAirUnit or ud.name == "armcybr" then
      bomberBuildCmds[-unitDefID] = true
    end
  end
end

local function RemoveCommandsFromUnit(unitID, cmdIDSet)
  local cmdDescs = Spring.GetUnitCmdDescs(unitID)
  if not cmdDescs then return end
  for i = #cmdDescs, 1, -1 do
    local cmdDesc = cmdDescs[i]
    if cmdDesc and cmdIDSet[cmdDesc.id] then
      Spring.RemoveUnitCmdDesc(unitID, i)
    end
  end
end

--------------------------------------------------------------------------------
--  CALLINS
--------------------------------------------------------------------------------

function gadget:Initialize()
  if not disableBombers then
    gadgetHandler:RemoveGadget()
    return
  end

  CacheBomberBuildCMDs()
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
  RemoveCommandsFromUnit(unitID, bomberBuildCmds)
end
