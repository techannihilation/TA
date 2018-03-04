 
local base = piece 'base' 
local body = piece 'body' 
local arm = piece 'arm' 
local antenne = piece 'antenne' 
local pan1 = piece 'pan1' 
local pan2 = piece 'pan2' 
local pan3 = piece 'pan3' 
local pan4 = piece 'pan4' 
local pan5 = piece 'pan5' 
local pan6 = piece 'pan6' 
local pan7 = piece 'pan7' 
local pan8 = piece 'pan8' 
local light = piece 'light' 
local plate = piece 'plate' 
local rdoor = piece 'rdoor' 
local ldoor = piece 'ldoor' 

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
  --[[
  
	dont-cache rdoor
	dont-cache ldoor
	dont-cache plate
	dont-cache light
	dont-cache arm
	dont-cache antenne
	dont-cache pan1
	dont-cache pan2
	dont-cache pan3
	dont-cache pan4
	dont-cache pan5
	dont-cache pan6
	dont-cache pan7
	dont-cache pan8
  --]]
	SetUnitValue(COB.ARMORED, 0) 
	
		Turn( rdoor , z_axis, math.rad(-(-90.000000)), math.rad(35.000000) )
		Turn( ldoor , z_axis, math.rad(-(90.000000)), math.rad(35.000000) )
		WaitForTurn(ldoor, z_axis)
	
		Move( plate , y_axis, 9.000000 , 5.000000 )
		WaitForMove(plate, y_axis)
	
		Turn( arm , x_axis, math.rad(-130.000000), math.rad(33.000000) )
		Sleep(3000)
	
		Turn( antenne , x_axis, math.rad(-60.000000), math.rad(45.000000) )
		Turn( pan1 , y_axis, math.rad(-22.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan2 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan3 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan4 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan5 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan6 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan7 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
		Turn( pan8 , y_axis, math.rad(-45.000000), math.rad(30.000000) )
		Sleep(350)
	
	Sleep(53)
end

local function Deactivate()

		Signal(open) --kill the opening animation if it is in process
		SetSignalMask(close) --set the signal to kill the closing animation
	
		Turn( pan8 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan7 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan6 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan5 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan4 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan3 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan2 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( pan1 , y_axis, 0, math.rad(45.000000) )
		Sleep(200)
		Turn( antenne , x_axis, 0, math.rad(45.000000) )
		Sleep(500)
		
		Turn( arm , x_axis, math.rad(10.000000), math.rad(33.000000) )
		WaitForTurn(arm, x_axis)
	
		Move( plate , y_axis, 0.000000 , 5.000000 )
		WaitForMove(plate, y_axis)
		
		Turn( rdoor , z_axis, math.rad(-(0.000000)), math.rad(35.000000) )
		Turn( ldoor , z_axis, math.rad(-(0.000000)), math.rad(35.000000) )
		WaitForTurn(ldoor, z_axis)
	
	--[[
	cache rdoor
	cache ldoor
	cache plate
	cache light
	cache arm
	cache antenne
	cache pan1
	cache pan2
	cache pan3
	cache pan4
	cache pan5
	cache pan6
	cache pan7
	cache pan8
	--]]
	SetUnitValue(COB.ARMORED, 1) 
	Sleep(58)
end

function script.Activate()
	StartThread( Activate)
end

function script.Deactivate()
	StartThread( Deactivate)
end
--[[
function script.HitByWeapon(anglex, anglez)

	var Func_Var_3
	Func_Var_3 =  select(1, Spring.GetUnitHealth(unitID) ) / select(2, Spring.GetUnitHealth(unitID) )
	if  Func_Var_3 <= 60  then
	
		if  Static_Var_3 == 0  then
		
			Static_Var_3 = 1
			Hide( pan5)
			Explode(pan5, SFX.FALL + SFX.SHATTER  + SFX.SMOKE )
		end
	end
	if  Func_Var_3 <= 50  then
	
		if  Static_Var_4 == 0  then
		
			Static_Var_4 = 1
			Hide( antenne)
			Explode(antenne, SFX.FALL + SFX.SHATTER  + SFX.SMOKE )
		end
	end
	if  Func_Var_3 <= 35  then
	
		if  Static_Var_5 == 0  then
		
			Static_Var_5 = 1
			Hide( rdoor)
			Explode(rdoor, SFX.FALL + SFX.SHATTER  + SFX.SMOKE )
		end
	end
	Signal( 16)
	SetSignalMask( 16)
	set ACTIVATION to 0
	Sleep(8000)
	set ACTIVATION to 1
end
--]]

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

		Explode(body, SFX.NONE)
		Explode(pan1, SFX.FALL)
		Explode(pan2, SFX.FALL)
		Explode(pan3, SFX.FALL)
		Explode(pan4, SFX.FALL)
		Explode(pan5, SFX.FALL)
		Explode(arm, SFX.SHATTER)
		Explode(pan6, SFX.NONE)
		Explode(pan7, SFX.NONE)
		Explode(pan8, SFX.NONE)
		return 1
	
	elseif  (severity <= .50)  then
	
		Explode(arm, SFX.NONE)
		Explode(pan1, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
		Explode(pan2, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
		Explode(pan3, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
		Explode(pan4, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
		Explode(pan5, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
		Explode(body, SFX.SHATTER)
		Explode(pan6, SFX.NONE)
		Explode(pan7, SFX.NONE)
		Explode(pan8, SFX.NONE)
		return 2
	else
	
	Explode(base, SFX.NONE)
	Explode(arm, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(pan1, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(pan2, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(pan3, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(pan4, SFX.FALL + SFX.FIRE  + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(body, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(pan6, SFX.NONE)
	Explode(pan7, SFX.NONE)
	Explode(pan8, SFX.NONE)
	return 3
	end
end
