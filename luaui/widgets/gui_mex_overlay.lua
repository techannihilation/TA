
function widget:GetInfo()
	return {
		name      = "Mex Overlay",
		desc      = "Enabled Overlay mode on mex placement",
		author    = "Nix",
		version   = "v0.1",
		date      = "Nov 2014",
		license   = "GNU GPL, v2 or later",
		layer     = 0,
		enabled   = true,
		handler   = true
	}
end

------------------------------------------------------------
-- Speedups
------------------------------------------------------------
local spGetActiveCommand = Spring.GetActiveCommand

local isMex = {}
for uDefID, uDef in pairs(UnitDefs) do
	if uDef.extractsMetal > 0 then
		isMex[uDefID] = true
	end
end

local Overlayenabled = false

------------------------------------------------------------
-- Callins
------------------------------------------------------------


function widget:GameFrame(frame)
  
  if frame < 1 then return end
  if ((frame%8)<1) then
    -- Check command is to build a mex
    local _, cmdID = spGetActiveCommand()
    if (cmdID and isMex[-cmdID]) then
      if Overlayenabled == false then
        Spring.SendCommands ("toggleinfo metal")
        Overlayenabled = true
      end
    else 
      if Overlayenabled == true then
        Spring.SendCommands ("toggleinfo metal")
        Overlayenabled = false
      end
    end
  end
end