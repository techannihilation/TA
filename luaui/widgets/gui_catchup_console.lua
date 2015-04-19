function widget:GetInfo()
  return {
    name      = "Engine Console on Catchup",
    desc      = "as above",
    author    = "nixtux",
    date      = "Apr 19, 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local consoleStatus = nil
local maxframelag = 750
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function widget:GameFrame(serverframenum)
	local frame = Spring.GetGameFrame()
	if frame > (serverframenum-maxframelag) then
		if consoleStatus == nil then
			Spring.SendCommands('/console 1')
			consoleStatus = true
		end
	else
		if consoleStatus == true then
			Spring.SendCommands('/console 0')
			consoleStatus = false
		end
	end
end
