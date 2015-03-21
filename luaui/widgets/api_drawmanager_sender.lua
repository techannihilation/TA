function widget:GetInfo()
	return {
	name      = "Draw Manager Sender",
	desc      = "Disable lups on catchup",
	author    = "Nixtux",
	date      = "Mar 2015",
	license   = "GNU GPL, v3 or later",
	layer     = 5,
	enabled   = false,
	}
end
local oldtoohighstatus = false
local oldpingstatus = false

--Ugly workaround to send to lups.lua


function widget:Initialize()
    widgetHandler:RegisterGlobal('DrawManager_lups', DrawStatus)
end

function widget:Shutdown()
  widgetHandler:DeregisterGlobal('DrawManager_lups', DrawStatus)
end

function DrawStatus(toohigh,fps,ping)
  --height check
  if toohigh ~= oldtoohighstatus then
    if toohigh == true then 
      Spring.SendLuaRulesMsg("toohigh"..1)
    else
      Spring.SendLuaRulesMsg("toohigh"..0)
    end
  end
  oldtoohighstatus = toohigh
  
  --ping
  if ping ~= oldpingstatus then
    if ping == true then 
      Spring.SendLuaRulesMsg("ping"..1)
    else
      Spring.SendLuaRulesMsg("ping"..0)
    end
  end
  oldpingstatus = ping
end