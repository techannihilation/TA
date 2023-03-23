if Spring.GetConfigInt("AdvUnitShading", 0) == 0 then
	Spring.SetConfigInt("AdvUnitShading", 1)
end

if Spring.GetConfigInt("AdvMapShading", 0) == 0 then
	Spring.SetConfigInt("AdvMapShading", 1)
end

if Platform.gpuVendor ~= "Nvidia" and Platform.gpuVendor ~= "AMD" then
	Spring.SetConfigInt("UsePBO", 0)
else
	Spring.SetConfigInt("UsePBO", 1)
end

if gl.CreateShader then
	Spring.SetConfigInt("LuaShaders", 1)
	Spring.SetConfigInt("AllowDeferredMapRendering", 1)
	Spring.SetConfigInt("AllowDeferredModelRendering", 1)
else
	Spring.SetConfigInt("LuaShaders", 0)
	Spring.SetConfigInt("AllowDeferredMapRendering", 0)
	Spring.SetConfigInt("AllowDeferredModelRendering", 0)
end

if Spring.GetConfigInt("UnitIconDist", 0) == 0 then
	Spring.SetConfigInt("UnitIconDist", 120)
end

if Spring.GetConfigInt("Shadows", 0) == 2 then
	Spring.SetConfigInt("Shadows", 0)
end

Spring.SetConfigFloat("CrossAlpha", 0)
Spring.SetConfigInt("CamMode", 1)
Spring.SetConfigInt("EdgeMoveDynamic", 0)
Spring.SetConfigInt("EdgeMoveWidth", 0)
Spring.SetConfigInt("GrassDetail", 0)
Spring.SetConfigInt("GroundDetail", 80)
Spring.SetConfigInt("HardwareCursor", 1)
Spring.SetConfigInt("LoadingMT", 0)
Spring.SetConfigInt("LuaGarbageCollectionRunTimeMult", 2)
Spring.SetConfigInt("MapBorder", 1)
Spring.SetConfigInt("MaxDynamicModelLights", 0)
Spring.SetConfigInt("MaxNanoParticles", 0)
Spring.SetConfigInt("MaxParticles", 9000)
Spring.SetConfigInt("MiniMapDrawCommands", 0)
Spring.SetConfigInt("MiniMapDrawProjectiles", 0)
Spring.SetConfigInt("ROAM", 1)
Spring.SetConfigInt("ServerSleepTime", 1)
Spring.SetConfigInt("UnitLodDist", 999999)
Spring.SetConfigInt("UseHighResTimer", 1)
Spring.SetConfigInt("UseVBO", 1)
Spring.SetConfigInt("Vsync", 0)
Spring.SetConfigInt("VSync", 0) -- BAR