--pieces
local base = piece "base"
local glow = piece "glow"

local lf_leaf = piece "lf_leaf"
local lf_ball = piece "lf_ball"
local lf_thigh = piece "lf_thigh"
local lf_knee = piece "lf_knee"
local lf_foot = piece "lf_foot"

local lb_leaf = piece "lb_leaf"
local lb_ball = piece "lb_ball"
local lb_thigh = piece "lb_thigh"
local lb_knee = piece "lb_knee"
local lb_foot = piece "lb_foot"

local rf_leaf = piece "rf_leaf"
local rf_ball = piece "rf_ball"
local rf_thigh = piece "rf_thigh"
local rf_knee = piece "rf_knee"
local rf_foot = piece "rf_foot"

local rb_leaf = piece "rb_leaf"
local rb_ball = piece "rb_ball"
local rb_thigh = piece "rb_thigh"
local rb_knee = piece "rb_knee"
local rb_foot = piece "rb_foot"

--constants
local sp1 = 1.0
local sp2 = 1.0
local deg = math.rad(-10)
local sleep = 300

local lf_angle = deg
local rf_angle = deg
local lb_angle = deg
local rb_angle = deg

local l_angle = math.rad(30)
local l_speed = math.rad(5)
local k_angle = math.rad(20)
local k_speed = 1

--signals
local walk = 2
local aim = 4
local SIG_Flutter = 1


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

local function Walk()
	Signal(walk)
	SetSignalMask(walk)
	while (true) do
		Turn(base, y_axis, -.2, .5)
		Move(base, y_axis, 2, 5)

		Turn(lf_ball, y_axis, lf_angle, sp1) -- left front leg forward
		Turn(lb_ball, y_axis, -lf_angle, sp2) -- left back leg backward
		Turn(rf_ball, y_axis, rf_angle, sp1) -- right front leg forward
		Turn(rb_ball, y_axis, -rf_angle, sp2) -- right back leg backward

		Turn(lf_knee, x_axis, -k_angle, k_speed) -- extend
		Turn(lf_knee, z_axis, k_angle, k_speed)

		Turn(lb_knee, x_axis, k_angle, k_speed) -- extend
		Turn(lb_knee, z_axis, k_angle, k_speed)

		Turn(rf_knee, x_axis, 0, k_speed) -- contract
		Turn(rf_knee, z_axis, 0, k_speed)

		Turn(rb_knee, x_axis, 0, k_speed) -- contract
		Turn(rb_knee, z_axis, 0, k_speed)

		Sleep(sleep)
		--------------------------------------------------------------------
		Move(base, y_axis, -2, 4)


		Sleep(sleep)
		--------------------------------------------------------------------
		Turn(base, y_axis, .2, .5)
		Move(base, y_axis, 2, 5)

		Turn(lf_ball, y_axis, -lb_angle, sp2) -- left front leg backward
		Turn(lb_ball, y_axis, lb_angle, sp1) -- left front leg forward
		Turn(rf_ball, y_axis, -rb_angle, sp2) -- right front leg backward
		Turn(rb_ball, y_axis, rb_angle, sp1) -- right back leg forward

		Turn(lf_knee, x_axis, 0, k_speed) -- contract
		Turn(lf_knee, z_axis, 0, k_speed)

		Turn(lb_knee, x_axis, 0, k_speed) -- contract
		Turn(lb_knee, z_axis, 0, k_speed)

		Turn(rf_knee, x_axis, -k_angle, k_speed) -- extend
		Turn(rf_knee, z_axis, -k_angle, k_speed)

		Turn(rb_knee, x_axis, k_angle, k_speed) -- extend
		Turn(rb_knee, z_axis, -k_angle, k_speed)

		Sleep(sleep)
		--------------------------------------------------------------------
		Move(base, y_axis, -2, 4)


		Sleep(sleep)
		--------------------------------------------------------------------
	end
end

