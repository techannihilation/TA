function gadget:GetInfo()
  return {
    name    = "Disable air build options",
    desc    = "Removes the build-menu commands for bombers (if disable_bombers is set) or for all air units (if noair is set)",
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

-- Read mod options; both options remain available.
local disableBombers = Spring.GetModOptions().disable_bombers or false
local noAir = Spring.GetModOptions().noair or false

local buildCmdsToRemove = {}

--------------------------------------------------------------------------------
--  FUNCTIONS
--------------------------------------------------------------------------------

local function CacheBuildCMDs()
  -- If the noair option is set, cache build commands for all air units.
  if noAir then
    for unitDefID, ud in pairs(UnitDefs) do
      if ud.canFly then
        buildCmdsToRemove[-unitDefID] = true
      end
    end
  -- Otherwise, if only disableBombers is set, cache bomber build commands.
  elseif disableBombers then
    for unitDefID, ud in pairs(UnitDefs) do
      if ud.isBomberAirUnit or ud.name == "armcybr" then
        buildCmdsToRemove[-unitDefID] = true
      end
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
  -- If neither option is enabled, there's nothing to do.
  if not disableBombers and not noAir then
    gadgetHandler:RemoveGadget()
    return
  end

  CacheBuildCMDs()
end

function gadget:UnitCreated(unitID, unitDefID, teamID)
  RemoveCommandsFromUnit(unitID, buildCmdsToRemove)
end
