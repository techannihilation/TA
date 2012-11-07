local bottomCover, bottomBody, 
topCover, outerPistle, 
insides, innerPistle, 
pistleCover, topBody = piece(
'bottomCover', 'bottomBody', 
'topCover', 'outerPistle', 
'insides', 'innerPistle', 
'pistleCover', 'topBody'
)
local WHAT_DO = 1024
local  mmState

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

function ImAMetalMaker()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) ~= 0) do Sleep(150) end
	
	mmState = -1
	
	
	local scale = 1.98
	local stime = 500
	while  true  do
		if (GetUnitValue(WHAT_DO) == 1) then
			if mmState ~= 1 then 
				
				
				Move( innerPistle,  y_axis , 14*scale , 14*scale * 1000/stime)
				Sleep(stime)

				Move( outerPistle,  y_axis , 14*scale , 14*scale * 1000/stime)
				Sleep(stime)

				Move( bottomCover,  y_axis , 12*scale , 12*scale * 1000/stime)
				Move( topCover,  y_axis , 12*scale , 12*scale * 1000/stime)
				Move( topBody,  y_axis , 12*scale , 12*scale * 1000/stime)
				Move( insides,  y_axis , 12*scale , 12*scale * 1000/stime)
				Move( pistleCover,  y_axis , 12*scale , 12*scale * 1000/stime)
				Sleep(stime)
				
				Move( bottomCover,  y_axis , 6*scale , 6*scale * 1000/stime)
				Move( topCover,  y_axis , 19.5*scale , 7.5*scale * 1000/stime)
				Move( innerPistle,  y_axis , 12*scale , 2*scale * 1000/stime)
				Move( outerPistle,  y_axis , 12*scale , 2*scale * 1000/stime)
				Sleep(stime)
				
				mmState = 1
			end
		else
			if mmState ~= 0 then 

				Move( bottomCover,  y_axis , 12*scale , 6*scale * 1000/stime)
				Move( topCover,  y_axis , 12*scale , 7.5*scale * 1000/stime)
				Move( innerPistle,  y_axis , 14*scale , 2*scale * 1000/stime)
				Move( outerPistle,  y_axis , 14*scale , 2*scale * 1000/stime)
				Sleep(stime)

				Move( bottomCover,  y_axis , 0*scale , 12*scale * 1000/stime)
				Move( topCover,  y_axis , 0*scale , 12*scale * 1000/stime)
				Move( topBody,  y_axis , 0*scale , 12*scale * 1000/stime)
				Move( insides,  y_axis , 0*scale , 12*scale  * 1000/stime)
				Move( pistleCover,  y_axis , 0*scale , 12*scale * 1000/stime)
				Sleep(stime)

				Move( outerPistle,  y_axis , 0*scale , 14*scale * 1000/stime)
				Sleep(stime)
				
				Move( innerPistle,  y_axis , 0*scale , 14*scale * 1000/stime)
				Sleep(stime)
				
				mmState = 0
			end
		end
		Sleep(1000)
	end
end

function script.Create()
	StartThread(SmokeUnit)
	StartThread(ImAMetalMaker)
end

function script.ImAMetalMaker()
	StartThread( ImAMetalMaker)
end

function script.Killed(recentDamage, maxHealth)

	-- local severity = recentDamage/maxHealth
	-- if  severity <= .25  then
		-- Explode(topBody, sfxNone)
		-- Explode(bottomBody, sfxNone )
		-- Spring.Echo("LOW")
		-- return 0
	-- elseif  severity <= .50  then
		-- Explode(topBody, sfxNone)
		-- Explode(bottomBody, sfxShatter)
		-- Spring.Echo("MED")
		-- return 0
	-- elseif  severity <= .99  then
		-- Explode(topBody, sfxExplode)
		-- Explode(bottomBody, sfxShatter)
		-- Spring.Echo("BIG")
		-- return 0
	-- end
	Explode(bottomBody, SFX.SHATTER )
	Explode(topCover, SFX.SHATTER )
	Explode(bottomCover, SFX.SHATTER)
	Explode(topBody, SFX.SHATTER)
	--Spring.Echo("FULL")
	return 0
end
