include "constants.lua"

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
	Explode(bottomBody, sfxShatter )
	Explode(topCover, sfxShatter )
	Explode(bottomCover, sfxShatter)
	Explode(topBody, sfxExplode)
	--Spring.Echo("FULL")
	return 0
end
