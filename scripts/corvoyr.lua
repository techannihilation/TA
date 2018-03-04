local body = piece 'body' 
local thigh1 = piece 'thigh1' 
local thigh2 = piece 'thigh2' 
local leg2 = piece 'leg2' 
local foot2 = piece 'foot2' 
local leg1 = piece 'leg1' 
local foot1 = piece 'foot1' 
local dish1 = piece 'dish1' 
local arm1 = piece 'arm1' 
local arm2 = piece 'arm2' 

local  bMoving

-- Signal definitions
local SIG_WALK = 2
local SIG_ACTIVATE = 4

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

local function walkscr()
	SetSignalMask( SIG_WALK)

	while true do
		Move( body , y_axis, -0.450000  )
		Move( body , y_axis, -0.350000 , 1.219513 )
		Move( thigh1 , x_axis, 0.000000  )
		Move( thigh2 , x_axis, 0.000000  )
		Move( leg2 , y_axis, 0.000000  )
		Move( leg2 , z_axis, 0.000000  )
		Move( foot2 , z_axis, 0.000000  )
		Move( leg1 , y_axis, 0.000000  )
		Move( leg1 , z_axis, 0.000000  )
		Move( foot1 , z_axis, 0.000000  )
		Turn( body , z_axis, math.rad(-8.703297) )
		Turn( body , z_axis, math.rad(-(-5.538462)), math.rad(38.604396) )
		Turn( thigh1 , x_axis, math.rad(-27.697802) )
		Turn( thigh1 , x_axis, math.rad(-11.076923), math.rad(202.675824) )
		Turn( thigh2 , x_axis, math.rad(20.302198) )
		Turn( thigh2 , x_axis, math.rad(14.593407), math.rad(69.560440) )
		Turn( leg2 , x_axis, math.rad(0.538462) )
		Turn( leg2 , x_axis, math.rad(-13.989011), math.rad(177.225275) )
		Turn( foot2 , x_axis, math.rad(-2.884615) )
		Turn( foot2 , x_axis, math.rad(12.164835), math.rad(183.532967) )
		Turn( leg1 , x_axis, math.rad(3.956044) )
		Turn( leg1 , x_axis, math.rad(2.373626), math.rad(19.302198) )
		Turn( foot1 , x_axis, math.rad(22.950549) )
		Turn( foot1 , x_axis, math.rad(7.120879), math.rad(193.021978) )
		Sleep(82)
		Move( body , y_axis, -0.300000 , 0.543475 )
		Turn( body , z_axis, math.rad(-(-3.956044)), math.rad(17.203297) )
		Turn( thigh1 , x_axis, math.rad(2.373626), math.rad(146.236264) )
		Turn( thigh2 , x_axis, math.rad(1.214286), math.rad(145.450549) )
		Turn( foot2 , x_axis, math.rad(19.697802), math.rad(81.890110) )
		Turn( leg1 , x_axis, math.rad(4.747253), math.rad(25.802198) )
		Turn( foot1 , x_axis, math.rad(-6.329670), math.rad(146.236264) )
		Move( body , y_axis, 0.000000 , 3.125000 )
		Turn( body , z_axis, math.rad(-(-0.791209)), math.rad(32.972527) )
		Turn( thigh1 , x_axis, math.rad(10.285714), math.rad(82.434066) )
		Turn( thigh2 , x_axis, math.rad(-26.532967), math.rad(289.071429) )
		Turn( leg2 , x_axis, math.rad(-10.335165), math.rad(38.010989) )
		Turn( foot2 , x_axis, math.rad(31.016484), math.rad(117.928571) )
		Turn( leg1 , x_axis, math.rad(15.032967), math.rad(107.164835) )
		Turn( foot1 , x_axis, math.rad(-25.324176), math.rad(197.846154) )
		Sleep(96)
		Move( body , y_axis, -0.850000 , 9.139789 )
		Turn( body , z_axis, math.rad(-(12.659341)), math.rad(144.664835) )
		Turn( thigh1 , x_axis, math.rad(21.362637), math.rad(119.131868) )
		Turn( thigh2 , x_axis, math.rad(-58.043956), math.rad(338.835165) )
		Turn( leg2 , x_axis, math.rad(21.115385), math.rad(338.274725) )
		Turn( foot2 , x_axis, math.rad(36.681319), math.rad(60.901099) )
		Turn( leg1 , x_axis, math.rad(16.615385), math.rad(17.016484) )
		Turn( foot1 , x_axis, math.rad(-5.538462), math.rad(212.741758) )
		Sleep(93)
		Move( body , y_axis, -0.550000 , 3.333337 )
		Turn( body , z_axis, math.rad(-(9.494505)), math.rad(35.170330) )
		Turn( thigh1 , x_axis, math.rad(18.197802), math.rad(35.170330) )
		Turn( thigh2 , x_axis, math.rad(-40.631868), math.rad(193.450549) )
		Turn( leg2 , x_axis, math.rad(12.412088), math.rad(96.725275) )
		Turn( foot2 , x_axis, math.rad(27.978022), math.rad(96.725275) )
		Turn( leg1 , x_axis, math.rad(7.120879), math.rad(105.516484) )
		Turn( foot1 , x_axis, math.rad(-11.076923), math.rad(61.549451) )
		Sleep(90)
		Move( body , y_axis, -0.350000 , 2.127649 )
		Turn( body , z_axis, math.rad(-(5.538462)), math.rad(42.093407) )
		Turn( thigh1 , x_axis, math.rad(9.494505), math.rad(92.609890) )
		Turn( thigh2 , x_axis, math.rad(-17.681319), math.rad(244.153846) )
		Turn( leg2 , x_axis, math.rad(3.703297), math.rad(92.609890) )
		Turn( foot2 , x_axis, math.rad(13.730769), math.rad(151.543956) )
		Turn( leg1 , x_axis, math.rad(-4.747253), math.rad(126.285714) )
		Turn( foot1 , x_axis, math.rad(10.285714), math.rad(227.313187) )
		Sleep(94)
		Move( body , y_axis, -0.150000 , 2.127661 )
		Turn( thigh1 , x_axis, math.rad(-11.868132), math.rad(227.313187) )
		Turn( thigh2 , x_axis, math.rad(3.681319), math.rad(227.313187) )
		Turn( leg2 , x_axis, math.rad(2.912088), math.rad(8.417582) )
		Turn( foot2 , x_axis, math.rad(-7.631868), math.rad(227.313187) )
		Turn( leg1 , x_axis, math.rad(-4.747253), 0 )
		Turn( foot1 , x_axis, math.rad(17.406593), math.rad(75.769231) )
		Sleep(94)
		Move( body , y_axis, 0.000000 , 1.612909 )
		Turn( body , z_axis, math.rad(-(0.000000)), math.rad(59.565934) )
		Turn( thigh1 , x_axis, math.rad(-27.697802), math.rad(170.192308) )
		Turn( thigh2 , x_axis, math.rad(17.131868), math.rad(144.664835) )
		Turn( leg2 , x_axis, math.rad(13.203297), math.rad(110.620879) )
		Turn( foot2 , x_axis, math.rad(-14.752747), math.rad(76.582418) )
		Turn( foot1 , x_axis, math.rad(23.741758), math.rad(68.076923) )
		Sleep(93)
		Move( body , y_axis, -0.850000 , 9.042548 )
		Turn( body , z_axis, math.rad(-(-8.703297)), math.rad(92.609890) )
		Turn( thigh1 , x_axis, math.rad(-53.021978), math.rad(269.412088) )
		Turn( thigh2 , x_axis, math.rad(22.675824), math.rad(58.934066) )
		Turn( foot2 , x_axis, math.rad(-11.587912), math.rad(33.675824) )
		Turn( leg1 , x_axis, math.rad(17.406593), math.rad(235.736264) )
		Turn( foot1 , x_axis, math.rad(35.609890), math.rad(126.285714) )
		Sleep(94)
	end
	Sleep(94)
