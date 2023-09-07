
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

local isRadar = {
  [UnitDefNames["coreyes"].id] = true,
  [UnitDefNames["armeyes"].id] = true,
  [UnitDefNames["tlltower"].id] = true,
}


for uDefID, uDef in pairs(UnitDefs) do
  if uDef.radarRadius > 1300 then --Should only seletect real radar units
    isRadar[uDefID] = true
  end
end

local Overlayenabled = false
local MouseOver = false
local Selected = false
------------------------------------------------------------
-- Callins
------------------------------------------------------------


function widget:GameFrame(frame)
  if ((frame%8)<1) then
    
    --Enable los view for mouse over
    local x, y = Spring.GetMouseState()
    local isunit, unitID = Spring.TraceScreenRay(x, y)
    if (isunit == "unit") then
      local unitDefID = Spring.GetUnitDefID(unitID)
      if isRadar[unitDefID] then
        if MouseOver == false and spGetMapDrawMode() ~= 'los' then
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
      if Overlayenabled == false and spGetMapDrawMode() ~= 'los' then
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
  
  --Enable for Single unit selection only
      local selectedUnits = Spring.GetSelectedUnits()
    if #selectedUnits == 1 then
      local unitDefID = Spring.GetUnitDefID(selectedUnits[1])
      if isRadar[unitDefID] then
	if Selected == false and spGetMapDrawMode() ~= 'los' then
          Spring.SendCommands ("toggleinfo los")
          Selected = true
	end
      else
	if Selected == true then
	  Spring.SendCommands ("toggleinfo los")
          Selected = false
        end
      end
    elseif #selectedUnits == 0 then
     if Selected == true then
	  Spring.SendCommands ("toggleinfo los")
          Selected = false
        end
    end
end