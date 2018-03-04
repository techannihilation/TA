local base = piece 'base' 
local baseb = piece 'baseb' 
local radar = piece 'radar' 

local spGetUnitIsStunned = Spring.GetUnitIsStunned
local stunned = 0

local TechName = 'Advanced T1 Unit Research Centre'
local team = Spring.GetUnitTeam(unitID)

local currentTechCount
local new = 0

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
  --      if stunned and stunned == 1 then SetUnitValue(COB.ACTIVATION, 0) return end -- ADDED FOR STUNABLE
	Spin( radar , y_axis, math.rad(60.010989))
end

local function Deactivate()
	StopSpin ( radar , y_axis, 0.000000 )
end

--[[
local function TechLostOut() -- callout dont use TechLost or TechGranted is brmt callin
  Spring.Echo("Techlost")
  GG.TechGrant(TechName,team,-1)
end

local function TechGrantedOut()
     Spring.Echo("Techgranted")
-- if new < 1 then
   GG.TechGrant(TechName,team,1)
 -- end
  new = new + 1
end
--]]

function script.Create()
	--StartThread(StunnedCheck)
	StartThread(SmokeUnit)
	local health_percent = get_health_percent()
	while (health_percent < 100) do
		Sleep(250)
	end
  	StartThread(Activate)
end

function script.Activate()
  --	StartThread( TechGrantedOut)
	StartThread( Activate)
end

function script.Deactivate()
  --	StartThread( TechLostOut)
	StartThread( Deactivate)
end


function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	if  (severity <= .25)  then
		Explode(baseb, SFX.SHATTER + SFX.FALL + SFX.SMOKE)
		Explode(radar, SFX.FALL + SFX.SMOKE)
		return 1
	
	elseif  (severity <= .50)  then
		Explode(baseb, SFX.SHATTER + SFX.FALL + SFX.SMOKE)
		Explode(radar, SFX.SMOKE + SFX.FIRE + SFX.EXPLODE)
		return 2
	else
		Explode(baseb, SFX.SHATTER + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE)
		Explode(radar, SFX.SMOKE + SFX.FIRE + SFX.EXPLODE)
	return 3
	end
end
