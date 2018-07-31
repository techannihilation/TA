function widget:GetInfo()
  return {
    name      = "Start Point Adder",
    desc      = "Add team start points once the game begins",
    author    = "abma",
    date      = "July 05, 2011",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false  -- not loaded by default
  }
end

function widget:Initialize()
	if Spring.IsReplay() or Spring.GetGameFrame() > 0 then
	    widget:PlayerChanged()
  	end
end

function widget:PlayerChanged(playerID)
	if Spring.GetSpectatingState() and Spring.GetGameFrame() > 0 then
		widgetHandler:RemoveWidget(self)
	end
end

function widget:GameStart()
	widget:PlayerChanged()
end

function widget:Update()
	if (Spring.GetGameSeconds() > 0) then
		local x, y, z = Spring.GetTeamStartPosition(Spring.GetMyAllyTeamID())
		local id=Spring.GetMyPlayerID()
		if x ~= nil and id ~= nil then
			Spring.MarkerAddPoint(x, y, z, "Start " .. id )
			widgetHandler:RemoveWidget(self)
		elseif (Spring.GetGameSeconds() > 30) and (x ~= nil and id ~= nil) then
			Spring.MarkerErasePosition(x, y, z)
			widgetHandler:RemoveWidget(self)
		end
	end
end
