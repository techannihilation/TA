local base, sphere = piece('base', 'sphere')
local WHAT_DO = 1024
local  mmState

local function still_building_p()
	local _,_,_,_,buildProgress = Spring.GetUnitHealth(unitID);
	if (buildProgress == 1) then return false; else return true; end
end

local function get_health_percent()
	local health,maxHealth = Spring.GetUnitHealth(unitID);
	return ((health / maxHealth) * 100);
end


local function SmokeUnit(healthpercent, sleeptime, smoketype)
	while still_building_p() do Sleep(400); end
	
	while (true) do
		local health_percent = get_health_percent();
		
		if (health_percent < 66) then
			local smoketype = 258;
			if (math.random(1, 66) < health_percent) then smoketype = 257; end
			Spring.UnitScript.EmitSfx(base, smoketype);
		end
		
		local sleep_time = health_percent * 50;
		if (sleep_time < 200) then 
		  sleep_time = 200; end
		Sleep(sleep_time);
	end
end

local function ImAMetalMaker()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) ~= 0) do Sleep(150) end
	
	mmState = -1
	
	while  true  do
		if (GetUnitValue(WHAT_DO) == 1) then
			if mmState ~= 1 then 
				Move( sphere , y_axis, -1.0 , 5.2)
				mmState = 1
			end
		else
			if mmState ~= 0 then 
				Move( sphere , y_axis, -5.4 , 5.2)
				mmState = 0
			end
		end
		Sleep(1000)
	end
end

function script.Create()
	StartThread(SmokeUnit)
	StartThread(ImAMetalMaker)
end

function script.ImAMetalMaker()
	StartThread( ImAMetalMaker)
end

function script.Killed(recentDamage, maxHealth)

	local severity = recentDamage/maxHealth
	if  severity <= .25  then
		Explode(sphere, SFX.NONE)
		Explode(base, SFX.NONE )
		--Spring.Echo("LOW")
		return 0
	elseif  severity <= .50  then
		Explode(sphere, SFX.NONE)
		Explode(base, SFX.SHATTER)
		--Spring.Echo("MED")
		return 0
	elseif  severity <= .99  then
		Explode(sphere, sfxExplode)
		Explode(base, SFX.SHATTER)
		--Spring.Echo("BIG")
		return 0
	end
	Explode(base, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(sphere, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	--Spring.Echo("FULL")
	return 0
end