local function Flutter()
	Signal(SIG_Flutter)
	SetSignalMask(SIG_Flutter)
	Sleep(2000)
		Turn(lf_leaf, x_axis, l_angle, l_speed)
		Turn(lf_leaf, z_axis, -l_angle, l_speed)
		Turn(rf_leaf, x_axis, l_angle, l_speed)
		Turn(rf_leaf, z_axis, l_angle, l_speed)
		Turn(lb_leaf, x_axis, -l_angle, l_speed)
		Turn(lb_leaf, z_axis, -l_angle, l_speed)
		Turn(rb_leaf, x_axis, -l_angle, l_speed)
		Turn(rb_leaf, z_axis, l_angle, l_speed)
		WaitForTurn(lf_leaf, x_axis)
		WaitForTurn(lf_leaf, z_axis)
		Sleep(1200)
end

function script.Create()
	Spring.SetUnitRulesParam(unitID, "unitActiveOverride", 1)	-- don't lose jitter effect with on/off button
	Turn(lf_leaf, x_axis, l_angle, 1)
	Turn(lf_leaf, z_axis, -l_angle, 1)
	Turn(rf_leaf, x_axis, l_angle, 1)
	Turn(rf_leaf, z_axis, l_angle, 1)
	Turn(lb_leaf, x_axis, -l_angle, 1)
	Turn(lb_leaf, z_axis, -l_angle, 1)
	Turn(rb_leaf, x_axis, -l_angle, 1)
	Turn(rb_leaf, z_axis, l_angle, 1)
	StartThread(Flutter)
	StartThread(StunnedCheck)
end

function script.Activate()
	Spring.SetUnitRulesParam(unitID, "shieldChargeDisabled", 0, ALLY_ACCESS)
end

function script.Deactivate()
	Spring.SetUnitRulesParam(unitID, "shieldChargeDisabled", 1, ALLY_ACCESS)
end

local function Stopping()
	Signal(walk)
	SetSignalMask(walk)
	--Spin(glow, y_axis, 1)
	Move(base, y_axis, 0, 15)
	Turn(base, y_axis, 0, 1)

	Turn(lf_ball, y_axis, 0, 1)
	Turn(rf_ball, y_axis, 0, 1)
	Turn(lb_ball, y_axis, 0, 1)
	Turn(rb_ball, y_axis, 0, 1)

	Turn(lf_knee, x_axis, 0, 1)
	Turn(lf_knee, z_axis, 0, 1)
	Turn(rf_knee, x_axis, 0, 1)
	Turn(rf_knee, z_axis, 0, 1)
	Turn(lb_knee, x_axis, 0, 1)
	Turn(lb_knee, z_axis, 0, 1)
	Turn(rb_knee, x_axis, 0, 1)
	Turn(rb_knee, z_axis, 0, 1)
end

function script.StartMoving()
	StartThread(Walk)
end

function script.StopMoving()
	StartThread(Stopping)
end

function script.Killed(recentDamage, maxHealth)
	Explode(base, SFX.EXPLODE)

	Explode(lf_leaf, SFX.EXPLODE)
	Explode(rf_leaf, SFX.EXPLODE)
	Explode(lb_leaf, SFX.EXPLODE)
	Explode(rb_leaf, SFX.EXPLODE)

	Explode(lf_foot, SFX.EXPLODE)
	Explode(rf_foot, SFX.EXPLODE)
	Explode(lb_foot, SFX.EXPLODE)
	Explode(rb_foot, SFX.EXPLODE)

	Explode(lf_ball, SFX.EXPLODE)
	Explode(rf_ball, SFX.EXPLODE)
	Explode(lb_ball, SFX.EXPLODE)
	Explode(rb_ball, SFX.EXPLODE)

	local severity = recentDamage / maxHealth

	if (severity <= .25) then
		return 1 -- corpsetype
	elseif (severity <= .5) then
		return 1 -- corpsetype
	else
		return 2 -- corpsetype
	end
end