end

local function stand()
			SetSignalMask( SIG_MOVE)
			Turn( body , z_axis, math.rad(-(0.000000)), math.rad(200.043956) )
			Move( body , y_axis, 0.000000 , 1.000000 )
			Turn( leg1 , x_axis, 0, math.rad(200.043956) )
			Turn( foot1 , x_axis, 0, math.rad(200.043956) )
			Turn( thigh2 , x_axis, 0, math.rad(200.043956) )
			Turn( leg2 , x_axis, 0, math.rad(200.043956) )
			Turn( foot2 , x_axis, 0, math.rad(200.043956) )
			Sleep(100)
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
			Spring.UnitScript.EmitSfx(body, smoketype);
		end
		
		local sleep_time = health_percent * 50;
		if (sleep_time < 200) then 
		  sleep_time = 200; end
		Sleep(sleep_time);
	end
end



local function spin()
	if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	Signal( SIG_ACTIVATE)
	SetSignalMask( SIG_ACTIVATE)
	Spin( dish1 , y_axis, math.rad(100))
end

local function holdSpin()
	Signal( SIG_ACTIVATE)
	SetSignalMask( SIG_ACTIVATE)
	Turn( dish1 , y_axis, 0, math.rad(100))
	WaitForTurn(dish1, y_axis)
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

function script.Deactivate()
	StartThread(holdSpin)
end

function script.StartMoving()
	StartThread(walkscr)
end

function script.StopMoving()
  	Signal( SIG_WALK)
	StartThread(stand)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth

	if  severity <= 0.25  then
		Explode(arm1, SFX.NONE)
		Explode(arm2, SFX.NONE)
		Explode(body, SFX.NONE)
		Explode(dish1, SFX.NONE)
		Explode(foot1, SFX.NONE)
		Explode(foot2, SFX.NONE)
		Explode(leg1, SFX.NONE)
		Explode(leg2, SFX.NONE)
		Explode(thigh1, SFX.NONE)
		Explode(thigh2, SFX.NONE)
		return 1
	end
	
	if  severity <= 0.50  then
		Explode(arm1, SFX.FALL)
		Explode(arm2, SFX.FALL)
		Explode(body, SFX.NONE)
		Explode(dish1, SFX.SHATTER)
		Explode(foot1, SFX.FALL)
		Explode(foot2, SFX.FALL)
		Explode(leg1, SFX.FALL)
		Explode(leg2, SFX.FALL)
		Explode(thigh1, SFX.FALL)
		Explode(thigh2, SFX.FALL)
		return 2
	end
	
	if  severity <= 0.99  then
		Explode(arm1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(arm2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(body, SFX.NONE)
		Explode(dish1, SFX.SHATTER)
		Explode(foot1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(foot2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(leg1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(leg2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(thigh1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(thigh2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		return 3
	end
	
	Explode(arm1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(arm2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(body, SFX.NONE)
	Explode(dish1, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(foot1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(foot2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(leg1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(leg2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(thigh1, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(thigh2, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	return 3
end
