function gadget:GetInfo()
  return {
    name      = "Pre Start Metal View",
    desc      = "Enables Mex view before game start",
    author    = "nixtux",
    date      = "Nov 27, 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then --SYNCED
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local StartMViewtogged = nil

function gadget:Initialize()
  Spring.SendCommands("unbind any+f4 showmetalmap")
  Spring.SendCommands("toggleinfo metal")
  StartMViewtogged = true
end

function gadget:GameFrame(frame)
  if StartMViewtogged == true and frame > 1 then
    Spring.SendCommands("toggleinfo metal")
    Spring.SendCommands("bind any+f4 showmetalmap")
    StartMViewtogged = false
    gadgetHandler:RemoveGadget()
  end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
end
