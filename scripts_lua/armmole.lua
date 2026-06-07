local base = piece 'base'
local body = piece 'body'
local armor_top = piece 'armor_top'
local team_plate = piece 'team_plate'
local head = piece 'head'
local eye_l = piece 'eye_l'
local eye_r = piece 'eye_r'
local snout = piece 'snout'
local drill = piece 'drill'
local muzzle = piece 'muzzle'
local front_leg_l = piece 'front_leg_l'
local front_leg_r = piece 'front_leg_r'
local mid_leg_l = piece 'mid_leg_l'
local mid_leg_r = piece 'mid_leg_r'
local rear_leg_l = piece 'rear_leg_l'
local rear_leg_r = piece 'rear_leg_r'
local front_foot_l = piece 'front_foot_l'
local front_foot_r = piece 'front_foot_r'
local mid_foot_l = piece 'mid_foot_l'
local mid_foot_r = piece 'mid_foot_r'
local rear_foot_l = piece 'rear_foot_l'
local rear_foot_r = piece 'rear_foot_r'
local claw_l = piece 'claw_l'
local claw_r = piece 'claw_r'
local rear_claw_l = piece 'rear_claw_l'
local rear_claw_r = piece 'rear_claw_r'
local tail = piece 'tail'
local dirt = piece 'dirt'

local SIG_MOVE = 1
local SIG_AIM = 2

local function Moving()
	Signal(SIG_MOVE)
	SetSignalMask(SIG_MOVE)

	Spin(dirt, y_axis, math.rad(160), math.rad(90))
	Spin(drill, z_axis, math.rad(520), math.rad(220))

	while true do
		Move(body, y_axis, -1.8, 10)
		Move(head, y_axis, -1.2, 9)
		Move(snout, y_axis, -1.4, 9)
		Turn(body, x_axis, math.rad(6), math.rad(95))
		Turn(head, x_axis, math.rad(-7), math.rad(115))
		Turn(front_leg_l, x_axis, math.rad(34), math.rad(210))
		Turn(front_leg_r, x_axis, math.rad(-28), math.rad(210))
		Turn(mid_leg_l, x_axis, math.rad(-24), math.rad(190))
		Turn(mid_leg_r, x_axis, math.rad(28), math.rad(190))
		Turn(rear_leg_l, x_axis, math.rad(26), math.rad(180))
		Turn(rear_leg_r, x_axis, math.rad(-30), math.rad(180))
		Turn(front_foot_l, z_axis, math.rad(-22), math.rad(190))
		Turn(front_foot_r, z_axis, math.rad(18), math.rad(190))
		Turn(mid_foot_l, z_axis, math.rad(18), math.rad(170))
		Turn(mid_foot_r, z_axis, math.rad(-20), math.rad(170))
		Turn(rear_foot_l, z_axis, math.rad(-18), math.rad(160))
		Turn(rear_foot_r, z_axis, math.rad(20), math.rad(160))
		Turn(claw_l, z_axis, math.rad(-34), math.rad(210))
		Turn(claw_r, z_axis, math.rad(30), math.rad(210))
		Turn(rear_claw_l, z_axis, math.rad(16), math.rad(130))
		Turn(rear_claw_r, z_axis, math.rad(-16), math.rad(130))
		Turn(tail, z_axis, math.rad(10), math.rad(95))
		Sleep(160)

		Move(body, y_axis, 0.8, 10)
		Move(head, y_axis, 0.8, 9)
		Move(snout, y_axis, 1.0, 9)
		Turn(body, x_axis, math.rad(-5), math.rad(95))
		Turn(head, x_axis, math.rad(7), math.rad(115))
		Turn(front_leg_l, x_axis, math.rad(-30), math.rad(210))
		Turn(front_leg_r, x_axis, math.rad(34), math.rad(210))
		Turn(mid_leg_l, x_axis, math.rad(30), math.rad(190))
		Turn(mid_leg_r, x_axis, math.rad(-24), math.rad(190))
		Turn(rear_leg_l, x_axis, math.rad(-30), math.rad(180))
		Turn(rear_leg_r, x_axis, math.rad(26), math.rad(180))
		Turn(front_foot_l, z_axis, math.rad(20), math.rad(190))
		Turn(front_foot_r, z_axis, math.rad(-22), math.rad(190))
		Turn(mid_foot_l, z_axis, math.rad(-20), math.rad(170))
		Turn(mid_foot_r, z_axis, math.rad(18), math.rad(170))
		Turn(rear_foot_l, z_axis, math.rad(22), math.rad(160))
		Turn(rear_foot_r, z_axis, math.rad(-18), math.rad(160))
		Turn(claw_l, z_axis, math.rad(34), math.rad(210))
		Turn(claw_r, z_axis, math.rad(-34), math.rad(210))
		Turn(rear_claw_l, z_axis, math.rad(-16), math.rad(130))
		Turn(rear_claw_r, z_axis, math.rad(16), math.rad(130))
		Turn(tail, z_axis, math.rad(-10), math.rad(95))
		Sleep(160)
	end
