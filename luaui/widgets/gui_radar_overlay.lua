
function widget:GetInfo()
	return {
		name      = "Radar Overlay",
		desc      = "Enabled Overlay mode while doing radar placement",
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

local isRadar = {}
for uDefID, uDef in pairs(UnitDefs) do
	if uDef.radarRadius > 600 then
	  Spring.Echo("radar")
		isRadar[uDefID] = true
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
    if (cmdID and isRadar[-cmdID]) then
      if Overlayenabled == false then
        Spring.SendCommands ("toggleinfo los") --todo how to work out what mode we are using
        Overlayenabled = true
      end
    else 
      if Overlayenabled == true then
        Spring.SendCommands ("toggleinfo los")
        Overlayenabled = false
      end
    end
  end
end