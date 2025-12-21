--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function widget:GetInfo()
  return {
    name      = "Unit Sun Lighting Override",
    desc      = "Applies unit ambient/diffuse/specular colors",
    author    = "[ur]uncle",
    date      = "2025-12-21",
    license   = "GPLv2",
    layer     = 0,
    enabled   = true,
  }
end

local SUN_SETTINGS = {
  unitAmbientColor  = { 1.104, 1.105, 0.973 },
  unitDiffuseColor  = { 0.0,   0.0,   0.0   },
  unitSpecularColor = { 1.181, 1.336, 1.214 },
}

local setSunLighting = Spring.SetSunLighting
local getGameFrame   = Spring.GetGameFrame

local function ApplyAndUnload()
  setSunLighting(SUN_SETTINGS)
  widgetHandler:RemoveWidget()
end

function widget:GameFrame(n)
  if (n >= 1) then
    ApplyAndUnload()
  end
end

function widget:Initialize()
  if getGameFrame() >= 1 then
    ApplyAndUnload()
  end
end
