--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unit_stockpile.lua
--  brief:   adds 100 builds to all new units that can stockpile
--  author:  Dave Rodgers
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Stockpiler",
    desc      = "Automatically adds 100 stockpile builds to new units",
    author    = "trepan",
    date      = "Jan 8, 2007",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local SpGiveOrderToUnit = Spring.GiveOrderToUnit
local SpGetMyTeamID     = Spring.GetMyTeamID
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

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

function widget:UnitCreated(unitID, unitDefID, unitTeam)
  local ud = UnitDefs[unitDefID]
  if ((ud ~= nil) and (unitTeam == SpGetMyTeamID())) then
    if (ud.canStockpile) then
      if (ud.customParams.customstock) then
	-- give stockpilers 100 units to build
        SpGiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "shift" })
      else
        -- give stockpilers 100 units to build
        SpGiveOrderToUnit(unitID, CMD.STOCKPILE, {}, { "ctrl", "shift" })
      end
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
