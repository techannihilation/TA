local base = piece 'base' 
local pelvis = piece 'pelvis' 
local rthigh = piece 'rthigh' 
local lthigh = piece 'lthigh' 
local rleg = piece 'rleg' 
local lleg = piece 'lleg' 
local rfoot = piece 'rfoot' 
local lfoot = piece 'lfoot' 
local tige = piece 'tige' 
local dish = piece 'dish' 
local d1 = piece 'd1' 
local d2 = piece 'd2' 
local plate = piece 'plate' 


-- Signal definitions
local SIG_WALK = 2

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

local function Moving()
  
	SetSignalMask( SIG_WALK)

	while true do
	Move( pelvis , y_axis, 1.200000  )
	Move( lleg , y_axis, 0.000000  )
	Move( lfoot , z_axis, 0.000000  )
	Move( rleg , y_axis, 0.000000  )
	Move( rfoot , z_axis, 0.000000  )
	Turn( plate , z_axis, math.rad(8.076923) )
	Turn( rthigh , x_axis, math.rad(49.928571) )
	Turn( lthigh , x_axis, math.rad(-36.565934) )
	Turn( lleg , x_axis, math.rad(43.236264) )
	Turn( lfoot , x_axis, math.rad(-6.318681) )
	Turn( rfoot , x_axis, math.rad(-18.626374) )
	Sleep(170)
	Move( pelvis , y_axis, 1.100000  )
	Turn( plate , z_axis, math.rad(5.967033) )
	Turn( rthigh , x_axis, math.rad(31.637363) )
	Turn( lthigh , x_axis, math.rad(-29.175824) )
	Turn( lleg , x_axis, math.rad(38.675824) )
	Turn( lfoot , x_axis, math.rad(-10.175824) )
	Turn( rleg , x_axis, math.rad(-18.626374) )
	Turn( rfoot , x_axis, math.rad(10.538462) )
	Sleep(130)
	Move( pelvis , y_axis, 0.900000  )
	Turn( plate , z_axis, math.rad(4.208791) )
	Turn( rthigh , x_axis, math.rad(19.318681) )
	Turn( lthigh , x_axis, math.rad(-22.137363) )
	Turn( lleg , x_axis, math.rad(32.346154) )
	Turn( rleg , x_axis, math.rad(-31.285714) )
	Turn( rfoot , x_axis, math.rad(30.236264) )
	Sleep(120)
	Move( pelvis , y_axis, 0.800000  )
	Turn( plate , z_axis, math.rad(2.098901) )
	Turn( rthigh , x_axis, math.rad(9.137363) )
	Turn( lthigh , x_axis, math.rad(-8.769231) )
	Turn( lleg , x_axis, math.rad(34.796703) )
	Turn( lfoot , x_axis, math.rad(-24.598901) )
	Turn( rleg , x_axis, math.rad(-31.637363) )
	Turn( rfoot , x_axis, math.rad(40.076923) )
	Sleep(110)
	Move( pelvis , y_axis, 0.750000  )
	Turn( plate , z_axis, 0 )
	Turn( rthigh , x_axis, math.rad(-7.379121) )
	Turn( lthigh , x_axis, math.rad(-6.659341) )
	Turn( lleg , x_axis, math.rad(45.708791) )
	Turn( lfoot , x_axis, math.rad(-39.016484) )
	Turn( rleg , x_axis, math.rad(-31.285714) )
	Turn( rfoot , x_axis, math.rad(47.109890) )
	Sleep(160)
	Move( pelvis , y_axis, 0.850000  )
	Turn( plate , z_axis, math.rad(-2.098901) )
	Turn( rthigh , x_axis, math.rad(-17.219780) )
	Turn( lthigh , x_axis, math.rad(4.549451) )
	Turn( rfoot , x_axis, math.rad(57.307692) )
	Sleep(110)
	Move( pelvis , y_axis, 0.900000  )
	Turn( plate , z_axis, math.rad(-3.857143) )
	Turn( rthigh , x_axis, math.rad(-24.598901) )
	Turn( lthigh , x_axis, math.rad(12.648352) )
	Turn( lfoot , x_axis, math.rad(-42.186813) )
	Turn( rleg , x_axis, math.rad(-21.087912) )
	Turn( rfoot , x_axis, math.rad(62.225275) )
	Sleep(110)
	Move( pelvis , y_axis, 1.100000  )
	Turn( plate , z_axis, math.rad(-5.967033) )
	Turn( rthigh , x_axis, math.rad(-37.258242) )
	Turn( lthigh , x_axis, math.rad(33.038462) )
	Turn( lleg , x_axis, math.rad(33.758242) )
	Turn( rleg , x_axis, math.rad(0.697802) )
	Turn( rfoot , x_axis, math.rad(51.675824) )
	Sleep(110)
	Move( pelvis , y_axis, 1.200000  )
	Turn( plate , z_axis, math.rad(-8.076923) )
	Turn( rthigh , x_axis, math.rad(-40.785714) )
	Turn( lthigh , x_axis, math.rad(47.467033) )
	Turn( lleg , x_axis, math.rad(19.318681) )
	Turn( lfoot , x_axis, math.rad(-41.137363) )
	Turn( rleg , x_axis, math.rad(36.906593) )
	Turn( rfoot , x_axis, math.rad(3.857143) )
	Sleep(170)
	Move( pelvis , y_axis, 1.100000  )
	Turn( plate , z_axis, math.rad(-5.967033) )
	Turn( rthigh , x_axis, math.rad(-29.175824) )
	Turn( lthigh , x_axis, math.rad(35.857143) )
	Turn( lleg , x_axis, math.rad(4.565934) )
	Turn( lfoot , x_axis, math.rad(-19.675824) )
	Turn( rfoot , x_axis, math.rad(-7.725275) )
	Sleep(130)
	Move( pelvis , y_axis, 0.900000  )
	Turn( plate , z_axis, math.rad(-4.208791) )
	Turn( rthigh , x_axis, math.rad(-18.626374) )
	Turn( lthigh , x_axis, math.rad(16.516484) )
	Turn( lleg , x_axis, math.rad(-15.456044) )
	Turn( lfoot , x_axis, math.rad(13.346154) )
	Turn( rleg , x_axis, math.rad(33.395604) )
	Turn( rfoot , x_axis, math.rad(-14.758242) )
	Sleep(120)
	Move( pelvis , y_axis, 0.850000  )
	Turn( plate , z_axis, math.rad(-2.098901) )
	Turn( rthigh , x_axis, math.rad(-10.538462) )
	Turn( lthigh , x_axis, math.rad(4.549451) )
	Turn( lleg , x_axis, math.rad(-23.538462) )
	Turn( lfoot , x_axis, math.rad(36.208791) )
	Turn( rfoot , x_axis, math.rad(-24.247253) )
	Sleep(110)
	Move( pelvis , y_axis, 0.750000  )
	Turn( plate , z_axis, 0 )
	Turn( rthigh , x_axis, math.rad(-1.395604) )
	Turn( lthigh , x_axis, math.rad(-4.917582) )
	Turn( lleg , x_axis, math.rad(-37.967033) )
	Turn( lfoot , x_axis, math.rad(66.456044) )
	Turn( rleg , x_axis, math.rad(36.906593) )
	Turn( rfoot , x_axis, math.rad(-34.456044) )
	Sleep(160)
	Move( pelvis , y_axis, 0.850000  )
	Turn( plate , z_axis, math.rad(2.098901) )
	Turn( rthigh , x_axis, math.rad(13.697802) )
	Turn( lthigh , x_axis, math.rad(-23.549451) )
	Turn( lleg , x_axis, math.rad(-14.049451) )
	Turn( lfoot , x_axis, math.rad(56.258242) )
	Turn( rleg , x_axis, math.rad(26.005495) )
	Turn( rfoot , x_axis, math.rad(-27.769231) )
	Sleep(110)
	Move( pelvis , y_axis, 0.900000  )
	Turn( plate , z_axis, math.rad(4.208791) )
	Turn( rthigh , x_axis, math.rad(22.137363) )
	Turn( lthigh , x_axis, math.rad(-29.175824) )
	Turn( lleg , x_axis, math.rad(-7.368132) )
	Turn( lfoot , x_axis, math.rad(53.087912) )
	Turn( rleg , x_axis, math.rad(17.917582) )
	Turn( rfoot , x_axis, math.rad(-21.445055) )
	Sleep(110)
	Move( pelvis , y_axis, 1.100000  )
	Turn( plate , z_axis, math.rad(5.967033) )
	Turn( rthigh , x_axis, math.rad(36.906593) )
	Turn( lthigh , x_axis, math.rad(-33.758242) )
	Turn( lleg , x_axis, math.rad(6.659341) )
	Turn( lfoot , x_axis, math.rad(42.895604) )
	Turn( rleg , x_axis, math.rad(8.076923) )
	Turn( rfoot , x_axis, math.rad(-13.708791) )
        end
