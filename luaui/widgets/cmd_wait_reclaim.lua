
function widget:GetInfo()
  return {
    name      = "Wait reclaim",
    desc      = "Enables pausing a reclaim with wait",
    author    = "Pako",
    date      = "25.04.2011 -26.05.2011",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local SpGetSpectatingState = Spring.GetSpectatingState
local SpIsReplay = Spring.IsReplay
local SpGiveOrderToUnit = Spring.GiveOrderToUnit

local CMD_WAIT = CMD.WAIT
local CMD_RECLAIM = CMD.RECLAIM
local CMD_INSERT = CMD.INSERT
local CMD_REMOVE = CMD.REMOVE
local CMD_OPT_SHIFT = CMD.OPT_SHIFT

function widget:Initialize()
  if SpGetSpectatingState() or SpIsReplay() then
    widgetHandler:RemoveWidget()
    return false
  end
end

function widget:PlayerChanged()
  if SpGetSpectatingState() or SpIsReplay() then
    widgetHandler:RemoveWidget()
  end
end


function widget:UnitCommand(unitId, unitDefId, unitTeam, cmdId, cmdOpts, cmdParams)
  if (cmdId == CMD_WAIT) then
      local cQueue = Spring.GetCommandQueue(unitId)
	if(cQueue~=nil and (#cQueue)>=1 and cQueue[1].id == CMD_RECLAIM)then
	  SpGiveOrderToUnit(unitId, CMD_REMOVE, {cQueue[1].tag},{""})
	  SpGiveOrderToUnit(unitId, CMD_INSERT, {1, CMD_RECLAIM, CMD_OPT_SHIFT, unpack(cQueue[1].params)}, {"alt"})
	  return false
	end
   end
end
