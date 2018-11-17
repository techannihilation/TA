local base = piece('base')

local function still_building_p()
	local _,_,_,_,buildProgress = Spring.GetUnitHealth(unitID);
	if (buildProgress == 1) then return false; else return true; end
end

local function get_health_percent()
	local health,maxHealth = Spring.GetUnitHealth(unitID);
	return ((health / maxHealth) * 100);
end


local function SmokeUnit(_, _, _)
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

function script.Create()
	StartThread(SmokeUnit)
end

function script.Killed(recentDamage, maxHealth)

	local severity = recentDamage/maxHealth
	if  severity <= .25  then
		Explode(base, SFX.NONE)
		--Spring.Echo("LOW")
		return 0
	elseif  severity <= .50  then
		Explode(base, SFX.NONE)
		--Spring.Echo("MED")
		return 0
	elseif  severity <= .99  then
		Explode(base, SFX.NONE)
		--Spring.Echo("BIG")
		return 0
	end
	Explode(base, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	--Spring.Echo("FULL")
	return 0
end