end


local function SMoving()
	SetSignalMask( SIG_MOVE)
	Move( lleg , y_axis, 0.000000  )
	Move( lfoot , z_axis, 0.000000  )
	Move( rleg , y_axis, 0.000000  )
	Move( rfoot , z_axis, 0.000000  )
	Turn( plate , z_axis, 0 )
	Turn( rthigh , x_axis, 0 )
	Turn( lthigh , x_axis, 0 )
	Turn( lleg , x_axis, 0 )
	Turn( lfoot , x_axis, 0 )
	Turn( rleg , x_axis, 0 )
	Turn( rfoot , x_axis, 0 )
end

local function Activate()
        if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	
	Turn( tige , x_axis, math.rad(90.000000), math.rad(85.000000) )
	WaitForTurn(tige, x_axis)
--	dont-cache dish
--	dont-cache d1
--	dont-cache d2
	Turn( d1 , y_axis, math.rad(-90.000000), math.rad(105.000000) )
	Turn( d2 , y_axis, math.rad(90.000000), math.rad(105.000000) )
	WaitForTurn(d2, y_axis)
	Spin( dish , z_axis, 10.000000 , 2.000000 )
	SetUnitValue(COB.ARMORED, 0) 
end

local function Deactivate()

	Turn( dish , z_axis, math.rad(-(0.000000)), math.rad(100.000000) )
	WaitForTurn(dish, z_axis)
