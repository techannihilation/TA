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

-- disable ForceDisableShaders
if Spring.GetConfigInt("ForceDisableShaders",0) == 1 then
	Spring.SetConfigInt("ForceDisableShaders", 0)
end

-- enable lua shaders
if not tonumber(Spring.GetConfigInt("LuaShaders",0) or 0) then
	Spring.SetConfigInt("LuaShaders", 1)
end

-- Disable PBO for intel GFX
if Platform.gpuVendor ~= "Nvidia" and Platform.gpuVendor ~= "AMD" then
	Spring.SetConfigInt("UsePBO", 0)
else
	Spring.SetConfigInt("UsePBO", 1)
end

-- Disable dynamic model lights
Spring.SetConfigInt("MaxDynamicModelLights", 0)

-- Enable deferred map/model rendering
Spring.SetConfigInt("AllowDeferredMapRendering", 1)
Spring.SetConfigInt("AllowDeferredModelRendering", 1)

-- Disable LoadingMT because: crashes on load, but fixed in 105.1.1-1422, redisable in 105.1.1-1432
Spring.SetConfigInt("LoadingMT", 0)

Spring.SetConfigInt("LuaGarbageCollectionMemLoadMult", 5)

Spring.SetConfigInt("LuaGarbageCollectionRunTimeMult", 2)

-- ground mesh detail
Spring.SetConfigInt("ROAM", 1)
if tonumber(Spring.GetConfigInt("GroundDetail", 1) or 1) < 150 then
	Spring.SetConfigInt("GroundDetail", 150)
end

-- This makes between-simframe interpolation smoother in mid-late game situations
Spring.SetConfigInt("SmoothTimeOffset", 2) -- New in BAR engine

-- This is needed for better profiling info, and (theoretically better frame timing).
-- Notably a decade ago windows had issues with this
Spring.SetConfigInt("UseHighResTimer", 1)  -- Default off

-- This changes the sleep time of the game server thread to make it wake up every 1.999 ms instead of the default 5.999 ms
-- This hopefully gets us less variance in issuing new sim frames
Spring.SetConfigInt("ServerSleepTime", 1)

Spring.SetConfigFloat("CrossAlpha", 0)	-- will be in effect next launch

Spring.SetConfigInt("UnitLodDist", 999999)

-- Configure sane keychain settings, this is to provide a standard experience
-- for users that is acceptable
local springKeyChainTimeout = 750 -- expected engine default in ms
local barKeyChainTimeout = 333 -- the setting we want to apply in ms
local userKeyChainTimeout = Spring.GetConfigInt("KeyChainTimeout")
-- Only apply BARs default if current setting is equal to engine default
-- Reason is engine is unable to distinguish between:
--   - user configuring the setting to be equal to default
--   - the actual setting being empty and engine using default
if userKeyChainTimeout == springKeyChainTimeout then
	-- Setting a standardized keychain timeout, 750ms is too long
	-- A side benefit of making it smaller is reduced complexity of actions handling
	-- since there are fewer complex and long chains between keystrokes
	Spring.SetConfigInt("KeyChainTimeout", barKeyChainTimeout)
end
