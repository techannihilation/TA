
function widget:GetInfo()
	return {
		name      = "Radar Overlay",
		desc      = "Enabled Los View Overlay mode when placing radat towers or mouse over radar tower",
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
local spGetMapDrawMode = Spring.GetMapDrawMode

local isRadar = {}

for uDefID, uDef in pairs(UnitDefs) do
  if uDef.radarRadius > 1300 then --Should only seletect real radar units
    isRadar[uDefID] = true
  end
end

local Overlayenabled = false
local MouseOver = false
------------------------------------------------------------
-- Callins
------------------------------------------------------------


function widget:GameFrame(frame)
  if ((frame%8)<1) then
    
    if spGetMapDrawMode() == 'los' and Overlayenabled == false and MouseOver == false then --Disable if player play's with los view on
      return
    end
    
    --Enable los view for mouse over
    local x, y = Spring.GetMouseState()
    local isunit, unitID = Spring.TraceScreenRay(x, y)
    if (isunit == "unit") then
      local unitDefID = Spring.GetUnitDefID(unitID)
      if isRadar[unitDefID] then
        if MouseOver == false then
          Spring.SendCommands ("toggleinfo los")
          MouseOver = true
	end
      else
	if MouseOver == true then
	  Spring.SendCommands ("toggleinfo los")
          MouseOver = false
        end
      end
    else
	if MouseOver == true then
	  Spring.SendCommands ("toggleinfo los")
          MouseOver = false
        end
	
    end
    
    --Enable los viwe while placing radar towers
    local _, cmdID = spGetActiveCommand()
    if (cmdID and isRadar[-cmdID]) then
      if Overlayenabled == false then
        Spring.SendCommands ("toggleinfo los")
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