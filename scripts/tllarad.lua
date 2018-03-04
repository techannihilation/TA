local base = piece 'base' 
local body = piece 'body' 
local top = piece 'top' 
local tige1 = piece 'tige1' 
local tige2 = piece 'tige2' 
local tige3 = piece 'tige3' 
local dish1 = piece 'dish1' 
local dish2 = piece 'dish2' 
local dish3 = piece 'dish3' 
local dish4 = piece 'dish4' 


local open = 2
local close = 4


local spGetUnitIsStunned = Spring.GetUnitIsStunned
local stunned = 0

--[[
function script.HitByWeapon(anglex, anglez)

	var Func_Var_3
	Func_Var_3 =  select(1, Spring.GetUnitHealth(unitID) ) / select(2, Spring.GetUnitHealth(unitID) )
	if  Func_Var_3 <= 60  then
	
		if  Static_Var_3 == 0  then
		
			Static_Var_3 = 1
			Hide( dish4)
			Explode(dish4, SFX.FALL + SFX.SHATTER  + SFX.SMOKE )
		end
	end
	if  Func_Var_3 <= 50  then
	
		if  Static_Var_4 == 0  then
		
			Static_Var_4 = 1
			Hide( dish1)
			Explode(dish1, SFX.FALL + SFX.SHATTER  + SFX.SMOKE )
		end
	end
	Signal( 16)
	SetSignalMask( 16)
	set ACTIVATION to 0
	Sleep(8000)
	set ACTIVATION to 1
end
==]]
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
  --[[
	dont-cache dish1
	dont-cache dish2
	dont-cache dish3
	dont-cache dish4
	dont-cache top
	  --]]
	SetUnitValue(COB.ARMORED, 0) 
	Move( tige1 , y_axis, 18.000000 , 5.000000 )
	Sleep(450)
	Move( tige2 , y_axis, 18.000000 , 5.000000 )
	Sleep(450)
	Move( tige3 , y_axis, 18.000000 , 5.000000 )
	Sleep(450)
	Turn( dish1 , z_axis, math.rad(-(-120.000000)), math.rad(15.000000) )
	Turn( dish4 , z_axis, math.rad(-(120.000000)), math.rad(15.000000) )
	Turn( dish2 , x_axis, math.rad(120.000000), math.rad(15.000000) )
	Turn( dish3 , x_axis, math.rad(-120.000000), math.rad(15.000000) )
	Spin( top , y_axis, 0.900000 )
end

local function Deactivate()

		Signal(open) --kill the opening animation if it is in process
		SetSignalMask(close) --set the signal to kill the closing animation
	--[[

	cache dish1
	cache dish2
	cache dish3
	cache dish4
	cache top --]]
		
	StopSpin(top ,y_axis , 10.000000 )
	Turn( top , y_axis, 0, math.rad(150.000000) )
	Turn( dish1 , z_axis, math.rad(-(0.000000)), math.rad(65.000000) )
	Turn( dish4 , z_axis, math.rad(-(0.000000)), math.rad(65.000000) )
	Turn( dish2 , x_axis, 0, math.rad(65.000000) )
	Turn( dish3 , x_axis, 0, math.rad(65.000000) )
	WaitForTurn(top, y_axis)
	Move( tige3 , y_axis, 0.000000 , 5.000000 )
	Sleep(450)
	Move( tige2 , y_axis, 0.000000 , 5.000000 )
	Sleep(450)
	Move( tige1 , y_axis, 0.000000 , 5.000000 )
	Sleep(450)
	SetUnitValue(COB.ARMORED, 1) 
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

	
		Explode(top, SFX.NONE)
		Explode(dish1, SFX.NONE)
		Explode(dish2, SFX.NONE)
		Explode(dish3, SFX.NONE)
		Explode(dish4, SFX.NONE)
		Explode(dish3, SFX.NONE)
		Explode(tige2, SFX.NONE)
		return 1
	
	elseif  (severity <= .50)  then
	
		Explode(body, SFX.NONE)
		Explode(dish1, SFX.NONE)
		Explode(dish2, SFX.NONE)
		Explode(dish3, SFX.NONE)
		Explode(dish4, SFX.NONE)
		Explode(top, SFX.SHATTER)
		return 2
		
	else
		
	Explode(dish1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(dish2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(dish3, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(dish4, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(top, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(tige2, SFX.NONE)
	Explode(tige1, SFX.NONE)
	Explode(body, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	return 3
	end
end
