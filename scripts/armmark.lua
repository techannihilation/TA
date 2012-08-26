local head = piece 'head' 
local rthigh = piece 'rthigh' 
local rshin = piece 'rshin' 
local rfoot = piece 'rfoot' 
local lshin = piece 'lshin' 
local lfoot = piece 'lfoot' 
local lthigh = piece 'lthigh' 
local rdish = piece 'rdish' 
local ldish = piece 'ldish' 
local base = piece 'base' 

-- Signal definitions
local SIG_ACTIVATE = 2
local SIG_WALK = 4

local bMoving
local Static_Var_2
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



local function walk2()
	SetSignalMask( SIG_WALK)

	while true do
	
		Turn( head , x_axis, math.rad(5.890110) )
		Turn( head , y_axis, math.rad(-5.357143) )
		Turn( rthigh , x_axis, math.rad(-49.065934) )
		Turn( rshin , x_axis, math.rad(40.142857) )
		Turn( rfoot , x_axis, math.rad(-8.109890) )
		Turn( lshin , x_axis, math.rad(60.010989) )
		Turn( lfoot , x_axis, math.rad(-54.335165) )
		Sleep(140)
		Turn( head , x_axis, math.rad(10.175824) )
		Turn( head , y_axis, math.rad(-10.175824) )
		Turn( lthigh , x_axis, math.rad(7.703297) )
		Turn( rthigh , x_axis, math.rad(-42.170330) )
		Turn( rshin , x_axis, math.rad(50.280220) )
		Turn( rfoot , x_axis, math.rad(-16.824176) )
		Turn( lshin , x_axis, math.rad(64.065934) )
		Turn( lfoot , x_axis, math.rad(-23.109890) )
		Sleep(148)
		Turn( head , x_axis, math.rad(15.000000) )
		Turn( head , y_axis, math.rad(-15.000000) )
		Turn( lthigh , x_axis, math.rad(15.406593) )
		Turn( rthigh , x_axis, math.rad(-35.274725) )
		Turn( rshin , x_axis, math.rad(60.417582) )
		Turn( rfoot , x_axis, math.rad(-25.543956) )
		Turn( lshin , x_axis, math.rad(68.120879) )
		Turn( lfoot , x_axis, math.rad(8.109890) )
		Sleep(145)
		Turn( head , x_axis, math.rad(7.500000) )
		Turn( head , y_axis, math.rad(-8.032967) )
		Turn( lthigh , x_axis, math.rad(-16.824176) )
		Turn( rthigh , x_axis, math.rad(-17.637363) )
		Turn( rfoot , x_axis, math.rad(-39.939560) )
		Turn( lshin , x_axis, math.rad(54.131868) )
		Turn( lfoot , x_axis, 0 )
		Sleep(146)
		Turn( head , x_axis, math.rad(5.357143) )
		Turn( head , y_axis, math.rad(5.357143) )
		Turn( lthigh , x_axis, math.rad(-49.065934) )
		Turn( rthigh , x_axis, 0 )
		Turn( rfoot , x_axis, math.rad(-54.335165) )
		Turn( lshin , x_axis, math.rad(40.142857) )
		Turn( lfoot , x_axis, math.rad(-8.109890) )
		Sleep(145)
		Turn( head , x_axis, math.rad(10.175824) )
		Turn( head , y_axis, math.rad(10.175824) )
		Turn( lthigh , x_axis, math.rad(-42.170330) )
		Turn( rthigh , x_axis, math.rad(7.500000) )
		Turn( rshin , x_axis, math.rad(64.269231) )
		Turn( rfoot , x_axis, math.rad(-23.109890) )
		Turn( lshin , x_axis, math.rad(50.076923) )
		Turn( lfoot , x_axis, math.rad(-16.620879) )
		Sleep(147)
		Turn( head , x_axis, math.rad(15.000000) )
		Turn( head , y_axis, math.rad(15.000000) )
		Turn( lthigh , x_axis, math.rad(-35.274725) )
		Turn( rthigh , x_axis, math.rad(15.000000) )
		Turn( rshin , x_axis, math.rad(68.120879) )
		Turn( rfoot , x_axis, math.rad(8.109890) )
		Turn( lshin , x_axis, math.rad(60.010989) )
		Turn( lfoot , x_axis, math.rad(-25.137363) )
	Turn( head , x_axis, math.rad(8.571429) )
	Turn( head , y_axis, math.rad(8.571429) )
	Turn( lthigh , x_axis, math.rad(-17.637363) )
	Turn( rthigh , x_axis, math.rad(-17.027473) )
	Turn( rshin , x_axis, math.rad(54.131868) )
	Turn( rfoot , x_axis, 0 )
	Turn( lshin , x_axis, math.rad(60.010989) )
	Turn( lfoot , x_axis, math.rad(-39.736264) )
	end
end

local function stand()
	SetSignalMask( SIG_MOVE)
	Sleep(200)
end

function script.Create()
	StartThread(SmokeUnit)
	StartThread(StunnedCheck)
end

local function Activate()

        if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	Spin( rdish , x_axis, 7.021978 )
	Spin( ldish , x_axis, -7.021978 )
end

local function Deactivate()
	StopSpin( rdish , x_axis, 7.021978 )
	StopSpin( ldish , x_axis, -7.021978 )
	Turn( rdish , x_axis, 90, math.rad(90.0) )
	Turn( ldish , x_axis, -0, math.rad(90.0) )
	WaitForTurn(rdish, x_axis)
	WaitForTurn(ldish, x_axis)
end

function script.Activate()
	StartThread( Activate)
end

function script.Deactivate()
	StartThread( Deactivate)
end

function script.StartMoving()

	StartThread(walk2)
end

function script.StopMoving()
	Signal( SIG_WALK)
	StartThread(stand)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if  (severity <= .25)  then
		Explode(base, SFX.FALL)
		Explode(head, SFX.SHATTER)
		Explode(ldish, SFX.FALL)
		Explode(lfoot, SFX.FALL)
		Explode(lshin, SFX.FALL)
		Explode(lthigh, SFX.FALL)
		Explode(rdish, SFX.FALL)
		Explode(rfoot, SFX.FALL)
		Explode(rshin, SFX.FALL)
		Explode(rthigh, SFX.FALL)
		return 1
	
	elseif  (severity <= .50)  then
		Explode(base, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(head, SFX.SHATTER)
		Explode(ldish, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(lfoot, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(lshin, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(lthigh, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(rdish, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(rfoot, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(rshin, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		Explode(rthigh, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		return 2
	else
	
	Explode(base, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(head, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(ldish, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(lfoot, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(lshin, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(lthigh, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(rdish, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(rfoot, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(rshin, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	Explode(rthigh, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
	return 3
	end
end

