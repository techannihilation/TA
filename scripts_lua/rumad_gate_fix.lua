--pieces
local base = piece "base"
local glow = piece "glow"

local lf_leaf = piece "lf_leaf"
local lb_leaf = piece "lb_leaf"
local rf_leaf = piece "rf_leaf"
local rb_leaf = piece "rb_leaf"

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

function script.Killed(recentDamage, maxHealth)
	Explode(base, SFX.EXPLODE)

	Explode(lf_leaf, SFX.EXPLODE)
	Explode(rf_leaf, SFX.EXPLODE)
	Explode(lb_leaf, SFX.EXPLODE)
	Explode(rb_leaf, SFX.EXPLODE)

	local severity = recentDamage / maxHealth

	if (severity <= .25) then
		return 1 -- corpsetype
	elseif (severity <= .5) then
		return 1 -- corpsetype
	else
		return 2 -- corpsetype
	end
end
