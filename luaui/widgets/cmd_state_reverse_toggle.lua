function widget:GetInfo()
  return {
    name      = "State Reverse Toggle",
    desc      = "Makes all buttons with 3 or more states reverse toggleable",
    author    = "Google Frog, Deadnight Warrior",
    date      = "Oct 2, 2009",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local spGetSelectedUnits = Spring.GetSelectedUnits
local spGiveOrderToUnit = Spring.GiveOrderToUnit
local spGetActiveCmdDesc = Spring.GetActiveCmdDesc
local spGetCmdDescIndex = Spring.GetCmdDescIndex

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

function widget:CommandNotify(id, params, options)

	local index = spGetCmdDescIndex(id)
	if index then
		local comButton = spGetActiveCmdDesc(index)
		if comButton and comButton.params and #comButton.params>3 then
			if options.right then
				local units = spGetSelectedUnits()
				local state = params[1] -2
				if state < 0 then 
					state = state + #comButton.params - 1
				end
				for _,sid in ipairs(units) do
					spGiveOrderToUnit(sid, id, { state }, {})	
				end
				return true
			end
		end
	end
end
