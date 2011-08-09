include "constants.lua"

local base = piece('base')

function script.Create()
	StartThread(SmokeUnit)
end

function script.Killed(recentDamage, maxHealth)

	local severity = recentDamage/maxHealth
	if  severity <= .25  then
		Explode(base, sfxNone)
		--Spring.Echo("LOW")
		return 0
	elseif  severity <= .50  then
		Explode(base, sfxNone)
		--Spring.Echo("MED")
		return 0
	elseif  severity <= .99  then
		Explode(base, sfxNone)
		--Spring.Echo("BIG")
		return 0
	end
	Explode(base, sfxShatter + sfxExplodeOnHit )
	--Spring.Echo("FULL")
	return 0
end
