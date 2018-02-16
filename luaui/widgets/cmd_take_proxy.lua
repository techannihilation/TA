
function widget:GetInfo()
  return {
    name      = "Take Proxy",
    desc      = "Renames /luarules take2 to /take",
    author    = "BD",
    date      = "2012",
    license   = "WTFPL",
    layer     = 0,
    enabled   = true  -- loaded by default
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

local function TakeTeam()
	Spring.SendCommands({"luarules take2"})
end

function widget:Initialize()
	widgetHandler:AddAction("take2", TakeTeam, "Take control of units and resouces from inactive players")
end

function widget:Shutdown()
	widgetHandler:RemoveAction('take2')
end
