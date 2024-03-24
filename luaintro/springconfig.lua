--------------------------------------------------------------------------------------------
--- set some spring settings before the game/engine is really loaded yet
--------------------------------------------------------------------------------------------

-- adv unit shading
if not tonumber(Spring.GetConfigInt("AdvUnitShading",0) or 0) then
	Spring.SetConfigInt("AdvUnitShading", 1)
end

-- adv map shading
if not tonumber(Spring.GetConfigInt("AdvMapShading",0) or 0) then
	Spring.SetConfigInt("AdvMapShading", 1)
end

if Spring.GetConfigInt("AdvModelShading", 0) ~= 1 then
	Spring.SetConfigInt("AdvModelShading", 1)
end

-- disable forcedisableshaders
if Spring.GetConfigInt("ForceDisableShaders",0) == 1 then
	Spring.SetConfigInt("ForceDisableShaders", 0)
end

-- enable lua shaders
if not tonumber(Spring.GetConfigInt("LuaShaders",0) or 0) then
	Spring.SetConfigInt("LuaShaders", 1)
end

-- disable dynamic model lights
Spring.SetConfigInt("MaxDynamicModelLights", 0)

-- enable deferred map/model rendering
Spring.SetConfigInt("AllowDeferredMapRendering", 1)
Spring.SetConfigInt("AllowDeferredModelRendering", 1)

-- experimental option to load the game in separate thread.
Spring.SetConfigInt("LoadingMT", 0) -- defaults to 0

-- how much the amount of lua memory in use increases the rate of garbage collection.
Spring.SetConfigFloat("LuaGarbageCollectionMemLoadMult", 1.10) -- defaults to 1.33

--how many milliseconds the garbage collected can run for in each gc cycle
Spring.SetConfigFloat("LuaGarbageCollectionRunTimeMult", 2.0) -- defaults to 5.0

-- ground mesh detail
Spring.SetConfigInt("ROAM", 1)
if tonumber(Spring.GetConfigInt("GroundDetail", 1) or 1) < 100 then
	Spring.SetConfigInt("GroundDetail", 100)
end

Spring.SetConfigInt("GrassDetail", 0)

-- this makes between-simframe interpolation smoother in mid-late game situations
-- frametimeoffset smoothing, 0 = off (old version), -1 = forced 0.5,  1-20 smooth, recommended = 2-3");
Spring.SetConfigInt("SmoothTimeOffset", 3) -- defaults to 0

-- this is needed for better profiling info, and (theoretically better frame timing).
-- notably a decade ago windows had issues with this
-- on Windows, sets whether spring will use low- or high-resolution timer functions for tasks like graphical interpolation between game frames
Spring.SetConfigInt("UseHighResTimer", 1)  -- default to 0

-- number of milliseconds to sleep per tick for the server thread. lower values have marginally higher cpu load, while high values can introduce additional latency.
Spring.SetConfigInt("ServerSleepTime", 2) -- defaults to 5

Spring.SetConfigFloat("CrossAlpha", 0)	-- will be in effect next launch

Spring.SetConfigInt("lupsenablerefraction", 0)
Spring.SetConfigInt("lupsenablereflection", 0)

Spring.SetConfigInt("MaxNanoParticles", 0)

Spring.SetConfigInt("MiniMapDrawProjectiles", 0)
Spring.SetConfigInt("UnitIconsAsUI", 0)