--	cache dish
--	cache d1
--	cache d2
	Turn( d1 , y_axis, 0, math.rad(45.000000) )
	Turn( d2 , y_axis, 0, math.rad(45.000000) )
	WaitForTurn(d2, y_axis)
	Turn( tige , x_axis, 0, math.rad(45.000000) )
	WaitForTurn(tige, x_axis)
	SetUnitValue(COB.ARMORED, 1) 
--	 close()
	
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

function script.StartMoving()
	StartThread(Moving)
end

function script.StopMoving()
	Signal( SIG_WALK)
	StartThread(SMoving)
end

function script.Activate()
	StartThread( Activate)
end

function script.Deactivate()
	StartThread( Deactivate)
end


function script.Killed(severity, corpsetype)

	Explode(pelvis, SFX.NONE)
	Explode(lthigh, SFX.NONE)
	Explode(rthigh, SFX.NONE)
	Explode(tige, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(d1, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	if  severity <= 25  then
	
		corpsetype = 1
		return (0)
	end
	Explode(d1, SFX.FALL + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(d2, SFX.FALL + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	Explode(dish, SFX.FALL + SFX.SMOKE  + SFX.EXPLODE_ON_HIT )
	if  severity <= 50  then
	
		corpsetype = 2
		return (0)
	end
	Explode(dish, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	Explode(d1, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	corpsetype = 3
end
