function widget:GetInfo()
	return {
	version   = "8",
	name      = "BG color",
	desc      = "BG Color",
	author    = "Nixtux",
	date      = "Apr 16, 2017", --last change August 29,2009
	license   = "GNU GPL, v2 or later",
	layer     = 0,
	enabled   = true,
	}
end

local glReadPixels = gl.ReadPixels
local glTexture = gl.Texture
local minimapbrightness = nil

function widget:DrawScreen()
	if minimapbrightness == nil then
		--get 100 points on minimap
		glTexture("$minimap")

		local r=0
		local g=0
		local b=0
		local a=0
		local cnt =0
		for x=1, 9 do
			
			for y= 1, 9 do
				local pr,pg,pb,pa = glReadPixels(50+10*x,50+10*y,1,1)
				r=r+pr/81
				g=g+pg/81
				b=b+pb/81
				a=a+pa/81
				cnt=cnt+1
			end
		end
		glTexture(false)
		local OldMax, OldMin, NewMax, NewMin = 0.95,0.05,0.85,0.60
		minimapbrightness=(r*0.3)+(g*0.5)+(b*0.2)
		if minimapbrightness > OldMax then
			Spring.Echo("nix new value found please adjust ", minimapbrightness)
			minimapbrightness = OldMax
		elseif minimapbrightness < OldMin then
			Spring.Echo("nix new value found please adjust ", minimapbrightness)
			minimapbrightness = OldMin
		end
		--Spring.Echo("Minimap brightness values:",minimapbrightness,cnt,r,g,b,a)		
		local OldRange = (OldMax - OldMin) --darkmap - blindside
		local NewRange = (NewMax - NewMin)
		minimapbrightness = (((minimapbrightness - OldMin) * NewRange) / OldRange) + NewMin
		minimapbrightness = (NewMax + NewMin) - minimapbrightness
		--Spring.Echo("Background opacity values:",minimapbrightness)		

		if WG["background_color"] == nil then
			WG["background_color"] = minimapbrightness
			WG["background_color_over"] = minimapbrightness
		end
	end
end
