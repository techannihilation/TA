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

function widget:Initialize()
  if not WG.metalSpots then
    widgetHandler:RemoveWidget()
    return
  end
  local metalSpots = WG.metalSpots
  if #metalSpots < 6 then
    widgetHandler:RemoveWidget()
    return
  end
  Spring.SendCommands("unbind any+f4 showmetalmap")
  Spring.SendCommands("toggleinfo metal")
end

function widget:GameFrame(frame)
  if frame >= 5 then
    Spring.SendCommands("toggleinfo metal")
      if Spring.GetMapDrawMode() == 'los' then
        Spring.SendCommands("bind any+f4 showmetalmap")
      end
    widgetHandler:RemoveWidget()
  end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------