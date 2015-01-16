local base = piece 'base' 
local body = piece 'body' 
local flare = piece 'flare' 
local top = piece 'top' 

-- Signal definitions
local SIG_AIM = 2

-- Effects
local ZAP   = 1024
local GLOW  = 1025

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
		if (sleep_time < 200) then sleep_time = 200; end
		Sleep(sleep_time);
	end
end

local function Zaps()
       	while still_building_p() do Sleep(400); end

	while (true) do
		EmitSfx( flare, ZAP)
		Sleep(800)
	end
end

function script.Create()
	StartThread(SmokeUnit)
	StartThread(Zaps)

end

function script.AimWeapon1(heading, pitch)
	Spring.UnitScript.Signal(SIG_AIM);
	Spring.UnitScript.SetSignalMask(SIG_AIM);
	Spring.UnitScript.Turn( flare , y_axis, math.rad(heading ), math.rad(220.000000) )
	Spring.UnitScript.WaitForTurn(flare, y_axis)
	return true
end

function script.FireWeapon1()
	EmitSfx( flare, GLOW)
end

function script.AimFromWeapon1()

	return flare
end

function script.QueryWeapon1()

	return flare
end

function script.SweetSpot(piecenum)

	return base
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if (severity <= .25) then
		Explode(base, SFX.SHATTER)
		return 1 -- corpsetype

	elseif (severity <= .5) then
		Explode(base, SFX.FALL + SFX.SMOKE)
		return 2 -- corpsetype
	else
		Explode(base, SFX.SMOKE + SFX.FIRE + SFX.EXPLODE)
		return 3 -- corpsetype
	end
end
