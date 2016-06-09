function widget:GetInfo()
  return {
    name      = "unit_blacklily_auto_cloak",
    desc      = "Enabled cloak on atteck/fight command",
    author    = "nixtux",
    date      = "Jun 08, 2016",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false  --  loaded by default?
  }
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local CMD_LOOPBACKATTACK = CMD.LOOPBACKATTACK
local CMD_FIGHT = CMD.FIGHT

local BlacklilyDefId = UnitDefNames["corsbomb"].id

function widget:MousePress(mx, my, mButton)
	local a, activeCmdID = Spring.GetActiveCommand()
	--Spring.Echo("cmd:", CMD[activeCmdID],a)
	if activeCmdID == CMD_FIGHT or activeCmdID == CMD_LOOPBACKATTACK then
		local selUnits = Spring.GetSelectedUnits()
		for i = 1, #selUnits do
 			local unitDefID = Spring.GetUnitDefID(selUnits[i])
 			if unitDefID == BlacklilyDefId then
 				if not Spring.GetUnitIsCloaked(selUnits[i]) then
					--Spring.Echo("bingo",selUnits[i],unitDefID)
					Spring.GiveOrderToUnit(selUnits[i], CMD.CLOAK, {1}, {})
				end
			end
		end
	end
end