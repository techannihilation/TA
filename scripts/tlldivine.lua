local base = piece 'base' 
local body = piece 'body' 
local turret = piece 'turret' 
local w1 = piece 'w1' 
local w2 = piece 'w2' 

-- Signal definitions
local SIG_MOVE = 2

local spGetUnitIsStunned = Spring.GetUnitIsStunned
local stunned = 0

local currentSpeed 


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
--[[
local function script.HitByWeapon(anglex, anglez)

	Turn( base , z_axis, math.rad(-(anglez )), math.rad(105.000000) )
	Turn( base , x_axis, math.rad(anglex ), math.rad(105.000000) )
	WaitForTurn(base, z_axis)
	WaitForTurn(base, x_axis)
	Turn( base , z_axis, math.rad(-(0.000000)), math.rad(30.000000) )
	Turn( base , x_axis, 0, math.rad(30.000000) )
end
--]]
local function Moving()
       
        local moveSpeed = GetUnitValue(COB.MAX_SPEED)

	Signal( SIG_MOVE)
	SetSignalMask( SIG_MOVE)
	while true do
	  currentSpeed = GetUnitValue(COB.CURRENT_SPEED)*5 / moveSpeed
	    if currentSpeed <= 1.5 then currentSpeed = 1.5
	    end
	  Sleep(330)
	  --Spring.Echo (currentSpeed)
	  Spin( w1 , x_axis, 1.0 * currentSpeed)
	  Spin( w2 , x_axis, 1.0 * currentSpeed)
	end
end

local function SMoving()
	SetSignalMask( SIG_MOVE)
	StopSpin (w1 , x_axis)
	StopSpin (w2 , x_axis)
end

local function Activate()
        if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	--dont-cache turret
	Spin( turret , y_axis, 6.000000 ,5.000000 )
end

local function Deactivate()
	StopSpin (turret , y_axis)
	WaitForTurn(turret, y_axis)
	--cache turret
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
	Signal( SIG_MOVE)
	StartThread(SMoving)
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
	Explode(turret, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		return 1
	
	elseif  (severity <= .50)  then
		Explode(body, SFX.FALL + SFX.SMOKE  + SFX.FIRE  + SFX.EXPLODE_ON_HIT )
		return 2
	else
	
	Explode(body, SFX.SHATTER + SFX.EXPLODE_ON_HIT )
	return 3
	end
end