end

local function RestorePose()
	SetSignalMask(SIG_MOVE)

	StopSpin(dirt, y_axis)
	StopSpin(drill, z_axis)
	Move(body, y_axis, 0, 8)
	Move(head, y_axis, 0, 8)
	Move(snout, y_axis, 0, 8)
	Move(muzzle, z_axis, 0, 20)
	Turn(body, x_axis, 0, math.rad(90))
	Turn(head, x_axis, 0, math.rad(110))
	Turn(snout, x_axis, 0, math.rad(120))
	Turn(front_leg_l, x_axis, 0, math.rad(180))
	Turn(front_leg_r, x_axis, 0, math.rad(180))
	Turn(mid_leg_l, x_axis, 0, math.rad(170))
	Turn(mid_leg_r, x_axis, 0, math.rad(170))
	Turn(rear_leg_l, x_axis, 0, math.rad(160))
	Turn(rear_leg_r, x_axis, 0, math.rad(160))
	Turn(front_foot_l, z_axis, 0, math.rad(170))
	Turn(front_foot_r, z_axis, 0, math.rad(170))
	Turn(mid_foot_l, z_axis, 0, math.rad(160))
	Turn(mid_foot_r, z_axis, 0, math.rad(160))
	Turn(rear_foot_l, z_axis, 0, math.rad(150))
	Turn(rear_foot_r, z_axis, 0, math.rad(150))
	Turn(claw_l, z_axis, 0, math.rad(160))
	Turn(claw_r, z_axis, 0, math.rad(160))
	Turn(rear_claw_l, z_axis, 0, math.rad(110))
	Turn(rear_claw_r, z_axis, 0, math.rad(110))
	Turn(tail, z_axis, 0, math.rad(100))
end

local function RestoreAim()
	SetSignalMask(SIG_AIM)
	Sleep(1600)
	Turn(head, y_axis, 0, math.rad(130))
	Turn(snout, x_axis, 0, math.rad(130))
end

function script.Create()
	Move(dirt, y_axis, -0.4, 20)
end

function script.StartMoving()
	StartThread(Moving)
end

function script.StopMoving()
	Signal(SIG_MOVE)
	StartThread(RestorePose)
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)

	Turn(head, y_axis, heading, math.rad(240))
	Turn(snout, x_axis, -pitch, math.rad(180))
	WaitForTurn(head, y_axis)
	WaitForTurn(snout, x_axis)
	StartThread(RestoreAim)
	return true
end

function script.AimFromWeapon(num)
	return head
end

function script.QueryWeapon(num)
	return muzzle
end

function script.FireWeapon(num)
	Move(snout, z_axis, -0.35, 24)
	Move(muzzle, z_axis, -0.55, 30)
	Sleep(80)
	Move(snout, z_axis, 0, 12)
	Move(muzzle, z_axis, 0, 18)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if severity <= 0.5 then
		Explode(armor_top, SFX.FALL + SFX.SMOKE)
		Explode(team_plate, SFX.FALL)
		Explode(head, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(snout, SFX.FALL + SFX.SMOKE)
		Explode(drill, SFX.FALL + SFX.SMOKE)
		Explode(claw_l, SFX.FALL)
		Explode(claw_r, SFX.FALL)
		return 1
	end

	Explode(body, SFX.SHATTER + SFX.EXPLODE_ON_HIT)
	Explode(armor_top, SFX.FALL + SFX.SMOKE + SFX.FIRE)
	Explode(team_plate, SFX.FALL + SFX.SMOKE)
	Explode(head, SFX.SHATTER + SFX.EXPLODE_ON_HIT)
	Explode(eye_l, SFX.FALL)
	Explode(eye_r, SFX.FALL)
	Explode(snout, SFX.SHATTER + SFX.EXPLODE_ON_HIT)
	Explode(drill, SFX.FALL + SFX.SMOKE + SFX.EXPLODE_ON_HIT)
	Explode(muzzle, SFX.FALL)
	Explode(front_leg_l, SFX.FALL + SFX.SMOKE)
	Explode(front_leg_r, SFX.FALL + SFX.SMOKE)
	Explode(mid_leg_l, SFX.FALL + SFX.SMOKE)
	Explode(mid_leg_r, SFX.FALL + SFX.SMOKE)
	Explode(rear_leg_l, SFX.FALL + SFX.SMOKE)
	Explode(rear_leg_r, SFX.FALL + SFX.SMOKE)
	Explode(claw_l, SFX.FALL + SFX.SMOKE)
	Explode(claw_r, SFX.FALL + SFX.SMOKE)
	Explode(rear_claw_l, SFX.FALL + SFX.SMOKE)
	Explode(rear_claw_r, SFX.FALL + SFX.SMOKE)
	Explode(tail, SFX.FALL + SFX.SMOKE)
	return 2
end
