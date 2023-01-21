local base = piece('base') 
local dish = piece('dish')

-- Signal definitions
local SIG_ACTIVATE = 2


local spGetUnitIsStunned = Spring.GetUnitIsStunned
local stunned = 0

local function StunnedCheck()
	while true do
		if select(1, spGetUnitIsStunned(unitID)) and GetUnitValue(COB.ACTIVATION) == 1  then
			if  stunned and stunned == 1 then 
				stunned = 1;
				SetUnitValue(COB.ACTIVATION, 0)
			end
			stunned = 1;
		elseif stunned and stunned == 1  and not select(1, spGetUnitIsStunned(unitID)) and GetUnitValue(COB.ACTIVATION) ~= 1 then 
			stunned = 0;
			SetUnitValue(COB.ACTIVATION, 1) 
		end
		Sleep(250);
	end
end

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

local function hit(anglex, anglez)
	Turn( base , z_axis, math.rad(-(anglez )), math.rad(105.000000) )
	Turn( base , x_axis, math.rad(anglex ), math.rad(105.000000) )
	WaitForTurn(base, z_axis)
	WaitForTurn(base, x_axis)
	Turn( base , z_axis, math.rad(-(0.000000)), math.rad(30.000000) )
	Turn( base , x_axis, 0, math.rad(30.000000) )
end

function script.HitByWeapon(anglex, anglez)
	StartThread(SmokeUnit, anglex, anglez)
	
end

local function spin()
	if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	Signal( SIG_ACTIVATE)
	SetSignalMask( SIG_ACTIVATE)
	Spin( dish , y_axis, math.rad(100))
end

function script.Create()
	StartThread(StunnedCheck)
	StartThread(SmokeUnit)
	local health_percent = get_health_percent()
	while (health_percent < 100) do
		Sleep(250)
	end
  	StartThread(spin)
end

function script.Activate()
	StartThread(spin)
end

local function holdSpin()
	Signal( SIG_ACTIVATE)
	SetSignalMask( SIG_ACTIVATE)
	Turn( dish , y_axis, 0, math.rad(100))
	WaitForTurn(dish, y_axis)
end

function script.Deactivate()
	StartThread(holdSpin)
end

function script.Killed(recentDamage, maxHealth)

local severity = recentDamage/maxHealth
	if  severity <= 0.25  then
		Explode(dish, SFX.NONE)
		Explode(base, SFX.NONE )
		--Spring.Echo("LOW")
		return 1
	elseif  severity <= 0.50  then
		Explode(dish, SFX.NONE)
		Explode(base, SFX.SHATTER)
		--Spring.Echo("MED")
		return 2
	elseif  severity <= 0.99  then
		Explode(dish, SFX.EXPLODE_ON_HIT)
		Explode(base, SFX.SHATTER)
		--Spring.Echo("BIG")
		return 3
	end
	Explode(base, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(dish, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	return 3
end
