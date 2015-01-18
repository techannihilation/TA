function gadget:GetInfo()
    return {
        name      = "Camera Height Api",
        desc      = "Provides camera height, to widgets",
        author    = "Nixtux", --based on opacity api by bluestone
        date      = "Nov 2014",
        license   = "GPL v3 or later",
        layer     = 0,
        enabled   = true  -- loaded by default
    }
end

--[[
    INSTRUCTIONS: Each widget needs its own Script.LuaUI call added to the list below
                 The widget then needs to use widgetHandler:RegisterGlobal and widgetHandler:DeregisterGlobal to allow api_camera_height to call it
]]

if gadgetHandler:IsSyncedCode() then
end

local SpGetCameraPosition = Spring.GetCameraPosition
local SpGetSmoothMeshHeight = Spring.GetSmoothMeshHeight
local MaxDist = 13000000

function IsTooHigh() 
  local cx, cy, cz = SpGetCameraPosition()
  local smoothheight = SpGetSmoothMeshHeight(cx,cz)
  local toohigh = ((cy-smoothheight)^2 >= MaxDist) 
  
  -- each widget needs its own Script.LuaUI call :(
  -- ScriptLuaUICall("GetHeight_teamplatter", toohigh)
  ScriptLuaUICall("GetHeight_teamplatter", toohigh)
  ScriptLuaUICall("GetHeight_projectilelights", toohigh)
  ScriptLuaUICall("GetHeight_morphindicator", toohigh)
  ScriptLuaUICall("GetHeight_allycursors", toohigh)
  ScriptLuaUICall("GetHeight_command_fx", toohigh)
end

function ScriptLuaUICall(name, toohigh)
    if Script.LuaUI(name) then
        Script.LuaUI[name](toohigh)
    end
end

function gadget:Update()
    IsTooHigh()
end
