local base = piece 'base' 
local turret = piece 'turret' 
local dish1 = piece 'dish1' 
local dish2 = piece 'dish2' 
local arm1 = piece 'arm1' 
local arm2 = piece 'arm2' 
local post = piece 'post' 

local open = 2
local close = 4

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

local function Activate()
        if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	
        Signal(close) --kill the closing animation if it is in process
        SetSignalMask(open) --set the signal to kill the opening animation
      
	Move( post , y_axis, 9.100000 , 16.000000 )
	WaitForMove(post, y_axis)
	Turn( dish1 , z_axis, math.rad(-(84.016484)), math.rad(147.000000) )
	Turn( dish2 , z_axis, math.rad(-(-84.016484)), math.rad(147.000000) )
	SetUnitValue(COB.ARMORED, 0) 
	WaitForTurn(dish1, z_axis)
	WaitForTurn(dish2, z_axis)
	Spin( turret , y_axis, -0.5 )
	Spin( arm1 , x_axis, 3.016484 )
	Spin( arm2 , x_axis, -3.016484 )
end

local function Deactivate()
	Signal(open) --kill the opening animation if it is in process
	SetSignalMask(close) --set the signal to kill the closing animation

	StopSpin (turret , y_axis )
	StopSpin (arm1 , x_axis)
	StopSpin (arm2 , x_axis)
	Turn( turret , y_axis, 0, math.rad(60.000000) )
	Turn( arm1 , x_axis, 0, math.rad(100.000000) )
	Turn( arm2 , x_axis, 0, math.rad(100.000000) )
	WaitForTurn(turret, y_axis)
	WaitForTurn(arm1, x_axis)
	WaitForTurn(arm2, x_axis)
	Turn( dish1 , z_axis, math.rad(-(0.000000)), math.rad(178.000000) )
	Turn( dish2 , z_axis, math.rad(-(0.000000)), math.rad(178.000000) )
	WaitForTurn(dish1, z_axis)
	WaitForTurn(dish2, z_axis)
	SetUnitValue(COB.ARMORED, 1) 
	Move( post , y_axis, 0.000000 , 19.000000 )
	WaitForMove(post, y_axis)
end

function script.Create()
	StartThread(StunnedCheck)
	StartThread(SmokeUnit)
	local health_percent = get_health_percent()
	while (health_percent < 100) do
		Sleep(250)
	end
  	StartThread(Activate)
end

function script.Activate()
	StartThread( Activate)
end

function script.Deactivate()
	StartThread( Deactivate)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if  (severity <= .25)  then
		Explode(arm1, SFX.FALL)
		Explode(arm2, SFX.FALL)
		Explode(base, SFX.NONE)
		Explode(dish1, SFX.NONE)
		Explode(dish2, SFX.NONE)
		Explode(post, SFX.NONE)
		Explode(turret, SFX.SHATTER)
		return 1
	
	elseif  (severity <= .50)  then
		Explode(arm1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(arm2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(base, SFX.NONE)
		Explode(dish1, SFX.NONE)
		Explode(dish2, SFX.NONE)
		Explode(post, SFX.NONE)
		Explode(turret, SFX.SHATTER)
		return 2
	else
	
	Explode(arm1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(arm2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(base, SFX.NONE)
	Explode(dish1, SFX.NONE)
	Explode(dish2, SFX.NONE)
	Explode(post, SFX.NONE)
	Explode(turret, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	return 3
	end
end