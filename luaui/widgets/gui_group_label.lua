--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    group_label.lua
--  brief:   displays label on units in a group
--  author:  gunblob
--
--  Copyright (C) 2008.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Group Label",
    desc      = "Displays label on units in a group",
    author    = "gunblob",
    date      = "June 12, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

local glPushMatrix				= gl.PushMatrix
local glTranslate				= gl.Translate
local glPopMatrix				= gl.PopMatrix
local glColor					= gl.Color
local glText					= gl.Text
local glBillboard				= gl.Billboard

local spGetGroupList				= Spring.GetGroupList
local spGetGroupUnits				= Spring.GetGroupUnits
local spGetUnitViewPosition 			= Spring.GetUnitViewPosition
local SpIsUnitInView				= Spring.IsUnitInView
local textColor = {0.7, 1.0, 0.7, 1.0}
local textSize = 12.0

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  Callins
--

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

--
--  Rendering
--

function widget:DrawWorld()
   local groups = spGetGroupList()
   for group, _ in pairs(groups) do
      units = spGetGroupUnits(group)
      for _, unit in ipairs(units) do
         if SpIsUnitInView(unit) then
            local ux, uy, uz = spGetUnitViewPosition(unit)
            glPushMatrix()
            glTranslate(ux, uy, uz)
            glBillboard()
            glColor(textColor)
            glText("" .. group, -10.0, -15.0, textSize, "cn")
            glPopMatrix()
         end
      end
   end
end
