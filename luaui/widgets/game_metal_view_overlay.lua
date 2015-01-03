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
  if Spring.GetMapDrawMode() ~= 'metal' then
    Spring.SendCommands("unbind any+f4 showmetalmap")
    Spring.SendCommands("toggleinfo metal")
  end
end

function widget:GameFrame(frame)
  if frame >= 5 then
    Spring.SendCommands("bind any+f4 showmetalmap")
      if Spring.GetMapDrawMode() == 'metal' then
        Spring.SendCommands("toggleinfo metal")
      end
    widgetHandler:RemoveWidget()
  end
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------