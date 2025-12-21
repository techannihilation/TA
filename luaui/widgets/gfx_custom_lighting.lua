--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function widget:GetInfo()
  return {
    name      = "Unit Sun Lighting Override",
    desc      = "Applies fixed unit ambient/diffuse/specular colors after the first gameframe, then unloads itself",
    author    = "[ur]uncle",
    date      = "2025-12-21",
    license   = "GPLv2",
    layer     = 0,
    enabled   = false,
  }
end

local SUN_SETTINGS = {
  unitAmbientColor  = { 1.104, 1.105, 0.973 },
  unitDiffuseColor  = { 0.0,   0.0,   0.0   },
  unitSpecularColor = { 1.181, 1.336, 1.214 },
}

local setSunLighting = Spring.SetSunLighting
local getGameFrame   = Spring.GetGameFrame
local removeWidget   = widgetHandler.RemoveWidget

local applied = false

local function ApplyAndUnload()
  setSunLighting(SUN_SETTINGS)
  applied = true
  widgetHandler:RemoveWidget()
end

function widget:GameFrame(n)
  if (not applied) and (n >= 1) then
    ApplyAndUnload()
  end
end

function widget:Initialize()
  if getGameFrame() >= 1 then
    ApplyAndUnload()
  end
end
