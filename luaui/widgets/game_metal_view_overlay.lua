function widget:GetInfo()
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
local isActive = false
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function widget:Initialize()
  if not WG.metalSpots then
    widgetHandler:RemoveWidget(self)
    return
  end
  local metalSpots = WG.metalSpots
  if #metalSpots < 6 then
    widgetHandler:RemoveWidget(self)
    return
  end
  frame,_ = Spring.GetGameFrame()
  if Spring.GetMapDrawMode() ~= 'metal' and frame == 0 then
    --Spring.SendCommands("unbind any+f4 showmetalmap")

    --Spring.SendCommands("toggleinfo metal") -- use toggle for 98+
    Spring.SendCommands("ShowMetalMap")
    isActive = true
  end
end

function widget:GameFrame(n)
  if n > 1 then
    if isActive == true and Spring.GetMapDrawMode() == 'metal' then
    --Spring.SendCommands("bind any+f4 showmetalmap")
      if Spring.GetMapDrawMode() == 'metal' then

	--Spring.SendCommands("toggleinfo metal") -- use toggle for 98+
	Spring.SendCommands("ShowMetalMap")
      end
    isActive = false
    widgetHandler:RemoveWidget(self)
    end
  end
end

function widget:Shutdown()
  if Spring.GetMapDrawMode() == 'metal' then
    --Spring.SendCommands("bind any+f4 showmetalmap")
    
    --Spring.SendCommands("toggleinfo metal") -- use toggle for 98+
    Spring.SendCommands("ShowMetalMap")
  end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------