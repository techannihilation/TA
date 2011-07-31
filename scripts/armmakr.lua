include "constants.lua"

local base, sphere = piece('base', 'sphere')
local WHAT_DO = 1024
local  mmState


function ImAMetalMaker()
	while (GetUnitValue(COB.BUILD_PERCENT_LEFT) ~= 0) do Sleep(150) end
	
	mmState = -1
	
	while  true  do
		if (GetUnitValue(WHAT_DO) == 1) then
			if mmState ~= 1 then 
				Move( sphere , y_axis, -1.0 , 5.2)
				mmState = 1
			end
		else
			if mmState ~= 0 then 
				Move( sphere , y_axis, -5.4 , 5.2)
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

function script.Killed(recentDamage, maxHealth)

	local severity = recentDamage/maxHealth
	if  severity <= .25  then
		Explode(sphere, sfxNone)
		Explode(base, sfxNone )
		--Spring.Echo("LOW")
		return 0
	elseif  severity <= .50  then
		Explode(sphere, sfxNone)
		Explode(base, sfxShatter)
		--Spring.Echo("MED")
		return 0
	elseif  severity <= .99  then
		Explode(sphere, sfxExplode)
		Explode(base, sfxShatter)
		--Spring.Echo("BIG")
		return 0
	end
	Explode(base, sfxShatter + sfxExplodeOnHit )
	Explode(sphere, sfxFall + sfxSmoke  + sfxFire  + sfxExplodeOnHit )
	--Spring.Echo("FULL")
	return 0
end
